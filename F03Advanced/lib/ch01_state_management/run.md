# 실행 방법 및 결과 확인

## 사전 준비

1. **패키지 설치**
   ```bash
   cd F03Advanced
   flutter pub get
   ```

2. **필요한 패키지 확인**
   - provider: ^6.1.1

## 빠른 실행

```bash
flutter run lib/ch01_state_management/main.dart
```

## 화면 구성

### 상단
- **AppBar**: "01단계: 상태 관리" 제목

### 본문 (스크롤 가능)
1. **Provider 기본 사용**
   - 카운터 표시
   - 증가, 감소, 리셋 버튼
   - Consumer로 자동 업데이트

2. **여러 상태 관리**
   - 메시지 표시
   - 메시지 변경 버튼들
   - Consumer로 상태 공유

3. **Provider.of 사용**
   - Provider.of 예제
   - listen: false 사용

4. **실전 예제: 할 일 목록**
   - 할 일 추가
   - 할 일 완료 체크
   - 할 일 삭제

## 확인 사항

실행 후 다음을 확인하세요:

- [ ] 카운터 버튼이 작동합니다
- [ ] Consumer로 자동 업데이트됩니다
- [ ] 메시지 변경이 작동합니다
- [ ] 할 일을 추가할 수 있습니다
- [ ] 할 일을 완료 처리할 수 있습니다
- [ ] 할 일을 삭제할 수 있습니다

## 문제 해결

### 문제 1: "provider: command not found"

```bash
# pubspec.yaml에 패키지 추가 확인
# flutter pub get 실행
```

### 문제 2: "Provider not found"

- ChangeNotifierProvider로 등록 확인
- 위젯 트리 상위에 Provider 위치 확인

### 문제 3: "UI가 업데이트되지 않음"

- notifyListeners() 호출 확인
- Consumer 사용 확인

