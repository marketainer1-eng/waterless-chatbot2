# 워터리스 페인트 AI 챗봇 v2.0 🎨

실제 고객 Q&A 데이터 기반으로 구축된 워터리스 페인트 전문 AI 상담 챗봇입니다.

## 🌟 주요 기능

### v2.0 고도화 업데이트
- ✅ **6개 제품 라인업 완벽 지원**
  - 워터리스 ULTRA 4L / 10L
  - 워터리스 HYPER 10L
  - SUPER 프라이머 3.5L
  - 바르는 곰팡이 제거제 500ml
  - DIY 키트 (10종)

- ✅ **실제 고객 질문 패턴 분석 반영**
  - 네이버 스마트스토어 Q&A
  - 네이버 톡톡 상담 내역
  - 유튜브 댓글 질문
  - 500건 이상의 실제 데이터 기반

- ✅ **지능형 의도 분석 시스템**
  - 제품 문의 / 시공 방법 / 표면 호환성 / 용량 계산 / 문제 해결
  - 컨텍스트 기반 대화 추적
  - 빈번한 오해 사항 자동 감지 및 선제 응답

- ✅ **시공 방법별 용량 계산기**
  - 롤러 시공: 5-6㎡/L
  - 붓 시공: 6-7㎡/L
  - 스프레이건: 4-5㎡/L
  - 도포 횟수별 자동 계산

- ✅ **특수 케이스 처리**
  - 탄성코트/세라믹코트 제거 필수 안내
  - 실크벽지 vs 합지벽지 구분
  - 신축 아파트 시공법
  - 프라이머(젯소) 사용 가이드

## 📦 시스템 요구사항

- Node.js 18.x 이상
- npm 9.x 이상
- OpenAI API 키 (GPT-4)

## 🚀 설치 및 실행 방법

### 1️⃣ 프로젝트 설정

```bash
# 백엔드 디렉토리로 이동
cd waterless-chatbot-v2/backend

# 패키지 설치
npm install

# 환경 변수 설정
# .env 파일을 열어 OpenAI API 키를 입력하세요
nano .env
# 또는
code .env
```

### 2️⃣ 환경 변수 설정 (.env 파일)

```env
OPENAI_API_KEY=sk-your-actual-openai-api-key-here
PORT=3002
NODE_ENV=development
SESSION_SECRET=waterless_paint_chatbot_v2_secret_key_change_this_in_production
FRONTEND_URL=http://localhost:8081
```

⚠️ **중요**: `OPENAI_API_KEY`에 실제 OpenAI API 키를 입력해야 합니다!

### 3️⃣ 서버 실행

```bash
# 백엔드 서버 시작
cd waterless-chatbot-v2/backend
npm start

# 개발 모드 (자동 재시작)
npm run dev
```

서버가 정상 실행되면 다음 메시지가 표시됩니다:
```
✅ 워터리스 페인트 AI 챗봇 v2.0 서버가 포트 3002에서 실행 중입니다
```

### 4️⃣ 프론트엔드 실행

**새 터미널 창을 열어서:**

```bash
# 프론트엔드 디렉토리로 이동
cd waterless-chatbot-v2/frontend

# 간단한 HTTP 서버 실행 (Python 3)
python3 -m http.server 8081

# 또는 Node.js http-server 사용
npx http-server -p 8081
```

### 5️⃣ 웹 브라우저로 접속

```
http://localhost:8081
```

## 🏗️ 프로젝트 구조

```
waterless-chatbot-v2/
├── backend/
│   ├── server.js              # Express 서버, API 엔드포인트
│   ├── knowledgeBase.js       # 제품 정보, FAQ, 시공 가이드
│   ├── package.json           # 의존성 관리
│   └── .env                   # 환경 변수 (API 키)
│
├── frontend/
│   ├── index.html             # 챗봇 UI
│   ├── style.css              # 스타일링
│   └── script.js              # 클라이언트 로직
│
└── README.md                  # 이 파일
```

## 🔌 API 엔드포인트

### 1. 챗봇 대화
```
POST /api/chat
Content-Type: application/json

{
  "message": "32평 아파트에 몇 통 필요한가요?",
  "sessionId": "session_xxx"
}
```

### 2. 제품 목록 조회
```
GET /api/products
```

### 3. FAQ 조회
```
GET /api/faqs
```

### 4. 시공 가이드 조회
```
GET /api/construction-guide
```

### 5. 서버 상태 확인
```
GET /api/health
```

## 💡 사용 예시

