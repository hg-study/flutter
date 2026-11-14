# ch01-02: StatefulWidget 기초 - 카운터 코드 설명

##  학습 목표
- StatefulWidget의 개념 이해
- State 클래스의 역할
- setState() 메서드 사용법
- 상태 변경과 UI 업데이트의 관계

---

##  중요 코드 설명

### 1. StatefulWidget 기본 구조

```dart
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}
```

**핵심 포인트:**
- `StatefulWidget`: 위젯 정의 (불변)
- `State`: 상태 관리 클래스 (가변)
- `setState()`: 상태 변경 및 UI 업데이트 트리거
- `_counter`: 상태 변수 (언더스코어로 private 표시)

### 2. setState()의 역할

```dart
setState(() {
  _counter++;  // 상태 변경
});
```

**동작 과정:**
1. 상태 변경 (`_counter++`)
2. `build()` 메서드 자동 호출
3. UI 다시 그리기

---

##  각 라인별 상세 설명

### 전체 코드 구조

```1:21:F02Ui/lib/ch01_widget_basics/ch01-02_stateful_widget_counter.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '01-02: StatefulWidget 기초 - 카운터',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 1 | Flutter Material 라이브러리 import |
| 3-5 | `main()` 함수 - 앱 진입점 |
| 7 | `MyApp` - 루트 위젯 (StatelessWidget) |
| 12 | `MaterialApp` - Material Design 앱 루트 |
| 18 | `home` - 시작 페이지로 `CounterPage` 설정 |

---

### StatefulWidget 정의

```23:28:F02Ui/lib/ch01_widget_basics/ch01-02_stateful_widget_counter.dart
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 23 | `CounterPage` - StatefulWidget 클래스 (불변) |
| 24 | `const` 생성자 - 컴파일 타임 상수 |
| 27 | `createState()` - State 객체 생성 메서드 |
| 27 | `_CounterPageState()` - 실제 상태 관리 클래스 인스턴스 반환 |

**중요:** StatefulWidget은 불변이며, 실제 상태는 State 클래스에서 관리합니다.

---

### State 클래스 (상태 관리)

