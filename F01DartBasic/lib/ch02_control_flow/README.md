# -------------------------------------------
# 02단계: 제어문
# -------------------------------------------

##  학습 목표

이 단계에서는 Dart의 제어문을 학습합니다:
- 조건문 (if/else, switch-case)
- 반복문 (for, while, do-while)
- 제어 흐름 (break, continue)
- 중첩 루프와 실전 예제

---

# -------------------------------------------
# 1. 조건문 (if-else)
# -------------------------------------------

## 1.1 기본 if-else

```dart
int score = 85;

if (score >= 90) {
  print('A');
} else if (score >= 80) {
  print('B');
} else {
  print('C');
}
```

- `if`: 조건이 참일 때 실행
- `else if`: 추가 조건 검사
- `else`: 모든 조건이 거짓일 때 실행
- 중괄호 `{}`로 코드 블록 정의

## 1.2 여러 조건 예제

```dart
int age = 20;

if (age < 13) {
  print('어린이');
} else if (age < 20) {
  print('청소년');
} else if (age < 65) {
  print('성인');
} else {
  print('노인');
}
```

**주의사항:**
- 조건은 위에서 아래로 순서대로 검사됩니다
- 먼저 만족하는 조건의 코드만 실행됩니다

---

# -------------------------------------------
# 2. 삼항 연산자
# -------------------------------------------

## 2.1 기본 삼항 연산자

```dart
int score = 75;
String grade = score >= 60 ? '합격' : '불합격';
```

**구조:**
```
조건 ? 참일_때_값 : 거짓일_때_값
```

- 간단한 조건문을 한 줄로 작성
- 변수에 값을 할당할 때 유용

## 2.2 중첩 삼항 연산자

```dart
int temperature = 25;
String weather = temperature > 30 
    ? '더움' 
    : temperature > 20 
        ? '따뜻함' 
        : '시원함';
```

**주의사항:**
- 너무 복잡한 중첩은 가독성을 해칩니다
- 2단계 이상 중첩은 if-else 사용 권장

---

# -------------------------------------------
# 3. switch-case
# -------------------------------------------

## 3.1 기본 switch-case

```dart
String day = 'Monday';

switch (day) {
  case 'Monday':
    print('한 주의 시작!');
    break;
  case 'Friday':
    print('주말이 다가옵니다!');
    break;
  default:
    print('다른 날');
}
```

**구조:**
- `switch (변수)`: 비교할 변수
- `case '값':`: 특정 값과 비교
- `break;`: case 블록 종료 (필수!)
- `default:`: 모든 case와 일치하지 않을 때

## 3.2 여러 case 묶기

```dart
int month = 3;

switch (month) {
  case 12:
  case 1:
  case 2:
    print('겨울');
    break;
  case 3:
  case 4:
  case 5:
    print('봄');
    break;
  // ...
}
```

- 여러 case를 연속으로 작성하면 같은 코드 실행
- `break` 없으면 다음 case로 계속 진행 (fall-through)

**if-else vs switch-case:**
- 범위 비교: `if-else` 사용
- 특정 값 비교: `switch-case` 사용

---

# -------------------------------------------
# 4. for 루프
# -------------------------------------------

## 4.1 기본 for 루프

```dart
for (int i = 0; i < 5; i++) {
  print(i);
}
```

**구조:**
```
for (초기화; 조건; 증감) {
  // 반복할 코드
}
```

- **초기화**: 루프 시작 시 한 번 실행
- **조건**: 각 반복마다 검사 (true면 계속)
- **증감**: 각 반복 후 실행

## 4.2 다양한 for 루프 패턴

```dart
// 역순
for (int i = 5; i > 0; i--) {
  print(i);
}

// 2씩 증가
for (int i = 0; i < 10; i += 2) {
  print(i);
}

// 감소
for (int i = 10; i >= 0; i--) {
  print(i);
}
```

---

# -------------------------------------------
# 5. for-in 루프
# -------------------------------------------

## 5.1 리스트 순회

```dart
List<String> fruits = ['apple', 'banana', 'orange'];

for (String fruit in fruits) {
  print(fruit);
}
```

- 컬렉션의 각 요소를 순회
- 인덱스 없이 값만 접근
- 간결하고 읽기 쉬움

## 5.2 숫자 리스트 순회

```dart
List<int> numbers = [10, 20, 30];
int sum = 0;

for (int number in numbers) {
  sum += number;
}
print('합계: $sum');
```

**for vs for-in:**
- `for`: 인덱스가 필요할 때
- `for-in`: 값만 필요할 때

---

# -------------------------------------------
# 6. while 루프
# -------------------------------------------

## 6.1 기본 while 루프

```dart
int count = 0;

while (count < 5) {
  print(count);
  count++;
}
```

**구조:**
```
while (조건) {
  // 조건이 true인 동안 반복
}
```

- 조건을 먼저 검사
- 조건이 false가 되면 종료
- 무한 루프 주의!

## 6.2 무한 루프 방지

