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
   flutter run lib/ch02_layout_widgets/main.dart
   ```

4. **결과 확인**
   - 에뮬레이터나 실제 기기에서 앱이 실행됩니다
   - 화면에서 각 레이아웃 위젯의 동작을 확인할 수 있습니다

**예상 화면:**
- Container 예제 (기본, 둥근 모서리)
- Padding 예제
- Row 예제 (다양한 정렬)
- Column 예제 (다양한 정렬)
- Stack 예제 (겹쳐진 위젯)
- Expanded/Flexible 예제
- SizedBox 예제
- Center 예제
- 실전 예제 (카드 레이아웃)

---

## 방법 2: VS Code에서 실행

1. **파일 열기**
   - `lib/ch02_layout_widgets/main.dart` 파일을 VS Code에서 엽니다

2. **실행 방법**
   - 방법 A: 파일 상단의 "Run" 버튼 클릭
   - 방법 B: `F5` 키 누르기
   - 방법 C: 우클릭 → "Run Flutter" 선택

3. **결과 확인**
   - 에뮬레이터나 실제 기기에서 앱 실행
   - Hot Reload로 코드 수정 즉시 반영

---

## 방법 3: Android Studio에서 실행

1. **파일 열기**
   - `lib/ch02_layout_widgets/main.dart` 파일을 엽니다

2. **실행**
   - 파일 상단의 실행 버튼 클릭
   - 또는 `Shift + F10` (Windows) / `Ctrl + R` (Mac)

3. **결과 확인**
   - 에뮬레이터나 실제 기기에서 앱 실행

---

## 화면 구성 설명

### 상단
- **AppBar**: "02단계: 레이아웃 위젯" 제목

### 본문 (스크롤 가능)
1. **Container**: 크기와 색상이 있는 박스
2. **Padding**: 여백이 있는 박스
3. **Row**: 가로로 배치된 박스들 (다양한 정렬)
4. **Column**: 세로로 배치된 박스들 (다양한 정렬)
5. **Stack**: 겹쳐진 박스들
6. **Expanded/Flexible**: 공간을 분배한 박스들
7. **SizedBox**: 고정 크기 버튼들
8. **Center**: 중앙 정렬된 텍스트
9. **실전 예제**: 프로필 카드 레이아웃

---

## 확인 사항

실행 후 다음을 확인하세요:

- [ ] Container가 크기와 색상으로 표시됩니다
- [ ] Padding으로 여백이 추가됩니다
- [ ] Row로 가로 배치가 됩니다
- [ ] Column으로 세로 배치가 됩니다
- [ ] Stack으로 위젯이 겹쳐집니다
- [ ] Expanded로 공간이 분배됩니다
- [ ] SizedBox로 크기가 고정됩니다
- [ ] Center로 중앙 정렬이 됩니다

---

## 실습: 직접 코드 수정해보기

1. `main.dart` 파일을 엽니다
2. 코드를 수정합니다 (예: 색상 변경, 크기 변경)
3. 저장하고 Hot Reload
4. 화면에서 변경사항 확인

**예시:**
```dart
// 원본
color: Colors.blue,

// 수정
color: Colors.purple,
```

