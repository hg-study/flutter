# ch05-03: 데이터 전달 - 코드 설명

##  학습 목표
- 페이지 간 데이터 전달
- 생성자로 데이터 전달
- 여러 데이터 전달

---

##  중요 코드 설명

### 1. 데이터 전달

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailPage(data: '전달된 데이터'),
  ),
);
```

**핵심 포인트:**
- 생성자 매개변수로 데이터 전달
- 여러 데이터도 전달 가능

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] 페이지 간 데이터를 전달할 수 있습니다
- [ ] 생성자로 데이터를 받을 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch05_navigation/ch05-03_data_passing.dart
```

