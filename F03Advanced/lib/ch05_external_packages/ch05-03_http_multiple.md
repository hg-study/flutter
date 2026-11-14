# ch05-03: 여러 데이터 가져오기 - 코드 설명

##  학습 목표
- 리스트 데이터 가져오기
- JSON 배열 파싱
- URL 쿼리 파라미터

---

##  중요 코드 설명

### JSON 배열 파싱

```dart
final List<dynamic> data = json.decode(response.body);
for (var item in data) {
  print(item['title']);
}
```

**핵심 포인트:**
- `json.decode()`: JSON 파싱
- 리스트로 반환
- 각 항목 접근

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] 리스트 데이터를 가져올 수 있습니다
- [ ] JSON 배열을 파싱할 수 있습니다

---

##  실행 방법

```bash
cd F03Advanced
flutter run lib/ch05_external_packages/ch05-03_http_multiple.dart
```

