# ch01-03: StatefulWidget 심화 - 메시지 변경 코드 설명

##  학습 목표
- 여러 상태 변수 관리 방법
- 조건부 상태 변경 로직
- 하나의 setState()로 여러 상태 동시 변경
- 복잡한 상태 관리 패턴 이해

---

##  중요 코드 설명

### 1. 여러 상태 변수 관리

```dart
class _MessagePageState extends State<MessagePage> {
  String _message = '안녕하세요!';
  int _clickCount = 0;
  
  void _changeMessage() {
    setState(() {
      _message = _message == '안녕하세요!' ? '반갑습니다!' : '안녕하세요!';
      _clickCount++;
    });
  }
}
```

**핵심 포인트:**
- 여러 상태 변수 동시 관리
- 하나의 `setState()`로 여러 상태 변경
- 조건부 로직 사용 (삼항 연산자)

### 2. 조건부 상태 변경

```dart
_message = _message == '안녕하세요!' ? '반갑습니다!' : '안녕하세요!';
```

**동작:**
- 현재 메시지가 '안녕하세요!'면 → '반갑습니다!'로 변경
- 그렇지 않으면 → '안녕하세요!'로 변경
- 토글(toggle) 패턴

---

##  각 라인별 상세 설명

### 전체 코드 구조

```1:21:F02Ui/lib/ch01_widget_basics/ch01-03_stateful_widget_message.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '01-03: StatefulWidget 심화 - 메시지 변경',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MessagePage(),
    );
  }
}
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 1 | Flutter Material 라이브러리 import |
| 3-5 | `main()` 함수 - 앱 진입점 |
| 7 | `MyApp` - 루트 위젯 |
| 12 | `MaterialApp` - Material Design 앱 루트 |
| 15 | `seedColor: Colors.green` - 초록색 테마 |
| 18 | `home` - 시작 페이지로 `MessagePage` 설정 |

---

### StatefulWidget 정의

```23:28:F02Ui/lib/ch01_widget_basics/ch01-03_stateful_widget_message.dart
class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 23 | `MessagePage` - StatefulWidget 클래스 |
| 27 | `createState()` - State 객체 생성 |

---

### State 클래스 - 여러 상태 변수

