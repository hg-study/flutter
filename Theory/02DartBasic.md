# Dart Basic

- [변수와 타입](#변수와-타입)
- [함수](#함수)
- [제어문](#제어문)
- [컬렉션](#컬렉션)
- [Null Safety](#null-safety)
- [클래스와 객체](#클래스와-객체)
- [제네릭](#제네릭)
- [비동기 프로그래밍](#비동기-프로그래밍)
- [함수형 프로그래밍](#함수형-프로그래밍)

<br>

---

### 변수와 타입

> Dart는 타입이 있는 언어이면서 `var`로 타입 추론을 쓸 수 있다. `final`은 한 번만 대입하는 변수, `const`는 컴파일 시점에 값이 정해지는 상수이다. 기본 타입은 `int`, `double`, `String`, `bool`이고 문자열 안에서는 `$이름`, `${식}`으로 값을 끼워 넣는다.

<br>

| 키워드 | 의미 |
| --- | --- |
| `var` | 타입 추론, 이후 같은 타입만 대입 |
| `final` | 실행 중 한 번 대입 |
| `const` | 컴파일 시점 상수 |
| `late` | 나중에 초기화, 사용 전에 반드시 대입 |

<br>

- 예제 코드: [01 기본 문법](../F01DartBasic/lib/ch01_basic_syntax/main.dart)

---

### 함수

> 함수는 반환 타입, 이름, 매개변수로 선언하고 한 줄이면 화살표(`=>`)로 줄여 쓴다. 매개변수는 위치 매개변수와, 중괄호로 선언하는 이름 있는 매개변수가 있다. 이름 있는 매개변수는 호출할 때 이름을 써서 의미가 분명하고 `required`로 필수 지정이 가능하다. 대괄호로 감싸면 선택 위치 매개변수가 된다. Flutter 위젯 생성자가 대부분 이름 있는 매개변수를 쓴다.

<br>

```dart
int add(int a, int b) => a + b;
String greet({required String name, int age = 20}) => '$name, $age';
```

---

### 제어문

> 조건문은 `if / else if / else`, `switch`, 삼항 연산자(`조건 ? 참 : 거짓`)를 쓴다. 반복문은 `for`, `for-in`, `while`, `do-while`이 있고 `break`, `continue`로 흐름을 바꾼다.

<br>

- 예제 코드: [02 제어문](../F01DartBasic/lib/ch02_control_flow/main.dart)

---

### 컬렉션

> `List`는 순서가 있고 중복을 허용하는 목록, `Map`은 키와 값 쌍, `Set`은 중복 없는 집합이다. 컬렉션 리터럴 안에서 `if`, `for`, 펼침 연산자(`...`)를 쓰는 것이 Dart의 특징이며 위젯 목록을 조건부로 만들 때 자주 쓴다.

<br>

| 컬렉션 | 선언 | 특징 |
| --- | --- | --- |
| List | `[1, 2, 3]` | 순서, 중복 허용 |
| Map | `{'a': 1}` | 키로 조회 |
| Set | `{1, 2, 3}` | 중복 제거 |

<br>

- 예제 코드: [03 컬렉션](../F01DartBasic/lib/ch03_collections/main.dart)

---

### Null Safety

> Dart는 기본적으로 변수에 null을 넣을 수 없다. null을 허용하려면 타입 뒤에 `?`를 붙인다(`String?`). null일 수 있는 값을 다룰 때는 안전 접근(`?.`), 기본값 지정(`??`), null이 아님을 단언하는 `!`를 쓰되 `!`는 실행 오류 위험이 있어 확실할 때만 쓴다. `if (x != null)` 검사 뒤에는 컴파일러가 null이 아닌 타입으로 취급한다.

<br>

| 연산자 | 의미 |
| --- | --- |
| `String?` | null 허용 타입 |
| `a?.length` | a가 null이면 null 반환 |
| `a ?? '기본'` | a가 null이면 기본값 |
| `a!` | null 아님을 단언(위험) |

<br>

- 예제 코드: [04 Null Safety](../F01DartBasic/lib/ch04_null_safety/main.dart)

---

### 클래스와 객체

> 클래스는 필드와 메서드를 묶은 설계도이다. 생성자는 `this.필드`로 필드를 바로 초기화하는 축약 문법, 이름 있는 생성자, 값을 바꿀 수 없는 `const` 생성자, 객체를 재사용하는 `factory` 생성자가 있다. 상속은 `extends`, 추상 클래스는 `abstract`, 인터페이스 구현은 `implements`, 기능 합치기는 `mixin`과 `with`이다. 이름이 `_`로 시작하면 파일 안에서만 쓰는 private이다.

<br>

- 예제 코드: [05 클래스와 객체](../F01DartBasic/lib/ch05_classes_objects/main.dart)

---

### 제네릭

> 제네릭은 타입을 매개변수로 받아 하나의 클래스나 함수를 여러 타입에 쓰는 문법이다. `List<int>`처럼 요소 타입을 정해 타입 오류를 컴파일 시점에 잡고, `T extends 상위타입`으로 허용할 타입을 제한할 수 있다.

<br>

- 예제 코드: [06 제네릭](../F01DartBasic/lib/ch06_generics/main.dart)

---

### 비동기 프로그래밍

> 오래 걸리는 작업(네트워크, 파일)은 `Future`로 결과를 나중에 받는다. `async` 함수 안에서 `await`로 결과를 기다리면 동기 코드처럼 순서대로 읽을 수 있고, 오류는 `try / catch`로 잡는다. 여러 값을 시간에 걸쳐 받는 것은 `Stream`이며 `await for`나 `listen`으로 처리한다.

<br>

```dart
Future<String> fetch() async {
  await Future.delayed(const Duration(seconds: 1));
  return '완료';
}
```

<br>

- 예제 코드: [07 비동기](../F01DartBasic/lib/ch07_async/main.dart)

---

### 함수형 프로그래밍

> 함수도 값이므로 변수에 담고 매개변수로 넘길 수 있다. 컬렉션은 `map`(변환), `where`(걸러내기), `reduce`와 `fold`(합치기), `any`와 `every`(조건 검사) 같은 고차 함수로 처리한다. 이름 없는 함수(람다)는 `(x) => x * 2`로 쓴다. 이 방식은 Flutter에서 목록을 위젯 목록으로 바꾸는 데 그대로 쓰인다.

<br>

- 예제 코드: [08 함수형 프로그래밍](../F01DartBasic/lib/ch08_functional/main.dart), [Dart 기초 문서](../F01DartBasic/00_DART_BASICS.md)
