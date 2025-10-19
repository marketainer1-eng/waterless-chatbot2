#!/bin/bash

echo "========================================="
echo "🎨 워터리스 페인트 챗봇 v2.0"
echo "========================================="
echo ""
echo "백엔드 서버를 시작합니다..."
echo ""

cd backend

# .env 파일 확인
if [ ! -f ".env" ]; then
    echo "❌ 오류: .env 파일이 없습니다!"
    echo "   backend/.env 파일을 생성하고 OPENAI_API_KEY를 설정해주세요."
    exit 1
fi

# API 키 확인
if ! grep -q "OPENAI_API_KEY=sk-" .env; then
    echo "⚠️  경고: .env 파일에 OpenAI API 키가 설정되지 않았습니다."
    echo "   backend/.env 파일을 열어 다음과 같이 설정해주세요:"
    echo ""
    echo "   OPENAI_API_KEY=sk-your-actual-api-key-here"
    echo ""
    read -p "그래도 계속하시겠습니까? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# node_modules 확인
if [ ! -d "node_modules" ]; then
    echo "📦 패키지를 설치합니다..."
    npm install
    echo ""
fi

echo "🚀 서버를 시작합니다..."
echo "   URL: http://localhost:3002"
echo ""
echo "⚠️  서버를 종료하려면 Ctrl+C를 누르세요."
echo ""

node server.js
