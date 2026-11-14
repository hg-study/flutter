# 실행 방법 및 결과 확인

## 사전 준비

1. **패키지 설치**
   ```bash
   cd F03Advanced
   flutter pub get
   ```

2. **필요한 패키지 확인**
   - shared_preferences: ^2.2.2
   - path_provider: ^2.1.1

## 빠른 실행

```bash
flutter run lib/ch03_local_storage/main.dart
```

## 화면 구성

### 상단
- **AppBar**: "03단계: 로컬 저장소" 제목

### 본문 (스크롤 가능)
1. **SharedPreferences 예제**
   - 저장된 값 표시
   - 텍스트 입력 및 저장
   - 삭제 버튼

2. **File I/O 예제**
   - 파일 내용 표시
   - 파일 저장 다이얼로그
   - 파일 삭제 버튼

3. **실전 예제: 설정 저장**
   - 알림 설정
   - 사용자 이름
   - 테마 선택
   - 설정 저장 버튼

## 확인 사항

실행 후 다음을 확인하세요:

- [ ] SharedPreferences에 값을 저장할 수 있습니다
- [ ] 저장된 값을 읽을 수 있습니다
- [ ] SharedPreferences에서 값을 삭제할 수 있습니다
- [ ] 파일에 내용을 저장할 수 있습니다
- [ ] 파일 내용을 읽을 수 있습니다
- [ ] 파일을 삭제할 수 있습니다
- [ ] 설정이 저장되고 불러와집니다

## 문제 해결

### 문제 1: "shared_preferences: command not found"

```bash
# pubspec.yaml에 패키지 추가 확인
# flutter pub get 실행
```

### 문제 2: "파일을 찾을 수 없음"

- path_provider로 경로 확인
- 파일 존재 여부 확인

### 문제 3: "권한 오류" (Android)

- AndroidManifest.xml에 권한 추가 필요할 수 있음
- 대부분의 경우 자동 처리됨

