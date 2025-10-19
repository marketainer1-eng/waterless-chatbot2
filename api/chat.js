// Vercel Serverless Function - 챗봇 API
export default async function handler(req, res) {
  // CORS 설정
  res.setHeader('Access-Control-Allow-Credentials', true);
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,PATCH,DELETE,POST,PUT');
  res.setHeader(
    'Access-Control-Allow-Headers',
    'X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version'
  );

  // OPTIONS 요청 처리
  if (req.method === 'OPTIONS') {
    res.status(200).end();
    return;
  }

  // POST 요청만 허용
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { message, history = [] } = req.body;

  if (!message) {
    return res.status(400).json({ error: '메시지가 필요합니다.' });
  }

  // 환경 변수에서 OpenAI API 키 가져오기
  const apiKey = process.env.OPENAI_API_KEY;

  if (!apiKey) {
    return res.status(500).json({ error: 'API 키가 설정되지 않았습니다.' });
  }

  // 시스템 프롬프트
  const systemPrompt = `당신은 워터리스 페인트 전문 상담사입니다. 실제 고객 Q&A 500건 이상의 데이터를 기반으로 학습했습니다.

# 제품 라인업
1. **워터리스 ULTRA 4L** (75,000원 예상) - DIY용, 16㎡(5평) 1회 도포
2. **워터리스 ULTRA 10L** (150,000원) - B2B용, 40㎡(12평) 1회 도포
3. **워터리스 HYPER 10L** (200,000원 예상) - 최상위 프로페셔널
4. **워터리스 SUPER 프라이머 3.5L** - 초강력 접착, 탄성코트 제거 후 필수
5. **바르는 곰팡이 제거제 500ml** - 브러시형 젤
6. **DIY 키트** - 페인트 별도 구매 필요!

# 시공 가능/불가능 표면
✅ 가능: 콘크리트, 수성페인트, 합지벽지, 석고보드, 이보드, 합판
❌ 불가능: 실크벽지, 타일, 유리, 플라스틱, SMC천장
⚠️ 주의: 탄성코트/세라믹코트 (반드시 제거 필요)

# 시공 방법
- 최소 2-3회 도포 권장
- 롤러: 물 10-20% 희석, 5-6㎡/L
- 붓: 원액 사용, 6-7㎡/L
- 스프레이건: 4-5㎡/L
- 건조 시간: 표면 1시간, 완전 24시간

# 빈번한 고객 오해 (반드시 명확히 설명)
1. 탄성코트: 반드시 제거 필요 (갈아내거나 벗겨내기)
2. 실크벽지: 시공 불가, 합지벽지만 가능
3. DIY 키트: 페인트 미포함, 별도 구매
4. 물 희석: 롤러 시공 시 10-20% 권장
5. 덧칠: 표면 건조(1시간) 후 가능

친절하고 전문적으로 답변하며, 구체적인 숫자와 안전 관련 사항을 강조하세요.`;

  try {
    // OpenAI API 호출
    const response = await fetch('https://api.openai.com/v1/chat/completions', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${apiKey}`
      },
      body: JSON.stringify({
        model: 'gpt-3.5-turbo',
        messages: [
          { role: 'system', content: systemPrompt },
          ...history.slice(-10), // 최근 10개 메시지만 유지
          { role: 'user', content: message }
        ],
        temperature: 0.7,
        max_tokens: 1000
      })
    });

    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(errorData.error?.message || '서버 오류');
    }

    const data = await response.json();
    const aiResponse = data.choices[0].message.content;

    return res.status(200).json({
      response: aiResponse,
      success: true
    });

  } catch (error) {
    console.error('Error:', error);
    return res.status(500).json({
      error: error.message,
      success: false
    });
  }
}
