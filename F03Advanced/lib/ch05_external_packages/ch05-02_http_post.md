# ch05-02: HTTP POST 요청 - 코드 설명

##  학습 목표
- POST 요청 보내기
- JSON 데이터 전송
- 헤더 설정

---

##  중요 코드 설명

### POST 요청

```dart
final response = await http.post(
  Uri.parse('https://api.example.com/data'),
  headers: {'Content-Type': 'application/json'},
  body: json.encode({
    'title': '제목',
    'body': '내용',
  }),
);
```

**핵심 포인트:**
- `http.post()`: POST 요청
- `headers`: 요청 헤더
- `body`: 요청 본문

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] POST 요청을 보낼 수 있습니다
- [ ] JSON 데이터를 전송할 수 있습니다

---

##  실행 방법

```bash
cd F03Advanced
flutter run lib/ch05_external_packages/ch05-02_http_post.dart
```

