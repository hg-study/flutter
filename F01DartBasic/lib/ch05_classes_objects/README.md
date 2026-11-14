# -------------------------------------------
# 05단계: 클래스와 객체
# -------------------------------------------

##  학습 목표

이 단계에서는 Dart의 클래스와 객체를 학습합니다:
- 클래스 정의와 객체 생성
- 생성자 (기본, 명명된, fromMap)
- Getter와 Setter
- 상속과 오버라이드
- 추상 클래스
- 정적 멤버

---

# -------------------------------------------
# 1. 기본 클래스
# -------------------------------------------

## 1.1 클래스 정의

```dart
class Person {
  String name;
  int age;
  
  // 생성자
  Person(this.name, this.age);
  
  // 메서드
  void introduce() {
    print('안녕하세요, 저는 $name이고 ${age}살입니다.');
  }
}
```

**구성 요소:**
- **필드 (Fields)**: 클래스의 데이터
- **생성자 (Constructor)**: 객체 생성
- **메서드 (Methods)**: 클래스의 동작

## 1.2 객체 생성 및 사용

```dart
Person person = Person('Alice', 25);
person.introduce();
```

- `new` 키워드는 선택사항 (생략 가능)
- 객체는 클래스의 인스턴스
- 점(`.`)으로 멤버에 접근

---

# -------------------------------------------
# 2. 생성자
# -------------------------------------------

## 2.1 기본 생성자

```dart
class User {
  String name;
  int age;
  
  User(this.name, this.age);
}
```

- `this.필드명`: 생성자 매개변수를 필드에 직접 할당
- 간결한 생성자 작성

## 2.2 명명된 생성자 (Named Constructor)

```dart
class User {
  String name;
  int age;
  
  User(this.name, this.age);
  
  // 명명된 생성자
  User.guest() : name = 'Guest', age = 0;
  
  User.admin(String name) : name = name, age = 0;
}
```

**사용:**
```dart
User guest = User.guest();
User admin = User.admin('Admin');
```

- 다양한 방식으로 객체 생성
- 초기화 리스트(`:`) 사용

## 2.3 fromMap 생성자

```dart
class User {
  String name;
  int age;
  
  User.fromMap(Map<String, dynamic> map)
      : name = map['name'] as String,
        age = map['age'] as int;
}
```

**사용:**
```dart
Map<String, dynamic> data = {'name': 'Alice', 'age': 25};
User user = User.fromMap(data);
```

- JSON이나 Map 데이터로부터 객체 생성
- API 응답 처리에 유용

## 2.4 명명된 매개변수 생성자

```dart
class User {
  String name;
  int age;
  String? email;
  
  User.detailed({required this.name, this.age = 0, this.email});
}
```

**사용:**
```dart
User user = User.detailed(
  name: 'Bob',
  age: 30,
  email: 'bob@example.com',
);
```

- 선택적 매개변수 지원
- `required`: 필수 매개변수
- 기본값 설정 가능

---

# -------------------------------------------
# 3. Getter와 Setter
# -------------------------------------------

## 3.1 Getter

```dart
class Rectangle {
  double _width;
  double _height;
  
  Rectangle(this._width, this._height);
  
  // Getter
  double get area => _width * _height;
  double get width => _width;
}
```

- `get` 키워드로 읽기 전용 속성
- 계산된 값을 반환 가능
- 메서드처럼 호출하지만 속성처럼 사용

## 3.2 Setter

```dart
class Rectangle {
  double _width;
  
  set width(double value) {
    if (value > 0) {
      _width = value;
    }
  }
}
```

- `set` 키워드로 쓰기 속성
- 유효성 검사 가능
- 속성처럼 할당하지만 메서드처럼 동작

## 3.3 Private 필드

```dart
class Rectangle {
  double _width;  // _로 시작하면 private
  double _height;
}
```

- `_`로 시작하는 필드는 private
- 같은 파일에서만 접근 가능
- 캡슐화 구현

---

# -------------------------------------------
# 4. 상속
# -------------------------------------------

## 4.1 기본 상속

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
```

**특징:**
- `extends`: 상속 키워드
- `super`: 부모 클래스 참조
- `@override`: 메서드 오버라이드 표시

## 4.2 super 사용

```dart
class Dog extends Animal {
  Dog(String name) : super(name);  // 부모 생성자 호출
  
