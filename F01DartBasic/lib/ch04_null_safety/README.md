# -------------------------------------------
# 04단계: Null Safety
# -------------------------------------------

##  학습 목표

이 단계에서는 Dart의 Null Safety를 학습합니다:
- Nullable vs Non-nullable 타입
- Null 체크 방법
- Null 안전 연산자 (?., ??, !)
- 실전 활용 패턴

---

# -------------------------------------------
# 1. Nullable vs Non-nullable
# -------------------------------------------

## 1.1 Non-nullable 타입

```dart
String name = 'Flutter';
int age = 25;

// name = null;  // 에러! null 할당 불가
```

- 기본적으로 모든 타입은 null을 허용하지 않음
- 더 안전한 코드 작성 가능
- null 관련 런타임 에러 방지

## 1.2 Nullable 타입

```dart
String? nullableName;  // null 가능
nullableName = 'Dart';
nullableName = null;   // 가능
```

- 타입 뒤에 `?`를 붙이면 nullable
- null 값을 가질 수 있음
- 명시적으로 null 가능성을 표현

**타입 비교:**
- `String`: null 불가능
- `String?`: null 가능

---

# -------------------------------------------
# 2. Null 체크
# -------------------------------------------

## 2.1 if 문으로 null 체크

```dart
String? text = 'Hello';

if (text != null) {
  print(text.length);  // 안전하게 사용 가능
} else {
  print('텍스트가 null입니다');
}
```

- null 체크 후에는 해당 블록에서 non-null로 취급
- Dart의 Flow Analysis 기능

## 2.2 null 체크 패턴

```dart
String? value;

// 패턴 1: if 체크
if (value != null) {
  // value는 이 블록에서 non-null
  print(value.length);
}

// 패턴 2: early return
if (value == null) return;
// 이후 value는 non-null
print(value.length);
```

---

# -------------------------------------------
# 3. Null 안전 연산자 (?.)
# -------------------------------------------

## 3.1 기본 사용법

```dart
String? message;

int? length = message?.length;  // null이면 null 반환
```

**동작:**
- 왼쪽이 null이면 → null 반환
- 왼쪽이 null이 아니면 → 오른쪽 실행

## 3.2 체이닝

```dart
String? userName;

int? nameLength = userName?.toUpperCase().length;
```

- 여러 메서드를 체이닝해도 안전
- 중간에 null이면 전체가 null 반환

## 3.3 사용 예시

```dart
String? text = 'Hello';
print(text?.length);  // 5

text = null;
print(text?.length);  // null
```

---

# -------------------------------------------
# 4. Null 병합 연산자 (??)
# -------------------------------------------

## 4.1 기본 사용법

```dart
String? nullableValue;

String result = nullableValue ?? '기본값';
```

**동작:**
- 왼쪽이 null이면 → 오른쪽 값 사용
- 왼쪽이 null이 아니면 → 왼쪽 값 사용

## 4.2 사용 예시

```dart
int? count;
int total = count ?? 0;  // count가 null이면 0

String? name;
String displayName = name ?? 'Guest';  // name이 null이면 'Guest'
```

## 4.3 ?. 와 ?? 조합

```dart
String? text;
int length = text?.length ?? 0;  // null이면 0
```

- `?.`로 안전하게 접근
- `??`로 기본값 제공

---

# -------------------------------------------
# 5. Null 단언 연산자 (!)
# -------------------------------------------

## 5.1 기본 사용법

```dart
String? maybeNull = 'Hello';

String definitelyNotNull = maybeNull!;  // null이 아님을 보장
```

**주의사항:**
- null이 아님을 프로그래머가 보장
- null이면 런타임 에러 발생
- 가능한 한 사용 지양

## 5.2 사용 시나리오

```dart
String? value = getValue();

// 이미 null 체크를 했다면
if (value != null) {
  String safe = value!;  // 불필요하지만 가능
  // 또는 그냥 value 사용 (Flow Analysis)
}
```

**권장:**
- `!` 연산자보다는 null 체크나 `?.`, `??` 사용
- 정말 확실할 때만 사용

---

# -------------------------------------------
# 6. Null 체크 패턴
# -------------------------------------------

## 6.1 패턴 1: if-else

```dart
String? value = 'test';

if (value != null) {
  print(value.length);  // 안전
} else {
  print('값이 없습니다');
}
```

## 6.2 패턴 2: ?. 와 ?? 조합

```dart
String? value;
String safeValue = value?.toUpperCase() ?? 'DEFAULT';
```

## 6.3 패턴 3: 함수에서 처리

```dart
void printLength(String? text) {
  if (text != null) {
    print(text.length);
  } else {
    print('텍스트가 null입니다');
  }
  
  // 또는
  print(text?.length ?? 0);
}
```

---

# -------------------------------------------
# 7. List와 Map에서의 Null Safety
# -------------------------------------------

## 7.1 List의 nullable 요소

