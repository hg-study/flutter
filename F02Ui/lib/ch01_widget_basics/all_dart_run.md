# -------------------------------------------
#  실행 방법 및 결과 확인
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
   flutter run lib/ch01_widget_basics/main.dart
   ```

4. **결과 확인**
   - 에뮬레이터나 실제 기기에서 앱이 실행됩니다
   - 화면에서 위젯의 동작을 직접 확인할 수 있습니다

**예상 화면:**
- 상단에 AppBar 표시
- StatelessWidget 예제 섹션
- StatefulWidget 예제 섹션 (카운터, 메시지 변경)
- 위젯 트리 구조 시각화
- build() 메서드 설명
- setState() 동작 원리

---

## 방법 2: VS Code에서 실행

1. **파일 열기**
   - `lib/ch01_widget_basics/main.dart` 파일을 VS Code에서 엽니다

2. **실행 방법**
   - 방법 A: 파일 상단의 "Run" 버튼 클릭
   - 방법 B: `F5` 키 누르기
   - 방법 C: 우클릭 → "Run Flutter" 선택
   - 방법 D: 터미널에서 `flutter run lib/ch01_widget_basics/main.dart` 입력

3. **결과 확인**
   - 에뮬레이터나 실제 기기에서 앱 실행
   - Hot Reload로 코드 수정 즉시 반영

---

## 방법 3: Android Studio에서 실행

1. **파일 열기**
   - `lib/ch01_widget_basics/main.dart` 파일을 엽니다

2. **실행**
   - 파일 상단의 실행 버튼(▶) 클릭
   - 또는 `Shift + F10` (Windows) / `Ctrl + R` (Mac)

3. **결과 확인**
   - 에뮬레이터나 실제 기기에서 앱 실행
   - 하단의 "Run" 탭에서 로그 확인

---

## 방법 4: 특정 디바이스 선택

```bash
# 사용 가능한 디바이스 확인
flutter devices

# 특정 디바이스에서 실행
flutter run -d <device-id> lib/ch01_widget_basics/main.dart

# 예시
flutter run -d chrome          # 웹 브라우저
flutter run -d windows         # Windows
flutter run -d android         # Android 에뮬레이터
```

---

##  결과 확인 팁

1. **화면에서 확인할 내용**
   - StatelessWidget: 항상 같은 내용 표시
   - StatefulWidget: 버튼 클릭 시 값 변경
   - 카운터: 증가 버튼 클릭 시 숫자 증가
   - 메시지 변경: 버튼 클릭 시 메시지 토글

2. **Hot Reload 활용**
   - 코드 수정 후 저장 (`Ctrl + S` / `Cmd + S`)
   - `r` 키를 눌러 Hot Reload
   - 즉시 변경사항 확인 가능

3. **Hot Restart**
   - `R` 키를 눌러 Hot Restart
   - 앱을 처음부터 다시 시작
   - 상태 초기화

---

##  화면 구성 설명

### 상단
- **AppBar**: "01단계: 위젯 기초" 제목

### 본문 (스크롤 가능)
1. **StatelessWidget 예제**
   - 정적 위젯 2개 표시
   - 항상 같은 내용

2. **StatefulWidget 예제**
   - 카운터: 증가 버튼으로 숫자 증가
   - 메시지 변경: 버튼으로 메시지 토글

3. **위젯 트리 구조**
   - 위젯 계층 구조 시각화

4. **build() 메서드**
   - build() 메서드 특징 설명

5. **setState() 동작 원리**
   - setState() 호출 시 동작 설명
   - 현재 카운터 값 표시

---

##  문제 해결

### 문제 1: "flutter: command not found"

```bash
# Flutter SDK 경로 확인
where flutter  # Windows
which flutter  # Mac/Linux

# PATH 환경변수 설정 확인
```

### 문제 2: "No devices found"

```bash
# 에뮬레이터 시작
# Android Studio: Tools > Device Manager
# 또는 실제 기기 연결

# 사용 가능한 디바이스 확인
flutter devices
```

### 문제 3: "Analysis errors"

- IDE에서 빨간 줄 확인
- 오류 메시지 읽기
- import 문 확인

### 문제 4: "Hot Reload not working"

- `r` 키 대신 `R` 키 (Hot Restart) 시도
- 앱 재시작
- 코드에 문법 오류 없는지 확인

---

##  실습: 직접 코드 수정해보기

1. `main.dart` 파일을 엽니다
2. 코드를 수정합니다 (예: 색상 변경, 텍스트 변경)
3. 저장합니다 (`Ctrl + S` / `Cmd + S`)
4. Hot Reload (`r` 키) 또는 자동 Hot Reload
5. 화면에서 변경사항 확인

**예시 1: 색상 변경**
```dart
// 원본
colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),

// 수정
colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
```

**예시 2: 카운터 초기값 변경**
```dart
// 원본
int _counter = 0;

// 수정
int _counter = 10;
```

**예시 3: 버튼 텍스트 변경**
```dart
// 원본
child: const Text('증가'),

// 수정
child: const Text('+1'),
```

---

##  확인 사항

실행 후 다음을 확인하세요:

- [ ] 앱이 정상적으로 실행됩니다
- [ ] StatelessWidget 섹션이 표시됩니다
- [ ] 카운터 버튼을 클릭하면 숫자가 증가합니다
- [ ] 메시지 변경 버튼을 클릭하면 메시지가 바뀝니다
- [ ] 화면을 스크롤할 수 있습니다
- [ ] Hot Reload가 작동합니다

---

##  추가 학습

실행 후 다음을 시도해보세요:

1. **새로운 StatelessWidget 만들기**
   - 다른 내용의 정적 위젯 추가

2. **새로운 StatefulWidget 만들기**
   - 다른 상태를 가진 위젯 추가

3. **색상과 스타일 변경**
   - 다양한 색상 시도
   - 텍스트 스타일 변경

4. **레이아웃 실험**
   - 위젯 배치 변경
   - 간격 조정

