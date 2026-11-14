# -------------------------------------------
# 02단계: 비동기 처리
# -------------------------------------------

## 학습 목표

이 단계에서는 Flutter의 비동기 처리 위젯을 학습합니다:
- async/await 심화
- FutureBuilder: Future 기반 비동기 UI
- StreamBuilder: Stream 기반 비동기 UI
- 로딩 상태 처리
- 에러 처리

---

# -------------------------------------------
# 1. FutureBuilder
# -------------------------------------------

## 1.1 기본 사용법

```dart
FutureBuilder<String>(
  future: fetchData(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }
    
    if (snapshot.hasError) {
      return Text('에러: ${snapshot.error}');
    }
    
    if (snapshot.hasData) {
      return Text('${snapshot.data}');
    }
    
    return Text('데이터 없음');
  },
)
```

**특징:**
- Future 완료를 기다림
- 자동으로 UI 업데이트
- 로딩, 에러, 성공 상태 처리

## 1.2 ConnectionState

```dart
snapshot.connectionState == ConnectionState.waiting  // 대기 중
snapshot.connectionState == ConnectionState.done     // 완료
```

**상태 종류:**
- `none`: 아직 시작 안 함
- `waiting`: 대기 중
- `active`: 활성 (Stream만)
- `done`: 완료

## 1.3 snapshot 속성

```dart
snapshot.hasData      // 데이터 있음
snapshot.hasError    // 에러 있음
snapshot.data        // 데이터
snapshot.error       // 에러
```

---

# -------------------------------------------
# 2. StreamBuilder
# -------------------------------------------

## 2.1 기본 사용법

```dart
StreamBuilder<int>(
  stream: numberStream(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text('${snapshot.data}');
    }
    return Text('대기 중...');
  },
)
```

**특징:**
- Stream의 데이터를 실시간으로 받음
- 여러 번 업데이트 가능
- 실시간 데이터 표시에 적합

## 2.2 Stream 생성

```dart
Stream<int> numberStream() async* {
  for (int i = 1; i <= 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
```

**async*와 yield:**
- `async*`: Stream을 반환하는 함수
- `yield`: Stream에 값 추가

---

# -------------------------------------------
# 3. 로딩 상태 처리
# -------------------------------------------

## 3.1 CircularProgressIndicator

```dart
if (snapshot.connectionState == ConnectionState.waiting) {
  return CircularProgressIndicator();
}
```

## 3.2 LinearProgressIndicator

```dart
LinearProgressIndicator()
```

## 3.3 커스텀 로딩

```dart
Center(
  child: Column(
    children: [
      CircularProgressIndicator(),
      SizedBox(height: 16),
      Text('로딩 중...'),
    ],
  ),
)
```

---

# -------------------------------------------
# 4. 에러 처리
# -------------------------------------------

## 4.1 기본 에러 처리

```dart
if (snapshot.hasError) {
  return Column(
    children: [
      Icon(Icons.error, color: Colors.red),
      Text('에러: ${snapshot.error}'),
    ],
  );
}
```

## 4.2 에러 재시도

```dart
ElevatedButton(
  onPressed: () {
    setState(() {
      _future = fetchData(); // 재시도
    });
  },
  child: Text('재시도'),
)
```

---

# -------------------------------------------
# 5. 실전 예제
# -------------------------------------------

## 예제 1: API 데이터 로딩

```dart
FutureBuilder<List<Item>>(
  future: fetchItems(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }
    
    if (snapshot.hasError) {
      return ErrorWidget(snapshot.error);
    }
    
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(snapshot.data![index].name));
      },
    );
  },
)
```

## 예제 2: 실시간 타이머

```dart
StreamBuilder<int>(
  stream: timerStream(),
  builder: (context, snapshot) {
    return Text('${snapshot.data ?? 0}');
  },
)
```

---

# -------------------------------------------
# 체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] FutureBuilder를 사용할 수 있습니다
- [ ] StreamBuilder를 사용할 수 있습니다
- [ ] ConnectionState를 이해했습니다
- [ ] 로딩 상태를 표시할 수 있습니다
- [ ] 에러를 처리할 수 있습니다
- [ ] Stream을 생성할 수 있습니다
- [ ] 실전 예제를 만들 수 있습니다

---

# -------------------------------------------
# 실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [run.md](run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F03Advanced
flutter run lib/ch02_async_handling/main.dart
```

---

# -------------------------------------------
# 다음 단계
# -------------------------------------------

02단계를 완료했다면 다음 단계로 진행하세요:
- **03단계: 로컬 저장소** - SharedPreferences, File I/O

## 전체 커리큘럼

1. 완료 **01단계: 상태 관리** - Provider
2. 완료 **02단계: 비동기 처리** - FutureBuilder, StreamBuilder (현재 단계)
3. 다음 **03단계: 로컬 저장소** - SharedPreferences, File I/O
4. 다음 **04단계: 이미지 & 미디어** - image_picker
5. 다음 **05단계: 외부 패키지 사용** - http 등

---

# -------------------------------------------
# 팁
# -------------------------------------------

1. **FutureBuilder vs StreamBuilder**
   - FutureBuilder: 한 번의 데이터
   - StreamBuilder: 실시간 데이터
   - 상황에 맞게 선택

2. **성능 최적화**
   - 불필요한 rebuild 방지
   - 적절한 로딩 인디케이터
   - 에러 처리 필수

3. **실전 활용**
   - API 호출: FutureBuilder
   - 실시간 채팅: StreamBuilder
   - 타이머: StreamBuilder
   - 파일 로딩: FutureBuilder

4. **주의사항**
   - 항상 에러 처리
   - 로딩 상태 표시
   - null 체크

