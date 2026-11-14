# ch05-04: 결과 반환 - 코드 설명

##  학습 목표
- 페이지에서 결과 반환
- await와 async 사용
- Navigator.pop으로 결과 전달

---

##  중요 코드 설명

### 1. 결과 받기

```dart
final result = await Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ResultPage(),
  ),
);
```

**핵심 포인트:**
- `await`: 결과를 기다림
- `async`: 비동기 함수 필요

### 2. 결과 반환

```dart
Navigator.pop(context, '성공');
```

**핵심 포인트:**
- 두 번째 매개변수로 결과 전달
- 이전 페이지에서 받을 수 있음

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] 페이지에서 결과를 반환할 수 있습니다
- [ ] await와 async를 사용할 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch05_navigation/ch05-04_result_returning.dart
```

