# ch02-03: StreamBuilder 기본 - 코드 설명

##  학습 목표
- StreamBuilder 기본 사용법
- Stream 이해
- 실시간 데이터 처리

---

##  중요 코드 설명

### Stream 생성

```dart
Stream<int> _numberStream() async* {
  for (int i = 1; i <= 10; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    yield i;
  }
}
```

**핵심 포인트:**
- `async*`: 비동기 제너레이터
- `yield`: 스트림에 값 전달

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] StreamBuilder를 사용할 수 있습니다
- [ ] Stream을 생성할 수 있습니다

---

##  실행 방법

```bash
cd F03Advanced
flutter run lib/ch02_async_handling/ch02-03_streambuilder_basic.dart
```

