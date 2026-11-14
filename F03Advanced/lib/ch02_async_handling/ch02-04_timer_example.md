# ch02-04: 타이머 예제 - 코드 설명

##  학습 목표
- StreamController 사용
- Timer.periodic 사용
- 실시간 타이머 구현

---

##  중요 코드 설명

### StreamController 사용

```dart
StreamController<int> _controller = StreamController<int>();
Stream<int> _stream = _controller.stream;

// 값 전달
_controller.add(value);

// 정리
_controller.close();
```

**핵심 포인트:**
- `StreamController`: 스트림 제어
- `add()`: 값 전달
- `close()`: 정리 필수

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] StreamController를 사용할 수 있습니다
- [ ] Timer.periodic을 사용할 수 있습니다

---

##  실행 방법

```bash
cd F03Advanced
flutter run lib/ch02_async_handling/ch02-04_timer_example.dart
```

