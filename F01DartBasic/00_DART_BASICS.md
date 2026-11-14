# Flutter 앱 개발을 위한 Dart 기초 문법

##  커리큘럼 개요

이 문서는 Flutter 앱 개발에 필요한 최소한의 Dart 문법을 단계별로 정리합니다.

---

## 1⃣ 기본 문법

### 1.1 변수 선언

```dart
// var: 타입 추론
var name = 'Flutter';
var age = 25;

// 명시적 타입 선언
String name = 'Flutter';
int age = 25;
double price = 9.99;
bool isActive = true;

// final: 한 번만 할당 가능 (런타임 상수)
final String userName = 'Dart';
// userName = 'Flutter'; // 에러!

// const: 컴파일 타임 상수
const int maxCount = 100;
const String appName = 'MyApp';
```

### 1.2 기본 데이터 타입

```dart
// 숫자 타입
int count = 42;
double price = 19.99;
num number = 10; // int 또는 double

// 문자열
String message = 'Hello';
String greeting = "World";
String multiLine = '''
여러 줄
문자열
''';

// 문자열 보간
String name = 'Flutter';
String message = 'Hello, $name!'; // 'Hello, Flutter!'
String count = 'Count: ${count + 1}'; // 표현식 사용

// 불리언
bool isActive = true;
bool isComplete = false;
```

### 1.3 함수

```dart
// 기본 함수
void printMessage() {
  print('Hello');
}

// 매개변수가 있는 함수
void greet(String name) {
  print('Hello, $name!');
}

// 반환값이 있는 함수
int add(int a, int b) {
  return a + b;
}

// 화살표 함수 (단일 표현식)
int multiply(int a, int b) => a * b;

// 선택적 매개변수
void showInfo(String name, [int? age]) {
  print('Name: $name');
  if (age != null) {
    print('Age: $age');
  }
}

// 명명된 매개변수
void createUser({required String name, int age = 0}) {
  print('Name: $name, Age: $age');
}
// 사용: createUser(name: 'Flutter', age: 25);

// 기본값이 있는 매개변수
void greet(String name, {String greeting = 'Hello'}) {
  print('$greeting, $name!');
}
```

---

## 2⃣ 제어문

### 2.1 조건문

```dart
// if-else
int score = 85;
if (score >= 90) {
  print('A');
} else if (score >= 80) {
  print('B');
} else {
  print('C');
}

// 삼항 연산자
String grade = score >= 60 ? 'Pass' : 'Fail';

// switch-case
String day = 'Monday';
switch (day) {
  case 'Monday':
    print('Start of week');
    break;
  case 'Friday':
    print('Weekend!');
    break;
  default:
    print('Other day');
}
```

### 2.2 반복문

```dart
// for 루프
for (int i = 0; i < 5; i++) {
  print(i);
}

// for-in 루프
List<String> fruits = ['apple', 'banana', 'orange'];
for (String fruit in fruits) {
  print(fruit);
}

// while 루프
int count = 0;
while (count < 5) {
  print(count);
  count++;
}

// do-while 루프
int num = 0;
do {
  print(num);
  num++;
} while (num < 5);
```

---

## 3⃣ 컬렉션

### 3.1 List (리스트)

```dart
// 리스트 생성
List<String> fruits = ['apple', 'banana', 'orange'];
var numbers = [1, 2, 3, 4, 5];

// 리스트 조작
fruits.add('grape');           // 추가
fruits.remove('banana');       // 제거
fruits.length;                 // 길이
fruits[0];                     // 접근
fruits.contains('apple');      // 포함 여부

// 리스트 순회
for (String fruit in fruits) {
  print(fruit);
}

fruits.forEach((fruit) {
  print(fruit);
});
```

### 3.2 Map (맵)

```dart
// 맵 생성
Map<String, int> scores = {
  'Alice': 95,
  'Bob': 87,
  'Charlie': 92,
};

// 맵 조작
scores['David'] = 88;          // 추가/수정
scores.remove('Bob');           // 제거
scores.containsKey('Alice');   // 키 존재 여부
scores.length;                  // 크기

// 맵 순회
scores.forEach((name, score) {
  print('$name: $score');
});

for (var entry in scores.entries) {
  print('${entry.key}: ${entry.value}');
}
```

### 3.3 Set (집합)

```dart
// Set 생성
Set<String> uniqueNames = {'Alice', 'Bob', 'Charlie'};
var numbers = <int>{1, 2, 3, 4, 5};

// Set 조작
uniqueNames.add('David');      // 추가
uniqueNames.remove('Bob');     // 제거
uniqueNames.contains('Alice'); // 포함 여부
```

---

## 4⃣ Null Safety

