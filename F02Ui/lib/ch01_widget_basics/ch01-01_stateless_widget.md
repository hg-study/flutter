# ch01-01: StatelessWidget 기초 - 코드 설명

##  학습 목표
- StatelessWidget의 개념 이해
- StatelessWidget 생성 방법
- build() 메서드의 역할
- 재사용 가능한 위젯 만들기

---

##  중요 코드 설명

### 1. StatelessWidget 기본 구조

```dart
class StaticWidget extends StatelessWidget {
  final String title;
  final String description;
  
  const StaticWidget({
    super.key,
    required this.title,
    required this.description,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(...);
  }
}
```

**핵심 포인트:**
- `extends StatelessWidget`: StatelessWidget을 상속
- `final` 변수: 불변 속성 (생성 후 변경 불가)
- `const` 생성자: 컴파일 타임 상수
- `build()` 메서드: UI를 반환하는 유일한 메서드

### 2. StatelessWidget의 특징

- **상태 없음**: 내부 상태를 가지지 않음
- **불변성**: 생성 후 변경 불가
- **재사용성**: 같은 입력에 항상 같은 출력
- **성능**: build()가 한 번만 호출됨

---

##  각 라인별 상세 설명

### 전체 코드 구조

```1:21:F02Ui/lib/ch01_widget_basics/ch01-01_stateless_widget.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '01-01: StatelessWidget 기초',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const StatelessWidgetPage(),
    );
  }
}
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 1 | Flutter Material 라이브러리 import - UI 위젯 사용을 위해 필요 |
| 3-5 | `main()` 함수 - 앱의 진입점, `runApp()`으로 최상위 위젯 실행 |
| 7 | `MyApp` 클래스 - StatelessWidget을 상속하는 루트 위젯 |
| 8 | `const` 생성자 - 컴파일 타임 상수로 최적화 |
| 8 | `super.key` - 부모 클래스의 key 전달 (위젯 식별용) |
| 10 | `@override` - 부모 클래스의 메서드를 재정의한다는 표시 |
| 11 | `build()` 메서드 - 위젯의 UI를 반환하는 메서드 |
| 11 | `BuildContext context` - 위젯 트리에서의 위치 정보 |
| 12 | `MaterialApp` - Material Design 앱의 루트 위젯 |
| 13 | `title` - 앱의 제목 (시스템에서 사용) |
| 14-16 | `ThemeData` - 앱의 테마 설정 |
| 15 | `ColorScheme.fromSeed()` - 시드 색상으로 색상 스킴 생성 |
| 16 | `useMaterial3: true` - Material Design 3 사용 |
| 18 | `home` - 앱이 시작될 때 표시할 위젯 |

---

### StatelessWidgetPage 클래스

```23:113:F02Ui/lib/ch01_widget_basics/ch01-01_stateless_widget.dart
class StatelessWidgetPage extends StatelessWidget {
  const StatelessWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('01-01: StatelessWidget 기초'),
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
                    'StatelessWidget이란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 상태가 없는 위젯'),
                  Text('• 한 번 생성되면 변경되지 않음'),
                  Text('• build() 메서드만 있음'),
                  Text('• 항상 같은 UI를 표시'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 예제 1
            const Text(
              '예제 1: 기본 StatelessWidget',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const StaticWidget(
              title: '정적 위젯 예제',
              description: '이 위젯은 상태가 없습니다. 항상 같은 내용을 표시합니다.',
            ),

            const SizedBox(height: 24),

            // 예제 2
            const Text(
              '예제 2: 여러 StatelessWidget 사용',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const StaticWidget(
              title: '첫 번째 정적 위젯',
              description: '항상 같은 내용을 표시합니다.',
            ),
            const SizedBox(height: 16),
            const StaticWidget(
              title: '두 번째 정적 위젯',
              description: '이 위젯도 항상 같은 내용을 표시합니다.',
            ),
            const SizedBox(height: 16),
            const StaticWidget(
              title: '세 번째 정적 위젯',
              description: 'StatelessWidget은 상태를 가지지 않습니다.',
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
| 23 | `StatelessWidgetPage` - 메인 페이지 위젯 (StatelessWidget 상속) |
| 28 | `Scaffold` - Material Design의 기본 레이아웃 구조 |
| 29-32 | `AppBar` - 상단 앱 바 (제목 표시) |
| 30 | `Theme.of(context)` - 현재 테마 정보 가져오기 |
| 33-110 | `body` - 화면의 본문 영역 |
| 33 | `SingleChildScrollView` - 스크롤 가능한 단일 자식 위젯 |
| 34 | `padding` - 내부 여백 설정 (모든 방향 16.0) |
| 35 | `Column` - 세로 방향으로 위젯 배치 |
| 36 | `crossAxisAlignment` - 가로축 정렬 (시작점 정렬) |
| 39-63 | 설명 섹션 Container |
| 40 | `padding` - Container 내부 여백 |
| 41-45 | `decoration` - Container의 스타일 설정 |
| 42 | `color` - 배경색 (파란색의 50% 투명도) |
| 43 | `borderRadius` - 모서리 둥글게 (8px) |
| 44 | `border` - 테두리 설정 |
| 46-62 | `Column` - 세로로 텍스트 배치 |
| 49-55 | 제목 Text 위젯 |
| 52-54 | `TextStyle` - 텍스트 스타일 (크기, 굵기) |
| 56 | `SizedBox` - 고정 크기 공간 (높이 8) |
| 57-60 | 설명 텍스트들 |
| 65 | `SizedBox` - 섹션 간 간격 (높이 24) |
| 68-75 | 예제 1 제목 |
| 77 | `SizedBox` - 제목과 위젯 간 간격 |
| 77-80 | `StaticWidget` 사용 예제 |
| 94-107 | 여러 개의 `StaticWidget` 사용 예제 |

---

### StaticWidget 클래스 (재사용 가능한 위젯)

```115:157:F02Ui/lib/ch01_widget_basics/ch01-01_stateless_widget.dart
// StatelessWidget 예제 클래스
class StaticWidget extends StatelessWidget {
  final String title;
  final String description;

  const StaticWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 116 | `StaticWidget` - 재사용 가능한 StatelessWidget 클래스 |
| 117-118 | `final` 변수 - 불변 속성 (생성자에서만 설정 가능) |
| 120-124 | `const` 생성자 - 컴파일 타임 상수 생성자 |
| 122 | `super.key` - 부모 클래스에 key 전달 |
| 123-124 | `required` - 필수 매개변수 (반드시 제공해야 함) |
| 127 | `build()` 메서드 - UI를 반환 |
| 128 | `Container` - 스타일을 가진 위젯 래퍼 |
| 129 | `padding` - 내부 여백 (모든 방향 16) |
| 130-134 | `decoration` - Container 스타일 |
| 131 | `color` - 배경색 (회색 100) |
| 132 | `borderRadius` - 둥근 모서리 (8px) |
| 133 | `border` - 테두리 (회색 300) |
| 135-154 | `Column` - 세로 배치 |
| 136 | `crossAxisAlignment` - 가로축 정렬 |
| 138-146 | 제목 Text 위젯 |
| 139 | `title` - 생성자에서 받은 제목 사용 |
| 145 | `SizedBox` - 제목과 설명 간 간격 |
| 146-152 | 설명 Text 위젯 |
| 147 | `description` - 생성자에서 받은 설명 사용 |
| 148-151 | `TextStyle` - 설명 텍스트 스타일 |

---

##  핵심 개념 정리

### StatelessWidget vs StatefulWidget

| 특징 | StatelessWidget | StatefulWidget |
|------|----------------|----------------|
| 상태 | 없음 | 있음 |
| 변경 가능 | 불가능 | 가능 |
| build() 호출 | 생성 시 1회 | setState() 시마다 |
| 사용 시나리오 | 정적 UI | 동적 UI |

### const 키워드의 중요성

```dart
const StaticWidget(...)  //  권장: 컴파일 타임 상수
StaticWidget(...)        //  비권장: 런타임에 매번 생성
```

**장점:**
- 성능 최적화 (같은 인스턴스 재사용)
- 메모리 절약
- 빌드 시간 단축

### final vs var

```dart
final String title;  //  불변 (생성 후 변경 불가)
var title;          //  가변 (언제든 변경 가능)
```

---

##  실전 팁

1. **가능한 한 const 사용**
   - 성능 최적화에 도움
   - 불필요한 rebuild 방지

2. **위젯을 작은 단위로 분리**
   - 재사용성 향상
   - 코드 가독성 향상
   - 유지보수 용이

3. **final 변수 사용**
   - 불변성 보장
   - 버그 예방

4. **명확한 네이밍**
   - `StaticWidget`처럼 목적이 명확한 이름 사용

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] StatelessWidget의 기본 구조를 이해했습니다
- [ ] build() 메서드의 역할을 이해했습니다
- [ ] const 생성자를 사용할 수 있습니다
- [ ] final 변수를 사용할 수 있습니다
- [ ] 재사용 가능한 위젯을 만들 수 있습니다
- [ ] StatelessWidget과 StatefulWidget의 차이를 이해했습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch01_widget_basics/ch01-01_stateless_widget.dart
```

