# ch01-03: Provider.of - 코드 설명

##  학습 목표
- Provider.of 사용법
- listen: false 이해
- Builder 위젯 사용

---

##  중요 코드 설명

### Provider.of 사용

```dart
// 상태 읽기 (listen: true - 기본값)
Provider.of<CounterProvider>(context).count

// 상태 변경만 (listen: false - UI 업데이트 없음)
Provider.of<CounterProvider>(context, listen: false).increment()
```

**핵심 포인트:**
- `listen: true`: 상태 변경 시 rebuild
- `listen: false`: 상태 변경만, rebuild 없음

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] Provider.of를 사용할 수 있습니다
- [ ] listen: false를 이해했습니다

---

##  실행 방법

```bash
cd F03Advanced
flutter run lib/ch01_state_management/ch01-03_provider_of.dart
```