  void makeSound() {
    super.makeSound();  // 부모 메서드 호출
    print('Woof!');
  }
}
```

---

# -------------------------------------------
# 5. 추상 클래스
# -------------------------------------------

## 5.1 추상 클래스 정의

```dart
abstract class Shape {
  // 추상 메서드 (구현 없음)
  double area();
  
  // 일반 메서드 (구현 있음)
  void printArea() {
    print('Area: ${area()}');
  }
}
```

**특징:**
- `abstract`: 추상 클래스 키워드
- 직접 인스턴스화 불가
- 추상 메서드는 구현 없음
- 일반 메서드도 포함 가능

## 5.2 추상 클래스 구현

```dart
class Circle extends Shape {
  double radius;
  
  Circle(this.radius);
  
  @override
  double area() {
    return 3.14159 * radius * radius;
  }
}
```

- 추상 메서드는 반드시 구현해야 함
- `@override`로 명시

---

# -------------------------------------------
# 6. 정적 멤버 (Static)
# -------------------------------------------

## 6.1 정적 변수

```dart
class MathUtils {
  static const double PI = 3.14159;
}
```

- `static`: 클래스 레벨 멤버
- 인스턴스 없이 접근 가능
- 클래스 이름으로 접근

## 6.2 정적 메서드

```dart
class MathUtils {
  static int add(int a, int b) {
    return a + b;
  }
}

// 사용
int sum = MathUtils.add(10, 20);
```

**사용 시나리오:**
- 유틸리티 함수
- 상수 값
- 팩토리 메서드

---

# -------------------------------------------
#  실전 예제
# -------------------------------------------

## 예제 1: 학생 관리 클래스

```dart
class Student {
  String name;
  int age;
  String major;
  List<int> grades = [];
  
  Student(this.name, this.age, this.major);
  
  void addGrade(int grade) {
    grades.add(grade);
  }
  
  double getAverage() {
    if (grades.isEmpty) return 0.0;
    int sum = grades.reduce((a, b) => a + b);
    return sum / grades.length;
  }
}
```

## 예제 2: 은행 계좌 클래스

```dart
class BankAccount {
  String accountNumber;
  double balance;
  
  BankAccount(this.accountNumber, this.balance);
  
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
    }
  }
  
  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
    }
  }
}
```

---

# -------------------------------------------
#  체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] 클래스를 정의하고 객체를 생성할 수 있습니다
- [ ] 기본 생성자를 사용할 수 있습니다
- [ ] 명명된 생성자를 사용할 수 있습니다
- [ ] fromMap 생성자를 만들 수 있습니다
- [ ] Getter와 Setter를 사용할 수 있습니다
- [ ] 상속을 이해하고 사용할 수 있습니다
- [ ] 메서드를 오버라이드할 수 있습니다
- [ ] 추상 클래스를 이해하고 구현할 수 있습니다
- [ ] 정적 멤버를 사용할 수 있습니다

---

# -------------------------------------------
#  실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [Run.md](Run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F01DartBasic
dart run lib/ch05_classes_objects/main.dart
```

---

# -------------------------------------------
#  다음 단계
# -------------------------------------------

05단계를 완료했다면 다음 단계로 진행하세요:
- **06단계: 제네릭** - 타입 파라미터

##  전체 커리큘럼

1.  **01단계: 기본 문법** - 변수, 타입, 함수
2.  **02단계: 제어문** - if/else, switch, for/while
3.  **03단계: 컬렉션** - List, Map, Set
4.  **04단계: Null Safety** - null 안전 처리
5.  **05단계: 클래스와 객체** - 클래스, 생성자, 상속 (현재 단계)
6. ⏭ **06단계: 제네릭** - 타입 파라미터
7. ⏭ **07단계: 비동기 프로그래밍** - Future, async/await
8. ⏭ **08단계: 함수형 프로그래밍** - 람다, 고차 함수

---

# -------------------------------------------
#  팁
# -------------------------------------------

1. **생성자 선택 가이드**
   - 간단한 초기화: 기본 생성자
   - 다양한 생성 방식: 명명된 생성자
   - 데이터 변환: fromMap 생성자

2. **상속 vs 조합**
   - "is-a" 관계: 상속 사용
   - "has-a" 관계: 조합 사용
   - 단일 상속만 지원

3. **캡슐화**
   - private 필드(`_`)로 내부 구현 숨기기
   - Getter/Setter로 접근 제어
   - 공개 API만 노출

4. **Flutter에서의 활용**
   - 위젯은 클래스
   - StatefulWidget, StatelessWidget 상속
   - 생성자 패턴 자주 사용

