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
   flutter run lib/ch04_list_grid/main.dart
   ```

4. **결과 확인**
   - 에뮬레이터나 실제 기기에서 앱이 실행됩니다
   - 상단 탭으로 ListView, GridView, Card 예제를 전환할 수 있습니다

**예상 화면:**
- **ListView 탭**: 기본 리스트, 동적 리스트, 구분선 리스트
- **GridView 탭**: 2열 그리드로 상품 표시
- **Card 탭**: 다양한 카드 예제

---

## 방법 2: VS Code에서 실행

1. **파일 열기**
   - `lib/ch04_list_grid/main.dart` 파일을 VS Code에서 엽니다

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
- **AppBar**: "04단계: 리스트와 그리드" 제목
- **TabBar**: ListView, GridView, Card 탭

### 본문 (탭별 내용)
1. **ListView 탭**
   - 기본 ListView 예제
   - ListView.builder 예제 (클릭 가능)
   - ListView.separated 예제

2. **GridView 탭**
   - 2열 그리드로 상품 표시
   - 스크롤 가능

3. **Card 탭**
   - 기본 Card
   - 복잡한 Card (이미지, 버튼 포함)
   - ListTile이 있는 Card

---

## 확인 사항

실행 후 다음을 확인하세요:

- [ ] ListView가 스크롤됩니다
- [ ] ListView.builder 항목을 클릭할 수 있습니다
- [ ] GridView가 2열로 표시됩니다
- [ ] GridView가 스크롤됩니다
- [ ] Card가 표시됩니다
- [ ] 탭 전환이 작동합니다

---

## 실습: 직접 코드 수정해보기

1. `main.dart` 파일을 엽니다
2. 코드를 수정합니다 (예: 그리드 열 개수 변경, 항목 추가)
3. 저장하고 Hot Reload
4. 화면에서 변경사항 확인

**예시:**
```dart
// 원본
crossAxisCount: 2,

// 수정
crossAxisCount: 3,
```