### 빠른 질문 예시
1. **제품 문의**: "제품 종류와 가격이 궁금해요"
2. **시공 방법**: "시공 방법을 알려주세요"
3. **호환성 확인**: "우리 집에 사용 가능한가요?"
4. **용량 계산**: "32평 아파트에 몇 통 필요한가요?"

### 실제 고객 질문 예시
- "탄성코트 위에 칠할 수 있나요?"
- "실크벽지에도 가능한가요?"
- "롤러로 칠하면 물 타야 하나요?"
- "한 번 칠하고 바로 덧칠해도 되나요?"
- "신축 아파트인데 바로 칠할 수 있나요?"
- "프라이머(젯소)를 꼭 발라야 하나요?"

## 🎯 핵심 지식 베이스

### 제품 사양
- **워터리스 ULTRA 10L**: 40㎡(12평) 1회 도포 기준
- **최소 도포 횟수**: 2-3회 권장
- **건조 시간**: 표면 1시간, 완전 24시간
- **KS M 6010**: 항곰팡이 시험 만점

### 시공 가능 표면
✅ 콘크리트, 수성페인트, 합지벽지, 석고보드, 이보드, 합판  
❌ 실크벽지, 타일, 유리, 플라스틱, SMC천장  
⚠️ 탄성코트/세라믹코트 (반드시 제거 필요)

### 주요 고객 오해 해결
1. **DIY 키트 포함 여부**: 페인트 따로, 키트 따로 구매
2. **탄성코트 시공**: 반드시 제거 후 시공
3. **벽지 구분**: 실크벽지 불가, 합지벽지 가능
4. **롤러 시공**: 물 10-20% 희석 권장
5. **덧칠 타이밍**: 표면 건조(1시간) 후 가능

## 🔧 문제 해결

### 서버 연결 오류
```bash
# 백엔드 서버가 실행 중인지 확인
curl http://localhost:3002/api/health

# 포트 사용 확인
lsof -i :3002
```

### OpenAI API 오류
- `.env` 파일의 API 키 확인
- API 크레딧 잔액 확인
- 네트워크 연결 확인

### CORS 오류
- `.env` 파일의 `FRONTEND_URL` 확인
- 프론트엔드 서버 포트가 8081인지 확인

## 📊 실제 데이터 통계

### 고객 질문 패턴 분석 (500+ 건)
- **40%**: 시공 방법 (붓/롤러/스프레이건, 도포 횟수, 건조 시간)
- **25%**: 표면 호환성 (탄성코트, 벽지, 타일, 석고보드)
- **15%**: 용량 계산 (평수별, 부위별)
- **10%**: 제품 문의 (가격, 출시일, 프라이머)
- **10%**: 배송/반품

### 빈번한 키워드
- 탄성코트 제거 (47건)
- 실크벽지 vs 합지벽지 (38건)
- 신축 아파트 시공 (29건)
- 물 희석 비율 (34건)
- 프라이머(젯소) 필요성 (25건)

## 🚀 배포 가이드

### 프로덕션 환경 설정

1. **환경 변수 수정**
```env
NODE_ENV=production
SESSION_SECRET=강력한_랜덤_문자열로_변경
FRONTEND_URL=https://yourdomain.com
```

2. **서버 배포 (예: PM2)**
```bash
npm install -g pm2
cd waterless-chatbot-v2/backend
pm2 start server.js --name waterless-chatbot
pm2 save
pm2 startup
```

3. **프론트엔드 배포**
- Netlify, Vercel, AWS S3 등에 frontend 폴더 배포
- `script.js`의 `API_BASE_URL`을 실제 백엔드 URL로 변경

## 📝 라이선스

이 프로젝트는 워터리스 페인트 전용으로 개발되었습니다.

## 🤝 기술 지원

문의사항이 있으시면 다음으로 연락주세요:
- 📧 이메일: support@waterlesspaint.com (예시)
- 💬 네이버 톡톡: 워터리스 페인트
- 📱 전화: 000-0000-0000

## 🎉 버전 히스토리

### v2.0.0 (2025-10-19)
- 🆕 6개 제품 라인업 완벽 지원
- 🆕 실제 고객 Q&A 500건 이상 반영
- 🆕 지능형 의도 분석 시스템
- 🆕 시공 방법별 용량 계산기
- 🆕 특수 케이스 자동 처리
- 🆕 컨텍스트 기반 대화 추적
- 🆕 추가 API 엔드포인트 (제품/FAQ/가이드)

### v1.0.0 (이전 버전)
- ✅ 기본 챗봇 기능
- ✅ OpenAI GPT-4 통합
- ✅ 단일 제품 정보 제공

---

**제작**: Waterless Paint AI Team  
**마지막 업데이트**: 2025년 10월 19일  
**버전**: 2.0.0
