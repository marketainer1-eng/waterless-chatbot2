#!/bin/bash

echo "========================================="
echo "🌐 워터리스 페인트 챗봇 프론트엔드"
echo "========================================="
echo ""
echo "프론트엔드 서버를 시작합니다..."
echo ""

cd frontend

echo "🚀 웹 서버를 시작합니다..."
echo "   URL: http://localhost:8081"
echo ""
echo "⚠️  서버를 종료하려면 Ctrl+C를 누르세요."
echo ""
echo "📱 웹 브라우저에서 http://localhost:8081 을 열어주세요!"
echo ""

python3 -m http.server 8081
