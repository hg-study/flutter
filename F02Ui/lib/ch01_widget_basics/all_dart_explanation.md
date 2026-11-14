# -------------------------------------------
# 01단계: 위젯 기초
# -------------------------------------------

##  학습 목표

이 단계에서는 Flutter의 위젯 기초를 학습합니다:
- StatelessWidget vs StatefulWidget
- Widget 트리 구조
- build() 메서드
- setState()를 통한 상태 업데이트

---

# -------------------------------------------
# 1. 위젯이란?
# -------------------------------------------

## 1.1 위젯의 개념

Flutter에서 **모든 것이 위젯**입니다.

```dart
Text('Hello')           // 위젯
Button(...)             // 위젯
Container(...)          // 위젯
Scaffold(...)           // 위젯
```

- 화면의 모든 요소는 위젯
- 위젯은 UI를 구성하는 기본 단위
- 위젯을 조합해서 복잡한 UI 생성

## 1.2 위젯의 특징

- **불변(Immutable)**: 위젯은 변경할 수 없음
- **구성 가능(Composable)**: 작은 위젯을 조합해 큰 위젯 생성
- **계층 구조**: 위젯 트리로 구성

---

# -------------------------------------------
# 2. StatelessWidget
# -------------------------------------------

## 2.1 StatelessWidget이란?

**상태가 없는 위젯** - 한 번 생성되면 변경되지 않음

```dart
class StaticWidget extends StatelessWidget {
  final String title;
  
  const StaticWidget({super.key, required this.title});
  
  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
```

**특징:**
- 상태를 가지지 않음
- build() 메서드만 있음
- 항상 같은 UI를 표시

## 2.2 사용 시나리오

- 정적 텍스트
- 아이콘
- 이미지
- 레이블
- 상수 값 표시

---

# -------------------------------------------
# 3. StatefulWidget
# -------------------------------------------

## 3.1 StatefulWidget이란?

**상태를 가진 위젯** - 상태가 변경되면 UI가 업데이트됨

```dart
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});
  
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;
  
  void _increment() {
    setState(() {
      _counter++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$_counter'),
        ElevatedButton(
          onPressed: _increment,
          child: Text('증가'),
        ),
      ],
    );
  }
}
```

**구조:**
- **StatefulWidget**: 위젯 정의 (불변)
- **State**: 상태 관리 (가변)
- **setState()**: 상태 변경 및 UI 업데이트

## 3.2 setState()의 역할

```dart
setState(() {
  _counter++;  // 상태 변경
});
```

**동작:**
1. 상태 변경
2. build() 메서드 자동 호출
3. UI 다시 그리기

**주의사항:**
- setState() 없이 상태 변경하면 UI 업데이트 안 됨
- build() 메서드 내에서 setState() 호출 금지

---

# -------------------------------------------
# 4. Widget 트리 구조
# -------------------------------------------

## 4.1 위젯 계층 구조

```
MaterialApp
└── Scaffold
    ├── AppBar
    └── Body
        └── Column
            ├── Text
            ├── Button
            └── Image
```

- 부모-자식 관계
- 위에서 아래로 전달 (데이터 흐름)
- 아래에서 위로 이벤트 전달

## 4.2 위젯 트리의 특징

- **단일 루트**: 하나의 루트 위젯
- **중첩 가능**: 위젯 안에 위젯
- **재사용 가능**: 같은 위젯 여러 번 사용

---

# -------------------------------------------
# 5. build() 메서드
# -------------------------------------------

## 5.1 build() 메서드의 역할

```dart
@override
Widget build(BuildContext context) {
  return Widget(...);
}
```

- 위젯을 반환
- UI를 구성하는 코드
- setState() 호출 시 자동 실행

## 5.2 build() 메서드 특징

**빠르게 실행되어야 함:**
- 무거운 작업 금지
- 네트워크 요청 금지
- 파일 I/O 금지

**순수 함수처럼:**
- 같은 입력 → 같은 출력
- 부수 효과 최소화

---

# -------------------------------------------
# 6. StatelessWidget vs StatefulWidget
# -------------------------------------------

## 6.1 비교표

| 특징 | StatelessWidget | StatefulWidget |
|------|----------------|----------------|
| 상태 | 없음 | 있음 |
| 변경 가능 | 불가능 | 가능 |
| build() 호출 | 생성 시 1회 | setState() 시마다 |
| 사용 시나리오 | 정적 UI | 동적 UI |

## 6.2 선택 가이드

**StatelessWidget 사용:**
- 항상 같은 내용 표시
- 사용자 입력 없음
- 외부 데이터에 의존하지 않음

**StatefulWidget 사용:**
- 사용자 입력 처리
- 상태 변경 필요
- 애니메이션
- 타이머

---

# -------------------------------------------
#  실전 예제
# -------------------------------------------

## 예제 1: 정적 프로필 카드

```dart
class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  
  const ProfileCard({
    super.key,
    required this.name,
    required this.email,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(name),
          Text(email),
        ],
      ),
    );
  }
}
```

## 예제 2: 카운터 앱

```dart
class CounterApp extends StatefulWidget {
  const CounterApp({super.key});
  
  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _count = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_count'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: Text('증가'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

# -------------------------------------------
#  체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] StatelessWidget과 StatefulWidget의 차이를 이해했습니다
- [ ] StatelessWidget을 만들 수 있습니다
- [ ] StatefulWidget을 만들 수 있습니다
- [ ] setState()를 사용할 수 있습니다
- [ ] build() 메서드의 역할을 이해했습니다
- [ ] 위젯 트리 구조를 이해했습니다
- [ ] 언제 StatelessWidget을 사용할지 판단할 수 있습니다
- [ ] 언제 StatefulWidget을 사용할지 판단할 수 있습니다

---

# -------------------------------------------
#  실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [run.md](run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F02Ui
flutter run lib/ch01_widget_basics/main.dart
```

---

# -------------------------------------------
#  다음 단계
# -------------------------------------------

01단계를 완료했다면 다음 단계로 진행하세요:
- **02단계: 레이아웃 위젯** - Container, Row, Column, Stack 등

##  전체 커리큘럼

1.  **01단계: 위젯 기초** - StatelessWidget, StatefulWidget (현재 단계)
2. ⏭ **02단계: 레이아웃 위젯** - Container, Row, Column, Stack
3. ⏭ **03단계: 기본 UI 위젯** - Text, Image, Button, AppBar
4. ⏭ **04단계: 리스트와 그리드** - ListView, GridView, Card
5. ⏭ **05단계: 네비게이션** - Navigator, Routes
6. ⏭ **06단계: 폼과 입력** - TextField, Form, Checkbox
7. ⏭ **07단계: 테마와 스타일링** - ThemeData, ColorScheme
8. ⏭ **08단계: 고급 레이아웃** - Wrap, Flexible, SafeArea

---

# -------------------------------------------
#  팁
# -------------------------------------------

1. **위젯 선택 가이드**
   - 기본적으로 StatelessWidget 사용
   - 상태가 필요할 때만 StatefulWidget 사용
   - 불필요한 StatefulWidget은 성능 저하

2. **setState() 사용**
   - 필요한 경우에만 호출
   - build() 내부에서 호출 금지
   - 작은 범위로 제한

3. **성능 최적화**
   - const 위젯 사용 (가능한 경우)
   - 불필요한 rebuild 방지
   - 위젯 분리로 재사용성 향상

4. **실전 활용**
   - 재사용 가능한 위젯 만들기
   - 위젯을 작은 단위로 분리
   - 명확한 책임 분리