```dart
int number = 10;

while (number > 1) {
  print(number);
  number ~/= 2; // 조건이 false가 되도록 보장
}
```

**주의:**
- 조건이 항상 true가 되면 무한 루프
- 반드시 조건을 false로 만드는 코드 필요

---

# -------------------------------------------
# 7. do-while 루프
# -------------------------------------------

## 7.1 기본 do-while

```dart
int num = 0;

do {
  print(num);
  num++;
} while (num < 5);
```

**구조:**
```
do {
  // 코드 실행
} while (조건);
```

- **차이점**: 조건을 나중에 검사
- 최소 한 번은 실행됨
- 사용자 입력 검증에 유용

## 7.2 while vs do-while

```dart
// while: 조건이 false면 실행 안 됨
int value = 10;
while (value < 5) {
  print(value); // 실행 안 됨
}

// do-while: 최소 한 번은 실행
int value2 = 10;
do {
  print(value2); // 한 번 실행됨
} while (value2 < 5);
```

---

# -------------------------------------------
# 8. break와 continue
# -------------------------------------------

## 8.1 break - 루프 종료

```dart
for (int i = 0; i < 10; i++) {
  if (i == 5) {
    break; // 루프 즉시 종료
  }
  print(i);
}
```

- 루프를 완전히 종료
- 중첩 루프에서는 가장 가까운 루프만 종료

## 8.2 continue - 다음 반복으로

```dart
for (int i = 0; i < 10; i++) {
  if (i % 2 != 0) {
    continue; // 홀수는 건너뛰기
  }
  print('짝수: $i');
}
```

- 현재 반복만 건너뛰고 다음 반복 계속
- 루프를 종료하지 않음

**사용 예시:**
- `break`: 조건 만족 시 루프 종료
- `continue`: 특정 조건의 반복 건너뛰기

---

# -------------------------------------------
# 9. 중첩 루프
# -------------------------------------------

## 9.1 구구단 예제

```dart
for (int i = 2; i <= 9; i++) {
  print('$i단:');
  for (int j = 1; j <= 9; j++) {
    print('  $i x $j = ${i * j}');
  }
}
```

- 루프 안에 루프
- 외부 루프 1번 → 내부 루프 전체 실행

## 9.2 별 찍기 예제

```dart
for (int i = 1; i <= 5; i++) {
  String stars = '';
  for (int j = 0; j < i; j++) {
    stars += '*';
  }
  print(stars);
}
```

**출력:**
```
*
**
***
****
*****
```

---

# -------------------------------------------
#  실습 예제
# -------------------------------------------

## 예제 1: 점수 등급 계산

```dart
void printGrade(int score) {
  String grade;
  if (score >= 90) {
    grade = 'A';
  } else if (score >= 80) {
    grade = 'B';
  } else if (score >= 70) {
    grade = 'C';
  } else if (score >= 60) {
    grade = 'D';
  } else {
    grade = 'F';
  }
  print('점수: $score → 등급: $grade');
}
```

## 예제 2: 숫자 찾기

```dart
void findNumber(List<int> numbers, int target) {
  bool found = false;
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] == target) {
      print('찾았습니다! 인덱스: $i');
      found = true;
      break;
    }
  }
  if (!found) {
    print('찾을 수 없습니다.');
  }
}
```

## 예제 3: 팩토리얼 계산

```dart
int calculateFactorial(int n) {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}
```

---

# -------------------------------------------
#  체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] if-else 문을 사용할 수 있습니다
- [ ] 삼항 연산자를 사용할 수 있습니다
- [ ] switch-case 문을 사용할 수 있습니다
- [ ] for 루프를 사용할 수 있습니다
- [ ] for-in 루프를 사용할 수 있습니다
- [ ] while 루프를 사용할 수 있습니다
- [ ] do-while 루프를 사용할 수 있습니다
- [ ] break와 continue의 차이를 이해했습니다
- [ ] 중첩 루프를 사용할 수 있습니다

---

# -------------------------------------------
#  실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [Run.md](Run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F01DartBasic
dart run lib/ch02_control_flow/main.dart
```

---

# -------------------------------------------
#  다음 단계
# -------------------------------------------

02단계를 완료했다면 다음 단계로 진행하세요:
- **03단계: 컬렉션** - List, Map, Set 사용법

##  전체 커리큘럼

1.  **01단계: 기본 문법** - 변수, 타입, 함수
2.  **02단계: 제어문** - if/else, switch, for/while (현재 단계)
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

1. **조건문 선택**
   - 범위 비교: `if-else` 사용
   - 특정 값 비교: `switch-case` 사용
   - 간단한 조건: 삼항 연산자 사용

2. **반복문 선택**
   - 횟수를 알 때: `for` 루프
   - 컬렉션 순회: `for-in` 루프
   - 조건에 따라 반복: `while` 루프
   - 최소 한 번 실행: `do-while` 루프

3. **성능 고려**
   - 불필요한 중첩 루프 피하기
   - `break`와 `continue`로 불필요한 반복 줄이기
   - 조건을 먼저 만족하는 것부터 검사

