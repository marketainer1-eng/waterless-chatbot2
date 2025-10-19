# 워터리스 페인트 AI 챗봇 - Vercel 배포 버전

API 키 입력 없이 누구나 바로 사용할 수 있는 웹 챗봇입니다!

## 🚀 배포 방법 (5분 완성)

### 1단계: GitHub에 코드 업로드

1. GitHub 계정 만들기 (https://github.com)
2. 새 Repository 만들기
3. 이 폴더의 모든 파일 업로드

### 2단계: Vercel 계정 만들기

1. https://vercel.com 접속
2. "Sign Up" 클릭
3. **GitHub 계정으로 로그인** (중요!)

### 3단계: 프로젝트 배포

1. Vercel 대시보드에서 **"Add New..." → "Project"** 클릭
2. GitHub에서 방금 만든 Repository 선택
3. **"Import"** 클릭
4. 배포 설정:
   - Framework Preset: **Other**
   - Root Directory: **./`** (그대로 두기)
5. **환경 변수 설정** (매우 중요!):
   - Name: `OPENAI_API_KEY`
   - Value: `sk-proj-실제API키입력`
   - ✅ 모든 환경(Production, Preview, Development) 체크
6. **"Deploy"** 버튼 클릭

### 4단계: 완료!

- 2~3분 후 배포 완료
- 자동으로 생성된 URL (예: `your-project.vercel.app`)
- 이 URL을 다른 사람들에게 공유하면 끝!

## 🎉 사용자 경험

### 관리자 (당신)
1. 한 번만 배포 설정
2. API 키는 Vercel에만 저장 (안전)
3. 비용 관리 가능

### 일반 사용자
1. URL 접속
2. 바로 질문 입력
3. **API 키 입력 필요 없음!**

## 💰 비용

### Vercel (무료!)
- 월 100GB 대역폭 무료
- 무제한 배포
- 자동 HTTPS

### OpenAI API
- GPT-3.5 Turbo 사용
- 질문 100개당 약 $0.20 (200원)
- 사용량에 따라 과금

## 🔒 보안

- API 키는 서버에만 저장
- 사용자에게 노출되지 않음
- HTTPS 자동 적용

## 📱 기능

- ✅ 6개 제품 라인업 완벽 지원
- ✅ 실제 고객 Q&A 500+ 건 반영
- ✅ 모바일/PC 반응형 디자인
- ✅ 빠른 질문 버튼
- ✅ 대화 이력 관리

## 🔧 설정 변경

### API 키 변경
1. Vercel 프로젝트 페이지
2. **Settings** → **Environment Variables**
3. `OPENAI_API_KEY` 수정
4. **"Save"** 후 재배포

### AI 모델 변경
`api/chat.js` 파일에서:
```javascript
model: 'gpt-3.5-turbo'  // 또는 'gpt-4o-mini'
```

### 도메인 변경
1. Vercel 프로젝트 페이지
2. **Settings** → **Domains**
3. 원하는 도메인 추가

## 📞 문제 해결

### 배포 실패
- GitHub Repository가 public인지 확인
- 환경 변수 `OPENAI_API_KEY` 확인

### API 오류
- Vercel 환경 변수에 API 키 제대로 입력했는지 확인
- OpenAI 크레딧 잔액 확인

### 느린 응답
- GPT-3.5 Turbo는 보통 2-5초
- 네트워크 상태 확인

## 🎯 다음 단계

1. ✅ 배포 완료 후 URL 테스트
2. ✅ 실제 질문으로 챗봇 테스트
3. ✅ URL을 고객/직원들에게 공유
4. ✅ 사용량 모니터링 (Vercel + OpenAI)

## 📊 모니터링

### Vercel Analytics
- Dashboard에서 방문자 수 확인
- 지역별 통계

### OpenAI Usage
- https://platform.openai.com/usage
- API 사용량 및 비용 확인

---

**버전**: 2.0.0  
**배포 플랫폼**: Vercel  
**AI 모델**: GPT-3.5 Turbo