```30:48:F02Ui/lib/ch01_widget_basics/ch01-03_stateful_widget_message.dart
class _MessagePageState extends State<MessagePage> {
  // 상태 변수
  String _message = '안녕하세요!';
  int _clickCount = 0;

  // 메시지 변경 메서드
  void _changeMessage() {
    setState(() {
      _message = _message == '안녕하세요!' ? '반갑습니다!' : '안녕하세요!';
      _clickCount++;
    });
  }

  void _resetMessage() {
    setState(() {
      _message = '안녕하세요!';
      _clickCount = 0;
    });
  }
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 30 | `_MessagePageState` - State 클래스 |
| 32 | `String _message` - 메시지 상태 변수 (초기값: '안녕하세요!') |
| 33 | `int _clickCount` - 클릭 횟수 상태 변수 (초기값: 0) |
| 36-41 | `_changeMessage()` - 메시지 변경 메서드 |
| 37 | `setState()` - 상태 변경 및 UI 업데이트 |
| 38 | 삼항 연산자로 조건부 메시지 변경 |
| 38 | `_message == '안녕하세요!'` - 현재 메시지 확인 |
| 38 | `? '반갑습니다!'` - true면 이 값으로 변경 |
| 38 | `: '안녕하세요!'` - false면 이 값으로 변경 |
| 39 | `_clickCount++` - 클릭 횟수 증가 |
| 43-48 | `_resetMessage()` - 메시지와 클릭 횟수 리셋 |
| 45 | `_message = '안녕하세요!'` - 메시지 초기화 |
| 46 | `_clickCount = 0` - 클릭 횟수 초기화 |

**핵심 개념:**
- **여러 상태 변수**: `_message`와 `_clickCount` 동시 관리
- **하나의 setState()**: 여러 상태를 한 번에 변경
- **삼항 연산자**: `조건 ? 값1 : 값2` 형태의 조건부 할당

---

### build() 메서드 - 메시지 표시

```50:212:F02Ui/lib/ch01_widget_basics/ch01-03_stateful_widget_message.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('01-03: StatefulWidget 심화 - 메시지 변경'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 설명 섹션
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'StatefulWidget 심화',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 여러 상태 변수 관리'),
                  Text('• 조건부 상태 변경'),
                  Text('• setState()로 여러 상태 동시 변경'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 메시지 변경 예제
            const Text(
              '메시지 변경 예제',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Column(
                children: [
                  const Text(
                    '현재 메시지',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _message,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _changeMessage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: const Text(
                      '메시지 변경',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 클릭 횟수 표시
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '추가 정보',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('클릭 횟수: $_clickCount'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _resetMessage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('리셋'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 코드 설명
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '학습 포인트',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 하나의 setState()로 여러 상태 변경 가능'),
                  Text('• 조건부 로직으로 상태 변경'),
                  Text('• 상태에 따라 UI가 자동 업데이트'),
                  Text('• build() 메서드는 상태 변경 시마다 호출'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 51 | `build()` 메서드 - UI 구성 |
| 117-124 | 메시지 표시 Text 위젯 |
| 118 | `_message` - 상태 변수 값 표시 |
| 126-140 | 메시지 변경 버튼 |
| 127 | `onPressed: _changeMessage` - 버튼 클릭 시 메시지 변경 함수 호출 |
| 166 | `Text('클릭 횟수: $_clickCount')` - 클릭 횟수 표시 (문자열 보간) |
| 168-175 | 리셋 버튼 |
| 169 | `onPressed: _resetMessage` - 리셋 함수 호출 |

**중요 포인트:**
- `_message`와 `_clickCount` 두 상태 변수를 동시에 사용
- 하나의 `setState()`로 두 상태를 모두 변경
- UI는 상태 변경 시 자동으로 업데이트됨

---

##  핵심 개념 정리

### 1. 여러 상태 변수 관리

```dart
//  좋은 예: 관련된 상태들을 함께 관리
String _message = '안녕하세요!';
int _clickCount = 0;

void _changeMessage() {
  setState(() {
    _message = ...;
    _clickCount++;  // 한 번에 여러 상태 변경
  });
}
```

### 2. 조건부 상태 변경 (삼항 연산자)

```dart
// 기본 형태
조건 ? 값1 : 값2

// 예제
_message = _message == '안녕하세요!' 
  ? '반갑습니다!'      // 조건이 true일 때
  : '안녕하세요!';     // 조건이 false일 때
```

**동등 비교:**
- `==`: 값이 같은지 비교
- `!=`: 값이 다른지 비교

### 3. 하나의 setState()로 여러 상태 변경

```dart
//  효율적: 한 번의 setState()로 여러 상태 변경
setState(() {
  _message = '새 메시지';
  _clickCount++;
  _isActive = true;
});

//  비효율적: 여러 번의 setState() 호출
setState(() {
  _message = '새 메시지';
});
setState(() {
  _clickCount++;
});
setState(() {
  _isActive = true;
});
```

**이유:**
- `setState()` 호출 시 `build()`가 실행됨
- 여러 번 호출하면 불필요한 rebuild 발생
- 성능 저하

---

##  실전 패턴

### 1. 토글(Toggle) 패턴

```dart
bool _isOn = false;

void _toggle() {
  setState(() {
    _isOn = !_isOn;  // true ↔ false 전환
  });
}
```

### 2. 카운터 패턴

```dart
int _count = 0;

void _increment() {
  setState(() {
    _count++;
  });
}

void _decrement() {
  setState(() {
    _count--;
  });
}

void _reset() {
  setState(() {
    _count = 0;
  });
}
```

### 3. 리스트 관리 패턴

```dart
List<String> _items = [];

void _addItem(String item) {
  setState(() {
    _items.add(item);  // 리스트에 추가
  });
}

void _removeItem(int index) {
  setState(() {
    _items.removeAt(index);  // 리스트에서 제거
  });
}
```

---

##  주의사항

### 1. 상태 변경은 setState() 내부에서만

```dart
//  잘못된 예
void _changeMessage() {
  _message = '새 메시지';  // setState 없이 변경
  _clickCount++;
  setState(() {});  // 빈 setState (의미 없음)
}

//  올바른 예
void _changeMessage() {
  setState(() {
    _message = '새 메시지';  // setState 내부에서 변경
    _clickCount++;
  });
}
```

### 2. 관련된 상태는 함께 관리

```dart
//  좋은 예: 관련된 상태들을 함께 관리
String _message = '안녕하세요!';
int _clickCount = 0;

//  나쁜 예: 관련 없는 상태를 함께 관리
String _message = '안녕하세요!';
int _unrelatedCounter = 0;  // 메시지와 관련 없음
```

### 3. 초기값 설정

```dart
//  좋은 예: 명확한 초기값
String _message = '안녕하세요!';
int _clickCount = 0;

//  나쁜 예: null 허용 (null safety 문제)
String? _message;  // null일 수 있음
```

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] 여러 상태 변수를 동시에 관리할 수 있습니다
- [ ] 조건부 상태 변경 로직을 작성할 수 있습니다
- [ ] 하나의 setState()로 여러 상태를 변경할 수 있습니다
- [ ] 삼항 연산자를 사용할 수 있습니다
- [ ] 상태에 따라 UI가 자동 업데이트됨을 이해했습니다
- [ ] 토글 패턴을 구현할 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch01_widget_basics/ch01-03_stateful_widget_message.dart
```

##  다음 단계

이 예제를 완료했다면 다음으로 진행하세요:
- **ch01-04**: 위젯 트리와 build() 메서드