```dart
// Nullable 타입
String? name;              // null 가능
String name2 = 'Flutter';  // null 불가능

// Null 체크
if (name != null) {
  print(name.length);
}

// Null 안전 연산자
int? length = name?.length;        // name이 null이면 null 반환
int length2 = name?.length ?? 0;   // null이면 0 반환
int length3 = name!.length;        // null이 아님을 보장 (위험!)

// Null 체크 패턴
void printLength(String? text) {
  if (text != null) {
    print(text.length);
  }
  
  // 또는
  print(text?.length ?? 0);
}
```

---

## 5⃣ 클래스와 객체

### 5.1 기본 클래스

```dart
// 클래스 정의
class Person {
  String name;
  int age;
  
  // 생성자
  Person(this.name, this.age);
  
  // 메서드
  void introduce() {
    print('I am $name, $age years old');
  }
}

// 사용
Person person = Person('Flutter', 25);
person.introduce();
```

### 5.2 생성자

```dart
class User {
  String name;
  int age;
  String? email;
  
  // 기본 생성자
  User(this.name, this.age);
  
  // 명명된 생성자
  User.guest() : name = 'Guest', age = 0;
  
  // 명명된 생성자 with 초기화 리스트
  User.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        age = map['age'];
  
  // 선택적 매개변수 생성자
  User.detailed({required this.name, this.age = 0, this.email});
}

// 사용
var user1 = User('Alice', 25);
var user2 = User.guest();
var user3 = User.detailed(name: 'Bob', age: 30, email: 'bob@example.com');
```

### 5.3 상속

```dart
// 부모 클래스
class Animal {
  String name;
  
  Animal(this.name);
  
  void makeSound() {
    print('Some sound');
  }
}

// 자식 클래스
class Dog extends Animal {
  Dog(String name) : super(name);
  
  @override
  void makeSound() {
    print('Woof!');
  }
  
  void wagTail() {
    print('$name is wagging tail');
  }
}

// 사용
Dog dog = Dog('Buddy');
dog.makeSound();  // 'Woof!'
dog.wagTail();    // 'Buddy is wagging tail'
```

### 5.4 추상 클래스와 인터페이스

```dart
// 추상 클래스
abstract class Shape {
  double area();  // 추상 메서드
  
  void printArea() {
    print('Area: ${area()}');
  }
}

class Circle extends Shape {
  double radius;
  
  Circle(this.radius);
  
  @override
  double area() {
    return 3.14 * radius * radius;
  }
}
```

---

## 6⃣ 제네릭

```dart
// 제네릭 클래스
class Box<T> {
  T content;
  
  Box(this.content);
  
  T getContent() {
    return content;
  }
}

// 사용
Box<String> stringBox = Box<String>('Hello');
Box<int> intBox = Box<int>(42);

// 제네릭 메서드
T first<T>(List<T> items) {
  return items[0];
}

String firstString = first<String>(['a', 'b', 'c']);
int firstInt = first<int>([1, 2, 3]);
```

---

## 7⃣ 비동기 프로그래밍

### 7.1 Future

```dart
// Future 기본
Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 2), () {
    return 'Data loaded';
  });
}

// Future 사용 (then)
fetchData().then((data) {
  print(data);
}).catchError((error) {
  print('Error: $error');
});

// async/await
Future<void> loadData() async {
  try {
    String data = await fetchData();
    print(data);
  } catch (error) {
    print('Error: $error');
  }
}
```

### 7.2 async/await 패턴

```dart
// 비동기 함수
Future<int> calculateSum(int a, int b) async {
  await Future.delayed(Duration(seconds: 1));
  return a + b;
}

// 여러 Future 처리
Future<void> loadMultipleData() async {
  // 순차 실행
  var data1 = await fetchData1();
  var data2 = await fetchData2();
  
  // 병렬 실행
  var results = await Future.wait([
    fetchData1(),
    fetchData2(),
    fetchData3(),
  ]);
}
```

---

## 8⃣ 함수형 프로그래밍

### 8.1 람다 함수

```dart
// 익명 함수
var add = (int a, int b) => a + b;

// 함수를 변수로
void Function(String) printer = (String text) {
  print(text);
};

// 고차 함수
void processList(List<int> numbers, void Function(int) action) {
  for (int num in numbers) {
    action(num);
  }
}

// 사용
processList([1, 2, 3], (num) => print(num * 2));
```

### 8.2 컬렉션 메서드

```dart
List<int> numbers = [1, 2, 3, 4, 5];

// map: 변환
var doubled = numbers.map((n) => n * 2).toList();
// [2, 4, 6, 8, 10]

// where: 필터링
var evens = numbers.where((n) => n % 2 == 0).toList();
// [2, 4]

// forEach: 순회
numbers.forEach((n) => print(n));

// reduce: 축약
var sum = numbers.reduce((a, b) => a + b);
// 15

// fold: 초기값과 함께 축약
var product = numbers.fold(1, (a, b) => a * b);
// 120

// any: 조건 만족하는 요소 존재 여부
bool hasEven = numbers.any((n) => n % 2 == 0);
// true

// every: 모든 요소가 조건 만족 여부
bool allPositive = numbers.every((n) => n > 0);
// true
```

