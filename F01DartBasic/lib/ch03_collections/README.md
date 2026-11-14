# -------------------------------------------
# 03단계: 컬렉션
# -------------------------------------------

##  학습 목표

이 단계에서는 Dart의 컬렉션을 학습합니다:
- List (리스트) - 순서가 있는 데이터 모음
- Map (맵) - 키-값 쌍의 데이터 모음
- Set (집합) - 중복 없는 데이터 모음
- 각 컬렉션의 조작, 검색, 순회 방법

---

# -------------------------------------------
# 1. List (리스트)
# -------------------------------------------

## 1.1 리스트 생성

```dart
// 타입 명시
List<String> fruits = ['apple', 'banana', 'orange'];

// 타입 추론
var numbers = [1, 2, 3, 4, 5];

// 빈 리스트
List<int> emptyList = [];
```

**특징:**
- 순서가 있는 데이터 구조
- 인덱스로 접근 (0부터 시작)
- 중복 허용
- 동적 크기 조절 가능

## 1.2 리스트 접근

```dart
List<String> fruits = ['apple', 'banana', 'orange'];

fruits[0];              // 'apple' (첫 번째)
fruits[1];              // 'banana'
fruits[fruits.length - 1];  // 'orange' (마지막)
fruits.length;          // 3 (길이)
```

**주의사항:**
- 인덱스는 0부터 시작
- 범위를 벗어나면 에러 발생
- `length - 1`이 마지막 인덱스

## 1.3 리스트 요소 추가

```dart
List<String> fruits = ['apple', 'banana'];

fruits.add('orange');           // 끝에 추가
fruits.addAll(['grape', 'mango']);  // 여러 개 추가
fruits.insert(1, 'kiwi');      // 특정 위치에 삽입
```

**메서드:**
- `add(요소)`: 끝에 하나 추가
- `addAll(리스트)`: 끝에 여러 개 추가
- `insert(인덱스, 요소)`: 특정 위치에 삽입

## 1.4 리스트 요소 제거

```dart
List<String> fruits = ['apple', 'banana', 'orange'];

fruits.remove('banana');    // 값으로 제거
fruits.removeAt(0);        // 인덱스로 제거
fruits.removeLast();        // 마지막 요소 제거
fruits.clear();             // 모든 요소 제거
```

## 1.5 리스트 검색 및 확인

```dart
List<int> numbers = [10, 20, 30];

numbers.contains(20);      // true (포함 여부)
numbers.indexOf(20);       // 1 (인덱스 찾기)
numbers.isEmpty;          // false (비어있는지)
numbers.isNotEmpty;        // true (비어있지 않은지)
```

## 1.6 리스트 순회

```dart
List<String> colors = ['red', 'green', 'blue'];

// for-in 루프
for (String color in colors) {
  print(color);
}

// forEach
colors.forEach((color) {
  print(color);
});

// 인덱스와 함께
for (int i = 0; i < colors.length; i++) {
  print('[$i] ${colors[i]}');
}
```

---

# -------------------------------------------
# 2. Map (맵)
# -------------------------------------------

## 2.1 Map 생성

```dart
// 타입 명시
Map<String, int> scores = {
  'Alice': 95,
  'Bob': 87,
  'Charlie': 92,
};

// 타입 추론
var ages = {
  'Alice': 25,
  'Bob': 30,
};

// 빈 맵
Map<String, int> emptyMap = {};
```

**특징:**
- 키-값 쌍의 데이터 구조
- 키는 유일해야 함
- 순서는 삽입 순서 유지
- 키로 빠른 검색 가능

## 2.2 Map 접근

```dart
Map<String, int> scores = {'Alice': 95, 'Bob': 87};

scores['Alice'];      // 95 (값 가져오기)
scores['Charlie'];    // null (없는 키)
scores.length;        // 2 (크기)
```

**주의사항:**
- 없는 키 접근 시 `null` 반환
- 키는 유일해야 함 (중복 시 마지막 값으로 덮어씀)

## 2.3 Map 요소 추가/수정

```dart
Map<String, String> users = {};

users['user1'] = 'Alice';        // 추가
users['user2'] = 'Bob';          // 추가
users['user1'] = 'Alice Updated'; // 수정
```

- 같은 키에 값을 할당하면 수정됨
- 새로운 키에 값을 할당하면 추가됨

## 2.4 Map 요소 제거

```dart
Map<String, int> scores = {'Alice': 95, 'Bob': 87};

scores.remove('Bob');  // 키로 제거
scores.clear();        // 모든 요소 제거
```

## 2.5 Map 검색 및 확인

```dart
Map<String, int> ages = {'Alice': 25, 'Bob': 30};

ages.containsKey('Alice');   // true (키 존재 여부)
ages.containsValue(30);      // true (값 존재 여부)
ages.isEmpty;               // false (비어있는지)
ages.keys;                  // (Alice, Bob) (모든 키)
ages.values;                // (25, 30) (모든 값)
```

## 2.6 Map 순회

```dart
Map<String, int> prices = {
  'apple': 1000,
  'banana': 2000,
};

// forEach
prices.forEach((item, price) {
  print('$item: \$$price');
});

// entries 순회
for (var entry in prices.entries) {
  print('${entry.key}: ${entry.value}');
}

// keys 순회
for (var key in prices.keys) {
  print('$key: ${prices[key]}');
}
```

---

