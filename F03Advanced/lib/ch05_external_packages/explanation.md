# -------------------------------------------
# 05단계: 외부 패키지 사용
# -------------------------------------------

## 학습 목표

이 단계에서는 Flutter의 외부 패키지 사용을 학습합니다:
- pub.dev 패키지 검색
- pubspec.yaml에 패키지 추가
- http 패키지: 네트워크 요청
- 패키지 버전 관리
- 패키지 사용법 이해

---

# -------------------------------------------
# 1. pub.dev 패키지 저장소
# -------------------------------------------

## 1.1 패키지 찾기

**웹사이트:** https://pub.dev

**검색 방법:**
- 키워드로 검색
- 카테고리별 탐색
- 인기 패키지 확인

## 1.2 패키지 정보 확인

- 버전 정보
- 사용 예제
- 문서
- 의존성
- 라이선스

---

# -------------------------------------------
# 2. 패키지 추가하기
# -------------------------------------------

## 2.1 pubspec.yaml에 추가

```yaml
dependencies:
  http: ^1.1.2
```

**버전 표기:**
- `^1.1.2`: 1.1.2 이상, 2.0.0 미만
- `1.1.2`: 정확한 버전
- `any`: 최신 버전

## 2.2 패키지 설치

```bash
flutter pub get
```

## 2.3 패키지 업데이트

```bash
flutter pub upgrade
```

---

# -------------------------------------------
# 3. http 패키지
# -------------------------------------------

## 3.1 패키지 추가

`pubspec.yaml`:
```yaml
dependencies:
  http: ^1.1.2
```

## 3.2 import

```dart
import 'package:http/http.dart' as http;
```

## 3.3 GET 요청

```dart
final response = await http.get(
  Uri.parse('https://api.example.com/data'),
);

if (response.statusCode == 200) {
  print(response.body);
}
```

## 3.4 POST 요청

```dart
final response = await http.post(
  Uri.parse('https://api.example.com/data'),
  headers: {'Content-Type': 'application/json'},
  body: json.encode({'key': 'value'}),
);
```

## 3.5 응답 처리

```dart
if (response.statusCode == 200) {
  final data = json.decode(response.body);
  // 데이터 사용
} else {
  // 에러 처리
}
```

---

# -------------------------------------------
# 4. JSON 처리
# -------------------------------------------

## 4.1 JSON 디코딩

```dart
import 'dart:convert';

final data = json.decode(response.body);
```

## 4.2 JSON 인코딩

```dart
final jsonString = json.encode({'key': 'value'});
```

## 4.3 타입 안전한 JSON

```dart
class User {
  final String name;
  final int age;
  
  User({required this.name, required this.age});
  
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      age: json['age'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }
}
```

---

# -------------------------------------------
# 5. 에러 처리
# -------------------------------------------

## 5.1 try-catch 사용

```dart
try {
  final response = await http.get(uri);
  // 처리
} catch (e) {
  // 에러 처리
  print('에러: $e');
}
```

## 5.2 상태 코드 확인

```dart
if (response.statusCode == 200) {
  // 성공
} else {
  // 실패
}
```

---

# -------------------------------------------
# 6. 실전 예제
# -------------------------------------------

## 예제 1: API 데이터 가져오기

```dart
Future<List<Item>> fetchItems() async {
  final response = await http.get(
    Uri.parse('https://api.example.com/items'),
  );
  
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => Item.fromJson(json)).toList();
  } else {
    throw Exception('데이터를 가져올 수 없습니다');
  }
}
```

## 예제 2: 데이터 전송

```dart
Future<void> createItem(Item item) async {
  final response = await http.post(
    Uri.parse('https://api.example.com/items'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(item.toJson()),
  );
  
  if (response.statusCode == 201) {
    // 성공
  } else {
    throw Exception('생성 실패');
  }
}
```

---

# -------------------------------------------
# 체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] pub.dev에서 패키지를 찾을 수 있습니다
- [ ] pubspec.yaml에 패키지를 추가할 수 있습니다
- [ ] flutter pub get을 실행할 수 있습니다
- [ ] http 패키지를 사용할 수 있습니다
- [ ] GET 요청을 보낼 수 있습니다
- [ ] POST 요청을 보낼 수 있습니다
- [ ] JSON을 처리할 수 있습니다
- [ ] 에러를 처리할 수 있습니다

---

# -------------------------------------------
# 실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [run.md](run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F03Advanced
flutter pub get
flutter run lib/ch05_external_packages/main.dart
```

---

# -------------------------------------------
# 커리큘럼 완료
# -------------------------------------------

축하합니다! 모든 단계를 완료했습니다!

## 전체 커리큘럼

1. 완료 **01단계: 상태 관리** - Provider
2. 완료 **02단계: 비동기 처리** - FutureBuilder, StreamBuilder
3. 완료 **03단계: 로컬 저장소** - SharedPreferences, File I/O
4. 완료 **04단계: 이미지 & 미디어** - image_picker
5. 완료 **05단계: 외부 패키지 사용** - http 등 (현재 단계)

---

# -------------------------------------------
# 팁
# -------------------------------------------

1. **패키지 선택 가이드**
   - 공식 패키지 우선
   - 활발히 유지보수되는 패키지
   - 문서가 잘 되어 있는 패키지
   - 사용자 수가 많은 패키지

2. **버전 관리**
   - ^ 표기로 자동 업데이트
   - 정확한 버전 필요 시 버전 고정
   - pub outdated로 확인

3. **실전 활용**
   - API 호출: http
   - 상태 관리: provider
   - 로컬 저장: shared_preferences
   - 이미지: image_picker

4. **주의사항**
   - 패키지 보안 확인
   - 라이선스 확인
   - 의존성 충돌 주의

