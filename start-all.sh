#!/bin/bash

echo "========================================="
echo "🎨 워터리스 페인트 챗봇 v2.0"
echo "   전체 시스템 시작"
echo "========================================="
echo ""

# .env 파일 확인
if [ ! -f "backend/.env" ]; then
    echo "❌ 오류: backend/.env 파일이 없습니다!"
    echo "   backend/.env 파일을 생성하고 OPENAI_API_KEY를 설정해주세요."
    exit 1
fi

# API 키 확인
if ! grep -q "OPENAI_API_KEY=sk-" backend/.env; then
    echo "⚠️  경고: OpenAI API 키가 설정되지 않았습니다."
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
if [ ! -d "backend/node_modules" ]; then
    echo "📦 백엔드 패키지를 설치합니다..."
    cd backend
    npm install
    cd ..
    echo ""
fi

echo "🚀 백엔드 서버를 시작합니다..."
cd backend
node server.js > ../backend.log 2>&1 &
BACKEND_PID=$!
cd ..
echo "   ✅ 백엔드 PID: $BACKEND_PID"
echo "   📝 로그: backend.log"
sleep 3

echo ""
echo "🌐 프론트엔드 서버를 시작합니다..."
cd frontend
python3 -m http.server 8081 > ../frontend.log 2>&1 &
FRONTEND_PID=$!
cd ..
echo "   ✅ 프론트엔드 PID: $FRONTEND_PID"
echo "   📝 로그: frontend.log"
sleep 2

echo ""
echo "========================================="
echo "✅ 모든 서버가 시작되었습니다!"
echo "========================================="
echo ""
echo "🌐 웹 브라우저에서 접속:"
echo "   👉 http://localhost:8081"
echo ""
echo "🔧 백엔드 API:"
echo "   👉 http://localhost:3002"
echo ""
echo "📊 서버 종료 방법:"
echo "   kill $BACKEND_PID $FRONTEND_PID"
echo ""
echo "   또는 다음 명령 실행:"
echo "   ./stop-all.sh"
echo ""
echo "📝 실시간 로그 확인:"
echo "   tail -f backend.log"
echo "   tail -f frontend.log"
echo ""

# PID 저장
echo "$BACKEND_PID" > .backend.pid
echo "$FRONTEND_PID" > .frontend.pid

echo "Press Enter to view backend log (Ctrl+C to exit)..."
tail -f backend.log
