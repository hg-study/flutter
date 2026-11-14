# 실행 방법 및 결과 확인

## 빠른 실행

```bash
cd F03Advanced
flutter run lib/ch02_async_handling/main.dart
```

## 화면 구성

### 상단
- **AppBar**: "02단계: 비동기 처리" 제목

### 본문 (스크롤 가능)
1. **FutureBuilder 기본**
   - 2초 후 데이터 표시
   - 로딩 인디케이터 표시
   - 에러 처리

2. **FutureBuilder 상태 처리**
   - ConnectionState 표시
   - 로딩 진행 표시
   - 결과 표시

3. **StreamBuilder 기본**
   - 0.5초마다 숫자 증가
   - 실시간 업데이트
   - 상태 표시

4. **실전 예제: 타이머**
   - 타이머 시작 버튼
   - 0~10초 카운트
   - StreamBuilder로 실시간 표시

5. **실전 예제: 데이터 로딩**
   - 새로고침 버튼
   - 2초 후 목록 표시
   - FutureBuilder로 처리

## 확인 사항

실행 후 다음을 확인하세요:

- [ ] FutureBuilder가 로딩 상태를 표시합니다
- [ ] FutureBuilder가 데이터를 표시합니다
- [ ] StreamBuilder가 실시간으로 업데이트됩니다
- [ ] 타이머가 작동합니다
- [ ] 데이터 로딩이 작동합니다
- [ ] 새로고침 버튼이 작동합니다

## 문제 해결

### 문제 1: "FutureBuilder가 업데이트되지 않음"

- future를 변수로 저장하고 setState로 재생성
- 또는 FutureBuilder의 key 사용

### 문제 2: "StreamBuilder가 멈춤"

- Stream이 제대로 생성되었는지 확인
- StreamController가 닫히지 않았는지 확인

