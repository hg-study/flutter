# -------------------------------------------
# 01단계: 기본 문법
# -------------------------------------------

##  학습 목표

이 단계에서는 Dart 언어의 기본 문법을 학습합니다:
- 변수 선언 방법 (var, final, const)
- 기본 데이터 타입 (int, double, String, bool)
- 함수 정의와 호출 방법

---

# -------------------------------------------
# 1. 변수 선언
# -------------------------------------------

### 1.1 var - 타입 추론

```dart
var name = 'Flutter';
var age = 25;
```

- `var` 키워드는 변수의 타입을 자동으로 추론합니다
- 값에 따라 타입이 결정됩니다
- Dart는 정적 타입 언어이지만 타입 추론을 지원합니다

### 1.2 명시적 타입 선언

```dart
String name = 'Flutter';
int age = 25;
double price = 9.99;
bool isActive = true;
```

- 타입을 명시적으로 선언할 수 있습니다
- 코드 가독성이 향상됩니다
- 타입 안정성이 보장됩니다

### 1.3 final - 런타임 상수

```dart
final String userName = 'Dart';
// userName = 'Flutter'; // 에러! 재할당 불가
```

- `final`은 한 번만 할당 가능한 변수입니다
- 할당 후 값 변경이 불가능합니다
- 런타임에 값이 결정됩니다

**사용 시나리오:**
- API 응답으로 받은 데이터
- 사용자 입력으로 받은 값
- 계산된 결과값

### 1.4 const - 컴파일 타임 상수

```dart
const int maxCount = 100;
const String appName = 'MyApp';
```

- `const`는 컴파일 타임에 값이 결정되는 상수입니다
- 더 효율적입니다 (메모리 사용 최적화)
- 상수 표현식만 사용 가능합니다

**사용 시나리오:**
- 앱 이름, 버전 등 고정된 값
- 수학 상수 (PI 등)
- 설정값

###  실습: 변수 선언 비교

| 키워드 | 재할당 | 초기화 시점 | 사용 예시 |
|--------|--------|-------------|-----------|
| `var` | 가능 | 런타임 | 일반 변수 |
| `final` | 불가능 | 런타임 | API 응답 데이터 |
| `const` | 불가능 | 컴파일 타임 | 앱 설정값 |

---

# -------------------------------------------
# 2. 기본 데이터 타입
# -------------------------------------------

### 2.1 숫자 타입

#### int (정수)
```dart
int count = 42;
int negative = -10;
```

#### double (실수)
```dart
double price = 19.99;
double height = 175.5;
```

#### num (int 또는 double)
```dart
num number = 10;      // int 가능
num decimal = 3.14;    // double 가능
```

### 2.2 숫자 연산

```dart
int a = 10;
int b = 3;

a + b;  // 덧셈: 13
a - b;  // 뺄셈: 7
a * b;  // 곱셈: 30
a / b;  // 나눗셈: 3.333... (double 반환)
a ~/ b; // 정수 나눗셈: 3 (int 반환)
a % b;  // 나머지: 1
```

### 2.3 String (문자열)

#### 기본 문자열
```dart
String message = 'Hello';
String greeting = "World";
```

#### 여러 줄 문자열
```dart
String multiLine = '''
첫 번째 줄
두 번째 줄
세 번째 줄
''';
```

#### 문자열 보간 (String Interpolation)
```dart
String name = 'Flutter';
String message = 'Hello, $name!';           // 'Hello, Flutter!'
String count = 'Count: ${count + 1}';       // 표현식 사용
```

**중요 포인트:**
- `$변수명`: 변수 값 삽입
- `${표현식}`: 표현식 결과 삽입

#### 문자열 메서드
```dart
String text = '  Hello World  ';

text.toUpperCase();    // '  HELLO WORLD  '
text.toLowerCase();    // '  hello world  '
text.trim();           // 'Hello World'
text.length;           // 15
text.contains('Hello'); // true
text.substring(0, 5);   // '  Hel'
```

### 2.4 bool (불리언)

```dart
bool isActive = true;
bool isComplete = false;

// 논리 연산
bool result1 = true && false;  // AND: false
bool result2 = true || false;  // OR: true
bool result3 = !true;           // NOT: false
```

---

# -------------------------------------------
# 3. 함수
# -------------------------------------------

### 3.1 기본 함수

```dart
void printMessage() {
  print('Hello');
}
```

- `void`: 반환값이 없음을 의미
- 함수 이름: `printMessage`
- `{}`: 함수 본문

### 3.2 매개변수가 있는 함수

```dart
void greet(String name) {
  print('Hello, $name!');
}

// 호출
greet('Alice');  // 'Hello, Alice!'
```

### 3.3 반환값이 있는 함수