```dart
List<String?> nullableList = ['apple', null, 'banana'];

for (String? item in nullableList) {
  if (item != null) {
    print(item);
  }
}
```

## 7.2 Map의 nullable 값

```dart
Map<String, int?> nullableMap = {
  'Alice': 95,
  'Bob': null,
};

nullableMap.forEach((name, score) {
  String scoreText = score != null ? '$score점' : '점수 없음';
  print('$name: $scoreText');
});
```

## 7.3 안전한 접근

```dart
Map<String, String?> userInfo = {
  'name': 'Alice',
  'email': null,
};

String name = userInfo['name'] ?? '없음';
String email = userInfo['email'] ?? '없음';
```

---

# -------------------------------------------
# 8. 함수에서 Null Safety
# -------------------------------------------

## 8.1 Nullable 매개변수

```dart
void greetUser(String? name) {
  String greeting = 'Hello, ${name ?? 'Guest'}!';
  print(greeting);
}

greetUser('Alice');  // 'Hello, Alice!'
greetUser(null);     // 'Hello, Guest!'
```

## 8.2 Nullable 반환값

```dart
String? findName(List<String> names, String target) {
  for (String name in names) {
    if (name == target) {
      return name;
    }
  }
  return null;  // 찾지 못하면 null
}

String? found = findName(['Alice', 'Bob'], 'Bob');
print(found ?? '없음');
```

## 8.3 기본값 매개변수

```dart
void showInfo({String? name, int age = 0}) {
  print('Name: ${name ?? 'Unknown'}, Age: $age');
}
```

---

# -------------------------------------------
#  실전 예제
# -------------------------------------------

## 예제 1: 사용자 정보 처리

```dart
Map<String, String?> userInfo = {
  'name': 'Alice',
  'email': 'alice@example.com',
  'phone': null,
};

print('이름: ${userInfo['name'] ?? '없음'}');
print('이메일: ${userInfo['email'] ?? '없음'}');
print('전화번호: ${userInfo['phone'] ?? '없음'}');
```

## 예제 2: 안전한 계산

```dart
int? a = 10;
int? b = null;
int? c = 20;

int sum = (a ?? 0) + (b ?? 0) + (c ?? 0);
print('합계: $sum');  // 30
```

## 예제 3: 리스트에서 null 필터링

```dart
List<int?> numbers = [1, null, 3, null, 5];
List<int> nonNullNumbers = [];

for (int? num in numbers) {
  if (num != null) {
    nonNullNumbers.add(num);
  }
}
```

---

# -------------------------------------------
#  체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] Nullable과 Non-nullable 타입의 차이를 이해했습니다
- [ ] `?`를 사용해 nullable 타입을 선언할 수 있습니다
- [ ] if 문으로 null을 체크할 수 있습니다
- [ ] `?.` 연산자를 사용할 수 있습니다
- [ ] `??` 연산자를 사용할 수 있습니다
- [ ] `!` 연산자의 위험성을 이해했습니다
- [ ] List와 Map에서 null을 안전하게 처리할 수 있습니다
- [ ] 함수에서 nullable 매개변수와 반환값을 사용할 수 있습니다

---

# -------------------------------------------
#  실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [Run.md](Run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F01DartBasic
dart run lib/ch04_null_safety/main.dart
```

---

# -------------------------------------------
#  다음 단계
# -------------------------------------------

04단계를 완료했다면 다음 단계로 진행하세요:
- **05단계: 클래스와 객체** - 클래스, 생성자, 상속

##  전체 커리큘럼

1.  **01단계: 기본 문법** - 변수, 타입, 함수
2.  **02단계: 제어문** - if/else, switch, for/while
3.  **03단계: 컬렉션** - List, Map, Set
4.  **04단계: Null Safety** - null 안전 처리 (현재 단계)
5. ⏭ **05단계: 클래스와 객체** - 클래스, 생성자, 상속
6. ⏭ **06단계: 제네릭** - 타입 파라미터
7. ⏭ **07단계: 비동기 프로그래밍** - Future, async/await
8. ⏭ **08단계: 함수형 프로그래밍** - 람다, 고차 함수

---

# -------------------------------------------
#  팁
# -------------------------------------------

1. **Null Safety 원칙**
   - 기본적으로 non-nullable 사용
   - 정말 필요할 때만 nullable 사용
   - null 가능성을 명시적으로 표현

2. **연산자 선택 가이드**
   - 안전한 접근: `?.` 사용
   - 기본값 제공: `??` 사용
   - null 보장: `!` 사용 (최소화)

3. **실전 활용**
   - API 응답: nullable로 처리
   - 사용자 입력: nullable로 처리
   - 계산 결과: 기본값 제공 (`??`)

4. **주의사항**
   - `!` 연산자는 런타임 에러 위험
   - 가능한 한 null 체크나 `?.`, `??` 사용
   - Flow Analysis를 활용해 불필요한 `!` 제거

