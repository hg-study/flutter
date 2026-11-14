# -------------------------------------------
# 07단계: 비동기 프로그래밍
# -------------------------------------------

##  학습 목표

이 단계에서는 Dart의 비동기 프로그래밍을 학습합니다:
- Future 이해와 사용
- async/await 패턴
- 여러 Future 처리 (순차/병렬)
- 에러 처리
- 실전 활용 예제

---

# -------------------------------------------
# 1. Future란?
# -------------------------------------------

## 1.1 동기 vs 비동기

**동기 (Synchronous):**
```dart
String data = fetchData();  // 완료될 때까지 대기
print(data);
```

- 코드가 순서대로 실행
- 한 작업이 끝나야 다음 작업 시작
- 블로킹 발생

**비동기 (Asynchronous):**
```dart
Future<String> data = fetchData();  // 즉시 반환
data.then((value) => print(value));  // 완료되면 실행
```

- 작업을 시작하고 즉시 반환
- 다른 작업을 계속 수행 가능
- 완료되면 콜백 실행

## 1.2 Future의 필요성

- 네트워크 요청 (API 호출)
- 파일 읽기/쓰기
- 데이터베이스 쿼리
- 타이머

이런 작업들은 시간이 걸리므로 비동기로 처리해야 합니다.

---

# -------------------------------------------
# 2. Future 기본
# -------------------------------------------

## 2.1 Future 생성

```dart
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 1));
  return '데이터 로드 완료';
}
```

- `Future<T>`: T 타입의 값을 반환하는 비동기 작업
- `async`: 비동기 함수 표시
- `await`: Future 완료 대기

## 2.2 Future 사용 - then

```dart
fetchData().then((data) {
  print('데이터: $data');
}).catchError((error) {
  print('에러: $error');
});
```

- `then`: 성공 시 실행
- `catchError`: 에러 시 실행
- 체이닝 가능

---

# -------------------------------------------
# 3. async/await
# -------------------------------------------

## 3.1 기본 사용법

```dart
Future<void> loadData() async {
  String data = await fetchData();
  print('데이터: $data');
}
```

**장점:**
- 동기 코드처럼 읽기 쉬움
- 에러 처리 간단 (try-catch)
- 코드 흐름이 명확

## 3.2 async 함수

```dart
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 1));
  return '데이터';
}
```

- `async` 키워드로 비동기 함수 표시
- `Future<T>` 반환 타입
- `await` 사용 가능

## 3.3 await 사용

```dart
String data = await fetchData();
```

- Future가 완료될 때까지 대기
- 완료되면 결과 반환
- `async` 함수 내에서만 사용 가능

---

# -------------------------------------------
# 4. 여러 Future 처리
# -------------------------------------------

## 4.1 순차 실행

```dart
String data1 = await fetchData1();
String data2 = await fetchData2();
```

- 하나씩 순서대로 실행
- 첫 번째가 끝나야 두 번째 시작
- 총 시간 = 각각의 시간 합

## 4.2 병렬 실행

```dart
var results = await Future.wait([
  fetchData1(),
  fetchData2(),
  fetchData3(),
]);
```

- 동시에 여러 Future 실행
- 모든 Future가 완료될 때까지 대기
- 총 시간 = 가장 오래 걸리는 Future 시간

**언제 사용?**
- 순차: 두 번째가 첫 번째 결과에 의존할 때
- 병렬: 독립적인 작업들일 때

---

# -------------------------------------------
# 5. Future.delayed
# -------------------------------------------

## 5.1 기본 사용

```dart
await Future.delayed(Duration(seconds: 2));
print('2초 후 실행');
```

- 지정된 시간 후 완료되는 Future
- 타이머, 지연 실행에 사용

## 5.2 활용 예시

```dart
print('시작');
await Future.delayed(Duration(seconds: 1));
print('1초 후');
await Future.delayed(Duration(seconds: 1));
print('2초 후');
```

---

# -------------------------------------------
# 6. 에러 처리
# -------------------------------------------

## 6.1 try-catch 사용

```dart
try {
  String data = await fetchData();
  print('성공: $data');
} catch (e) {
  print('에러: $e');
}
```

- 동기 코드와 동일한 방식
- 간단하고 명확

## 6.2 catchError 사용

```dart
fetchData()
  .then((data) => print('성공: $data'))
  .catchError((error) => print('에러: $error'));
```

- then/catchError 패턴
- 체이닝 가능

## 6.3 에러 발생

```dart
Future<String> fetchData() async {
  throw Exception('에러 발생!');
}
```