```dart
int add(int a, int b) {
  return a + b;
}

// 호출
int sum = add(10, 20);  // 30
```

### 3.4 화살표 함수 (Arrow Function)

```dart
int multiply(int a, int b) => a * b;

// 위 코드는 아래와 동일합니다
int multiply(int a, int b) {
  return a * b;
}
```

**사용 시나리오:**
- 단일 표현식만 있는 함수
- 간결한 코드 작성
- getter 메서드

### 3.5 선택적 매개변수 (Optional Positional Parameters)

```dart
void showInfo(String name, [int? age]) {
  print('Name: $name');
  if (age != null) {
    print('Age: $age');
  }
}

// 호출
showInfo('Bob');           // age는 null
showInfo('Charlie', 25);   // age는 25
```

- `[]`: 선택적 매개변수 표시
- `?`: null 가능 타입
- 순서대로 전달해야 함

### 3.6 명명된 매개변수 (Named Parameters)

```dart
void createUser({required String name, int age = 0}) {
  print('Name: $name, Age: $age');
}

// 호출
createUser(name: 'David', age: 30);
createUser(name: 'Eve');  // age는 기본값 0 사용
```

- `{}`: 명명된 매개변수 표시
- `required`: 필수 매개변수
- `= 값`: 기본값 설정
- 순서와 무관하게 전달 가능

**Flutter에서 자주 사용:**
```dart
Text(
  'Hello',
  style: TextStyle(fontSize: 16),
  textAlign: TextAlign.center,
)
```

### 3.7 기본값이 있는 명명된 매개변수

```dart
void greetUser(String name, {String greeting = 'Hello'}) {
  print('$greeting, $name!');
}

// 호출
greetUser('Frank');              // 'Hello, Frank!'
greetUser('Grace', greeting: 'Hi');  // 'Hi, Grace!'
```

---

# -------------------------------------------
#  실습 예제
# -------------------------------------------

### 예제 1: 사용자 정보 출력 함수 만들기

```dart
void printUserInfo(String name, {int? age, String? email}) {
  print('=== 사용자 정보 ===');
  print('이름: $name');
  if (age != null) {
    print('나이: $age');
  }
  if (email != null) {
    print('이메일: $email');
  }
}

// 사용
printUserInfo('Alice', age: 25, email: 'alice@example.com');
```

### 예제 2: 계산기 함수 만들기

```dart
double calculateTotal(double price, {double discount = 0, double tax = 0}) {
  double discountedPrice = price - discount;
  double finalPrice = discountedPrice + (discountedPrice * tax / 100);
  return finalPrice;
}

// 사용
double total = calculateTotal(100, discount: 10, tax: 5);
print('최종 가격: \$$total');
```

---

# -------------------------------------------
#  체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] var, final, const의 차이를 이해했습니다
- [ ] int, double, String, bool 타입을 사용할 수 있습니다
- [ ] 문자열 보간(`$변수`, `${표현식}`)을 사용할 수 있습니다
- [ ] 기본 함수를 정의하고 호출할 수 있습니다
- [ ] 화살표 함수를 사용할 수 있습니다
- [ ] 선택적 매개변수와 명명된 매개변수를 구분할 수 있습니다
- [ ] `required`와 기본값 설정을 이해했습니다

---

# -------------------------------------------
#  실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [Run.md](Run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F01DartBasic
dart run lib/ch01_basic_syntax/main.dart
```

---

# -------------------------------------------
#  다음 단계
# -------------------------------------------

01단계를 완료했다면 다음 단계로 진행하세요:
- **02단계: 제어문** - if/else, switch, for/while 등

##  전체 커리큘럼

1.  **01단계: 기본 문법** - 변수, 타입, 함수 (현재 단계)
2. ⏭ **02단계: 제어문** - if/else, switch, for/while
3. ⏭ **03단계: 컬렉션** - List, Map, Set
4. ⏭ **04단계: Null Safety** - null 안전 처리
5. ⏭ **05단계: 클래스와 객체** - 클래스, 생성자, 상속
6. ⏭ **06단계: 제네릭** - 타입 파라미터
7. ⏭ **07단계: 비동기 프로그래밍** - Future, async/await
8. ⏭ **08단계: 함수형 프로그래밍** - 람다, 고차 함수

---

# -------------------------------------------
#  팁
# -------------------------------------------

1. **타입 추론 vs 명시적 타입**
   - 간단한 변수: `var` 사용
   - 복잡한 로직: 명시적 타입 선언

2. **final vs const**
   - 런타임에 결정되는 값: `final`
   - 컴파일 타임에 결정되는 값: `const`

3. **함수 매개변수 선택**
   - 매개변수가 많을 때: 명명된 매개변수 사용
   - 선택적 매개변수: `[]` 사용
   - 필수 매개변수: `required` 사용

