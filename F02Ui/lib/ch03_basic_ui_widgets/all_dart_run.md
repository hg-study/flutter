# -------------------------------------------
# 실행 방법 및 결과 확인
# -------------------------------------------

## 방법 1: 터미널에서 Flutter로 실행 (권장)

1. **터미널 열기**
   - Windows: PowerShell 또는 CMD
   - Mac/Linux: Terminal

2. **프로젝트 디렉토리로 이동**
   ```bash
   cd C:\Users\Administrator\Downloads\MY\FLUTTER\F02Ui
   ```

3. **코드 실행**
   ```bash
   flutter run lib/ch03_basic_ui_widgets/main.dart
   ```

4. **결과 확인**
   - 에뮬레이터나 실제 기기에서 앱이 실행됩니다
   - 화면에서 각 UI 위젯을 확인할 수 있습니다

**예상 화면:**
- Text 예제 (다양한 스타일)
- Icon 예제 (다양한 아이콘, 클릭 가능)
- Image 예제
- Button 예제 (ElevatedButton, TextButton, OutlinedButton)
- FloatingActionButton 예제
- 실전 예제 (카드 UI)

---

## 방법 2: VS Code에서 실행

1. **파일 열기**
   - `lib/ch03_basic_ui_widgets/main.dart` 파일을 VS Code에서 엽니다

2. **실행 방법**
   - 방법 A: 파일 상단의 "Run" 버튼 클릭
   - 방법 B: `F5` 키 누르기
   - 방법 C: 우클릭 → "Run Flutter" 선택

3. **결과 확인**
   - 에뮬레이터나 실제 기기에서 앱 실행
   - Hot Reload로 코드 수정 즉시 반영

---

## 화면 구성 설명

### 상단
- **AppBar**: "03단계: 기본 UI 위젯" 제목
- **actions**: 검색, 더보기 아이콘 버튼

### 본문 (스크롤 가능)
1. **Text**: 다양한 스타일의 텍스트
2. **Icon**: 여러 아이콘과 클릭 가능한 아이콘
3. **Image**: 이미지 영역 (플레이스홀더)
4. **Button**: 다양한 버튼 스타일
5. **FloatingActionButton**: 플로팅 버튼
6. **실전 예제**: 소셜 미디어 스타일 카드

### 하단
- **FloatingActionButton**: 우하단 플로팅 버튼

---

## 확인 사항

실행 후 다음을 확인하세요:

- [ ] Text가 다양한 스타일로 표시됩니다
- [ ] Icon이 표시되고 클릭 가능합니다
- [ ] Image 영역이 표시됩니다
- [ ] 여러 종류의 버튼이 작동합니다
- [ ] FloatingActionButton이 우하단에 표시됩니다
- [ ] AppBar의 아이콘 버튼이 작동합니다
- [ ] 실전 예제의 좋아요 버튼이 작동합니다

---

## 실습: 직접 코드 수정해보기

1. `main.dart` 파일을 엽니다
2. 코드를 수정합니다 (예: 아이콘 변경, 색상 변경)
3. 저장하고 Hot Reload
4. 화면에서 변경사항 확인

**예시:**
```dart
// 원본
Icon(Icons.home)

// 수정
Icon(Icons.settings)
```