```30:51:F02Ui/lib/ch01_widget_basics/ch01-02_stateful_widget_counter.dart
class _CounterPageState extends State<CounterPage> {
  // 상태 변수
  int _counter = 0;

  // 상태를 변경하는 메서드
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 30 | `_CounterPageState` - State 클래스 (가변, private) |
| 30 | `extends State<CounterPage>` - CounterPage의 State |
| 32 | `int _counter = 0` - 상태 변수 (언더스코어 = private) |
| 35-39 | `_incrementCounter()` - 카운터 증가 메서드 |
| 36 | `setState()` - 상태 변경 및 UI 업데이트 트리거 |
| 37 | `_counter++` - 상태 변경 (1 증가) |
| 41-45 | `_decrementCounter()` - 카운터 감소 메서드 |
| 43 | `_counter--` - 상태 변경 (1 감소) |
| 47-51 | `_resetCounter()` - 카운터 리셋 메서드 |
| 49 | `_counter = 0` - 상태를 0으로 초기화 |

**핵심 개념:**
- `_` (언더스코어): private 멤버 표시 (클래스 외부에서 접근 불가)
- `setState()`: 상태 변경을 Flutter 프레임워크에 알림
- `setState()` 내부에서만 상태 변경해야 UI가 업데이트됨

---

### build() 메서드

```53:209:F02Ui/lib/ch01_widget_basics/ch01-02_stateful_widget_counter.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('01-02: StatefulWidget 기초 - 카운터'),
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
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'StatefulWidget이란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 상태를 가진 위젯'),
                  Text('• 상태가 변경되면 UI가 업데이트됨'),
                  Text('• setState()로 상태 변경'),
                  Text('• build() 메서드가 상태 변경 시 자동 호출'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 카운터 예제
            const Text(
              '카운터 예제',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Column(
                children: [
                  const Text(
                    '현재 카운터 값',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '$_counter',
                    style: const TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _decrementCounter,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: const Text('감소'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _resetCounter,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: const Text('리셋'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _incrementCounter,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: const Text('증가'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 코드 설명
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
                    '핵심 개념',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('1. StatefulWidget: 위젯 정의 (불변)'),
                  Text('2. State: 상태 관리 클래스 (가변)'),
                  Text('3. setState(): 상태 변경 및 UI 업데이트'),
                  Text('4. build(): UI를 구성하는 메서드'),
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
| 54 | `build()` 메서드 - UI를 반환하는 메서드 |
| 55 | `Scaffold` - Material Design 기본 레이아웃 |
| 121-128 | 카운터 값 표시 Text 위젯 |
| 122 | `'$_counter'` - 문자열 보간 (변수 값을 문자열로 변환) |
| 130-172 | 버튼들을 가로로 배치하는 Row |
| 131 | `mainAxisAlignment` - 가로축 정렬 (중앙) |
| 133-144 | 감소 버튼 |
| 134 | `onPressed: _decrementCounter` - 버튼 클릭 시 호출할 함수 |
| 135-141 | 버튼 스타일 설정 |
| 146-157 | 리셋 버튼 |
| 159-170 | 증가 버튼 |
| 160 | `onPressed: _incrementCounter` - 증가 함수 연결 |

**중요 포인트:**
- `'$_counter'`: 문자열 보간 문법 (Dart)
- `onPressed`: 버튼 클릭 이벤트 핸들러
- `setState()` 호출 시 `build()`가 자동으로 다시 실행됨

---

##  핵심 개념 정리

### StatefulWidget의 두 부분

1. **StatefulWidget (불변)**
   ```dart
   class CounterPage extends StatefulWidget {
     // 위젯 정의만 담당
   }
   ```

2. **State (가변)**
   ```dart
   class _CounterPageState extends State<CounterPage> {
     // 실제 상태와 로직 담당
   }
   ```

### setState() 동작 원리

```
사용자 액션 (버튼 클릭)
    ↓
setState() 호출
    ↓
상태 변경 (_counter++)
    ↓
build() 메서드 자동 호출
    ↓
UI 다시 그리기
```

### setState() 사용 규칙

 **올바른 사용:**
```dart
setState(() {
  _counter++;  // setState 내부에서 상태 변경
});
```

 **잘못된 사용:**
```dart
_counter++;  // setState 없이 상태 변경 (UI 업데이트 안 됨)
setState(() {});  // 빈 setState (의미 없음)
```

---

##  실전 팁

1. **상태 변수는 private으로**
   - `_counter`처럼 언더스코어 사용
   - 외부에서 직접 접근 방지

2. **setState() 내부에서만 상태 변경**
   - setState 밖에서 변경하면 UI 업데이트 안 됨

3. **build() 내부에서 setState() 호출 금지**
   - 무한 루프 발생 가능

4. **상태 변경은 최소화**
   - 필요한 경우에만 setState() 호출
   - 성능 최적화

---

##  주의사항

### 1. setState() 없이 상태 변경
```dart
//  잘못된 예
void _incrementCounter() {
  _counter++;  // UI 업데이트 안 됨!
}
```

### 2. build() 내부에서 setState() 호출
```dart
//  잘못된 예
@override
Widget build(BuildContext context) {
  setState(() {  // 무한 루프 발생 가능!
    _counter++;
  });
  return ...
}
```

### 3. 비동기 작업 후 setState()
```dart
//  올바른 예
Future<void> _loadData() async {
  final data = await fetchData();
  setState(() {
    _data = data;  // 비동기 작업 완료 후 setState
  });
}
```

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] StatefulWidget의 구조를 이해했습니다
- [ ] State 클래스의 역할을 이해했습니다
- [ ] setState()를 올바르게 사용할 수 있습니다
- [ ] 상태 변경과 UI 업데이트의 관계를 이해했습니다
- [ ] 버튼 클릭 이벤트를 처리할 수 있습니다
- [ ] build() 메서드가 setState() 시 자동 호출됨을 이해했습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch01_widget_basics/ch01-02_stateful_widget_counter.dart
```

##  다음 단계

이 예제를 완료했다면 다음으로 진행하세요:
- **ch01-03**: StatefulWidget 심화 (메시지 변경)
- **ch01-04**: 위젯 트리와 build() 메서드