- `throw`로 에러 발생
- Future는 자동으로 에러를 전파

---

# -------------------------------------------
# 7. Future.value와 Future.error
# -------------------------------------------

## 7.1 Future.value

```dart
Future<String> immediate = Future.value('즉시 값');
String value = await immediate;
```

- 이미 값을 가지고 있는 Future
- 즉시 완료됨
- 테스트나 기본값에 유용

## 7.2 Future.error

```dart
Future<String> error = Future.error('에러!');
try {
  await error;
} catch (e) {
  print(e);
}
```

- 에러를 가진 Future
- 즉시 에러 발생

---

# -------------------------------------------
# 8. Future.timeout
# -------------------------------------------

## 8.1 타임아웃 설정

```dart
String result = await fetchData().timeout(
  Duration(seconds: 2),
  onTimeout: () => '타임아웃!',
);
```

- 지정된 시간 내에 완료되지 않으면 타임아웃
- `onTimeout`: 타임아웃 시 실행할 함수

## 8.2 사용 예시

```dart
try {
  String data = await slowFetch().timeout(
    Duration(seconds: 5),
  );
} catch (e) {
  print('타임아웃 또는 에러: $e');
}
```

---

# -------------------------------------------
#  실전 예제
# -------------------------------------------

## 예제 1: 사용자 데이터 로드

```dart
Future<User> loadUserData(int userId) async {
  await Future.delayed(Duration(seconds: 1));
  
  // API 호출 시뮬레이션
  Map<String, dynamic> data = {
    'id': userId,
    'name': 'Alice',
    'email': 'alice@example.com',
  };
  
  return User.fromMap(data);
}
```

## 예제 2: 여러 API 호출

```dart
Future<void> loadMultipleData() async {
  var results = await Future.wait([
    fetchUserProfile(),
    fetchUserPosts(),
    fetchUserFriends(),
  ]);
  
  // 모든 데이터 로드 완료
}
```

## 예제 3: 에러 처리와 재시도

```dart
Future<String> fetchWithRetry(int retries) async {
  for (int i = 0; i < retries; i++) {
    try {
      return await fetchData();
    } catch (e) {
      if (i == retries - 1) rethrow;
      await Future.delayed(Duration(seconds: 1));
    }
  }
  throw Exception('모든 재시도 실패');
}
```

---

# -------------------------------------------
#  체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] Future의 개념을 이해했습니다
- [ ] async/await를 사용할 수 있습니다
- [ ] then/catchError를 사용할 수 있습니다
- [ ] 여러 Future를 순차/병렬로 처리할 수 있습니다
- [ ] 에러 처리를 할 수 있습니다
- [ ] Future.delayed를 사용할 수 있습니다
- [ ] Future.timeout을 사용할 수 있습니다
- [ ] 실전에서 비동기 코드를 작성할 수 있습니다

---

# -------------------------------------------
#  실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [Run.md](Run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F01DartBasic
dart run lib/ch07_async/main.dart
```

---

# -------------------------------------------
#  다음 단계
# -------------------------------------------

07단계를 완료했다면 다음 단계로 진행하세요:
- **08단계: 함수형 프로그래밍** - 람다, 고차 함수

##  전체 커리큘럼

1.  **01단계: 기본 문법** - 변수, 타입, 함수
2.  **02단계: 제어문** - if/else, switch, for/while
3.  **03단계: 컬렉션** - List, Map, Set
4.  **04단계: Null Safety** - null 안전 처리
5.  **05단계: 클래스와 객체** - 클래스, 생성자, 상속
6.  **06단계: 제네릭** - 타입 파라미터
7.  **07단계: 비동기 프로그래밍** - Future, async/await (현재 단계)
8. ⏭ **08단계: 함수형 프로그래밍** - 람다, 고차 함수

---

# -------------------------------------------
#  팁
# -------------------------------------------

1. **async/await vs then**
   - 간단한 코드: async/await 권장
   - 복잡한 체이닝: then도 유용
   - 대부분 async/await가 더 읽기 쉬움

2. **성능 최적화**
   - 독립적인 작업은 병렬 실행
   - Future.wait로 여러 작업 동시 처리
   - 불필요한 await 피하기

3. **에러 처리**
   - 항상 에러 처리 고려
   - try-catch가 더 명확
   - 타임아웃 설정 권장

4. **Flutter에서의 활용**
   - API 호출: async/await
   - 파일 I/O: Future 사용
   - 타이머: Future.delayed
   - 위젯 빌드: FutureBuilder 사용