# -------------------------------------------
# 3. Set (집합)
# -------------------------------------------

## 3.1 Set 생성

```dart
// 타입 명시
Set<String> uniqueNames = {'Alice', 'Bob', 'Charlie'};

// 타입 추론
var numbers = <int>{1, 2, 3, 4, 5};

// 빈 Set
Set<String> emptySet = {};
```

**특징:**
- 중복 없는 데이터 구조
- 순서는 삽입 순서 유지
- 빠른 포함 여부 검사
- 집합 연산 지원

## 3.2 Set 요소 추가/제거

```dart
Set<String> fruits = {'apple', 'banana'};

fruits.add('orange');              // 추가
fruits.addAll(['grape', 'mango']); // 여러 개 추가
fruits.add('apple');               // 중복 추가 (변화 없음)
fruits.remove('banana');           // 제거
```

**중요:**
- 같은 값을 추가해도 변화 없음
- 중복 자동 제거

## 3.3 Set 집합 연산

```dart
Set<int> set1 = {1, 2, 3, 4, 5};
Set<int> set2 = {4, 5, 6, 7, 8};

set1.intersection(set2);  // {4, 5} (교집합)
set1.union(set2);         // {1, 2, 3, 4, 5, 6, 7, 8} (합집합)
set1.difference(set2);     // {1, 2, 3} (차집합)
```

**집합 연산:**
- `intersection`: 두 집합의 공통 요소
- `union`: 두 집합의 모든 요소 (중복 제거)
- `difference`: 첫 번째 집합에만 있는 요소

## 3.4 Set 검색 및 확인

```dart
Set<String> colors = {'red', 'green', 'blue'};

colors.contains('red');    // true (포함 여부)
colors.isEmpty;            // false (비어있는지)
colors.length;             // 3 (크기)
```

---

# -------------------------------------------
#  실전 예제
# -------------------------------------------

## 예제 1: 학생 점수 관리

```dart
Map<String, List<int>> studentScores = {
  'Alice': [90, 85, 92],
  'Bob': [78, 82, 80],
  'Charlie': [95, 88, 90],
};

studentScores.forEach((name, scores) {
  double average = scores.reduce((a, b) => a + b) / scores.length;
  print('$name: 평균 ${average.toStringAsFixed(1)}점');
});
```

## 예제 2: 중복 제거

```dart
List<int> numbersWithDuplicates = [1, 2, 2, 3, 3, 3, 4, 5];
Set<int> uniqueNumbers = numbersWithDuplicates.toSet();
print(uniqueNumbers);  // {1, 2, 3, 4, 5}
```

## 예제 3: 리스트 필터링

```dart
List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
List<int> evenNumbers = [];

for (int num in numbers) {
  if (num % 2 == 0) {
    evenNumbers.add(num);
  }
}
```

## 예제 4: 맵에서 최대값 찾기

```dart
Map<String, int> sales = {
  'January': 100,
  'February': 150,
  'March': 120,
  'April': 200,
};

String maxMonth = '';
int maxValue = 0;

sales.forEach((month, value) {
  if (value > maxValue) {
    maxValue = value;
    maxMonth = month;
  }
});
```

---

# -------------------------------------------
#  체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] List를 생성하고 조작할 수 있습니다
- [ ] List의 요소를 추가/제거할 수 있습니다
- [ ] List를 순회할 수 있습니다
- [ ] Map을 생성하고 조작할 수 있습니다
- [ ] Map의 키-값 쌍을 추가/수정/제거할 수 있습니다
- [ ] Map을 순회할 수 있습니다
- [ ] Set을 생성하고 조작할 수 있습니다
- [ ] Set의 집합 연산을 이해했습니다
- [ ] 각 컬렉션의 차이점을 이해했습니다

---

# -------------------------------------------
#  실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [Run.md](Run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F01DartBasic
dart run lib/ch03_collections/main.dart
```

---

# -------------------------------------------
#  다음 단계
# -------------------------------------------

03단계를 완료했다면 다음 단계로 진행하세요:
- **04단계: Null Safety** - null 안전 처리

##  전체 커리큘럼

1.  **01단계: 기본 문법** - 변수, 타입, 함수
2.  **02단계: 제어문** - if/else, switch, for/while
3.  **03단계: 컬렉션** - List, Map, Set (현재 단계)
4. ⏭ **04단계: Null Safety** - null 안전 처리
5. ⏭ **05단계: 클래스와 객체** - 클래스, 생성자, 상속
6. ⏭ **06단계: 제네릭** - 타입 파라미터
7. ⏭ **07단계: 비동기 프로그래밍** - Future, async/await
8. ⏭ **08단계: 함수형 프로그래밍** - 람다, 고차 함수

---

# -------------------------------------------
#  팁
# -------------------------------------------

1. **컬렉션 선택 가이드**
   - 순서가 중요하고 중복 허용: `List`
   - 키-값 쌍이 필요: `Map`
   - 중복 제거가 필요: `Set`

2. **성능 고려사항**
   - List: 인덱스 접근은 빠름, 중간 삽입/삭제는 느림
   - Map: 키로 접근은 빠름, 순회는 List보다 느릴 수 있음
   - Set: 포함 여부 검사는 빠름

3. **실전 활용**
   - API 응답 데이터: `List` 또는 `Map`
   - 설정값: `Map`
   - 중복 제거: `Set`
   - 필터링/변환: 루프와 조건문 조합

