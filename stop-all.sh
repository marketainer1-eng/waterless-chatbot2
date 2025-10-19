#!/bin/bash

echo "========================================="
echo "🛑 워터리스 페인트 챗봇 v2.0"
echo "   서버 종료"
echo "========================================="
echo ""

# PID 파일에서 읽기
if [ -f ".backend.pid" ]; then
    BACKEND_PID=$(cat .backend.pid)
    if ps -p $BACKEND_PID > /dev/null 2>&1; then
        echo "🛑 백엔드 서버 종료 중... (PID: $BACKEND_PID)"
        kill $BACKEND_PID 2>/dev/null
        rm .backend.pid
    else
        echo "⚠️  백엔드 서버가 실행 중이 아닙니다."
        rm .backend.pid 2>/dev/null
    fi
fi

if [ -f ".frontend.pid" ]; then
    FRONTEND_PID=$(cat .frontend.pid)
    if ps -p $FRONTEND_PID > /dev/null 2>&1; then
        echo "🛑 프론트엔드 서버 종료 중... (PID: $FRONTEND_PID)"
        kill $FRONTEND_PID 2>/dev/null
        rm .frontend.pid
    else
        echo "⚠️  프론트엔드 서버가 실행 중이 아닙니다."
        rm .frontend.pid 2>/dev/null
    fi
fi

# 혹시 모를 프로세스 정리
pkill -f "node server.js" 2>/dev/null
pkill -f "http.server 8081" 2>/dev/null

echo ""
echo "✅ 모든 서버가 종료되었습니다."
echo ""