---

## 9⃣ 열거형 (Enum)

```dart
// Enum 정의
enum Status {
  pending,
  approved,
  rejected,
}

// 사용
Status currentStatus = Status.pending;

// switch와 함께
switch (currentStatus) {
  case Status.pending:
    print('Waiting...');
    break;
  case Status.approved:
    print('Approved!');
    break;
  case Status.rejected:
    print('Rejected');
    break;
}
```

---

##  확장 메서드 (Extension)

```dart
// String 확장
extension StringExtension on String {
  bool get isEmail {
    return contains('@') && contains('.');
  }
  
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

// 사용
String email = 'user@example.com';
print(email.isEmail);  // true
print('hello'.capitalize());  // 'Hello'
```

---

## 1⃣1⃣ 믹스인 (Mixin)

```dart
// Mixin 정의
mixin Flyable {
  void fly() {
    print('Flying...');
  }
}

mixin Swimmable {
  void swim() {
    print('Swimming...');
  }
}

// 클래스에 Mixin 적용
class Duck with Flyable, Swimmable {
  void quack() {
    print('Quack!');
  }
}

// 사용
Duck duck = Duck();
duck.fly();   // 'Flying...'
duck.swim();  // 'Swimming...'
duck.quack(); // 'Quack!'
```

---

## 1⃣2⃣ Flutter에서 자주 사용하는 패턴

### 12.1 Named Constructor 패턴

```dart
class ApiResponse {
  final bool success;
  final dynamic data;
  final String? error;
  
  ApiResponse.success(this.data) 
      : success = true, 
        error = null;
  
  ApiResponse.failure(this.error) 
      : success = false, 
        data = null;
}
```

### 12.2 Factory Constructor 패턴

```dart
class Logger {
  static final Logger _instance = Logger._internal();
  
  factory Logger() {
    return _instance;
  }
  
  Logger._internal();
  
  void log(String message) {
    print('[LOG] $message');
  }
}

// 싱글톤 사용
Logger logger = Logger();
logger.log('Hello');
```

### 12.3 Callback 패턴

```dart
class Button {
  void Function()? onPressed;
  
  void click() {
    onPressed?.call();
  }
}

// 사용
Button button = Button();
button.onPressed = () {
  print('Button clicked!');
};
button.click();
```

---

##  실전 예제: Flutter 위젯과 연계

```dart
import 'package:flutter/material.dart';

// 1. 클래스 정의
class User {
  final String name;
  final int age;
  final String? email;
  
  User({required this.name, required this.age, this.email});
  
  // 2. Factory 생성자로 JSON 파싱
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      age: json['age'] as int,
      email: json['email'] as String?,
    );
  }
  
  // 3. Map으로 변환
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'email': email,
    };
  }
}

// 4. 비동기 데이터 로드
Future<List<User>> fetchUsers() async {
  await Future.delayed(Duration(seconds: 1));
  return [
    User(name: 'Alice', age: 25),
    User(name: 'Bob', age: 30),
  ];
}

// 5. Flutter 위젯에서 사용
class UserListWidget extends StatefulWidget {
  @override
  _UserListWidgetState createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  List<User> users = [];
  bool isLoading = true;
  
  @override
  void initState() {
    super.initState();
    loadUsers();
  }
  
  Future<void> loadUsers() async {
    final fetchedUsers = await fetchUsers();
    setState(() {
      users = fetchedUsers;
      isLoading = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CircularProgressIndicator();
    }
    
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          title: Text(user.name),
          subtitle: Text('Age: ${user.age}'),
        );
      },
    );
  }
}
```

---

##  학습 순서 추천

1. **1-2주차**: 기본 문법 (변수, 타입, 함수, 제어문)
2. **3주차**: 컬렉션 (List, Map, Set)
3. **4주차**: Null Safety와 클래스 기초
4. **5주차**: 상속, 추상 클래스, 제네릭
5. **6주차**: 비동기 프로그래밍 (Future, async/await)
6. **7주차**: 함수형 프로그래밍 (람다, 고차 함수)
7. **8주차**: 고급 기능 (Extension, Mixin, Enum)

---

##  추가 학습 자료

- [Dart 공식 문서](https://dart.dev/guides)
- [Flutter 공식 문서](https://docs.flutter.dev/)
- [Dart 언어 투어](https://dart.dev/guides/language/language-tour)

---

##  체크리스트

Flutter 앱 개발을 시작하기 전에 다음을 숙지하세요:

- [ ] 변수 선언과 타입 이해
- [ ] 함수 작성과 호출
- [ ] 제어문 (if, for, while, switch)
- [ ] 컬렉션 (List, Map) 조작
- [ ] Null Safety 이해
- [ ] 클래스와 객체 생성
- [ ] 생성자 패턴 이해
- [ ] 상속과 오버라이드
- [ ] Future와 async/await
- [ ] 람다 함수와 고차 함수
- [ ] 제네릭 기본 이해

