# Flutter Advanced

- [상태 관리 Provider](#상태-관리-provider)
- [비동기 UI](#비동기-ui)
- [로컬 저장소](#로컬-저장소)
- [이미지 선택](#이미지-선택)
- [HTTP 통신](#http-통신)

<br>

---

### 상태 관리 Provider

> 여러 화면이 같은 상태를 공유하면 `setState`만으로는 값을 전달하기 어렵다. Provider 패키지는 상태를 위젯 트리 위쪽에 두고 아래 어디서나 꺼내 쓰게 한다. 상태 클래스는 `ChangeNotifier`를 상속하고, 값을 바꾼 뒤 `notifyListeners()`를 호출하면 그 상태를 듣는 위젯이 다시 그려진다. 트리 위에서 `ChangeNotifierProvider`(여러 개면 `MultiProvider`)로 등록하고 아래에서는 `Consumer`, `context.watch`, `context.read`로 사용한다.

<br>

| 방법 | 의미 |
| --- | --- |
| `Consumer<T>` | 값이 바뀌면 이 부분만 다시 그림 |
| `context.watch<T>()` | 값을 읽고 변경을 구독 |
| `context.read<T>()` | 값을 읽기만 함(이벤트 처리 안에서) |
| `Provider.of<T>(context, listen: false)` | 구독 없이 읽기 |

<br>

- 예제 코드: [기본](../F03Advanced/lib/ch01_state_management/ch01-01_provider_basic.dart), [여러 Provider](../F03Advanced/lib/ch01_state_management/ch01-02_provider_multiple.dart), [할 일 예제](../F03Advanced/lib/ch01_state_management/ch01-04_todo_example.dart)

---

### 비동기 UI

> 비동기 결과를 화면에 그릴 때는 `FutureBuilder`가 `Future`의 진행, 성공, 오류 상태를 나눠 그리게 해 준다. `snapshot.connectionState`와 `hasData`, `hasError`로 로딩 표시, 데이터 표시, 오류 표시를 구분한다. 값이 계속 들어오는 `Stream`은 `StreamBuilder`가 같은 방식으로 그린다. `Timer`로 주기 작업을 만들 수 있고 화면이 사라질 때 `cancel()`로 멈춰야 한다.

<br>

- 예제 코드: [FutureBuilder](../F03Advanced/lib/ch02_async_handling/ch02-01_futurebuilder_basic.dart), [상태별 처리](../F03Advanced/lib/ch02_async_handling/ch02-02_futurebuilder_states.dart), [StreamBuilder](../F03Advanced/lib/ch02_async_handling/ch02-03_streambuilder_basic.dart), [Timer](../F03Advanced/lib/ch02_async_handling/ch02-04_timer_example.dart)

---

### 로컬 저장소

> 앱을 껐다 켜도 남겨야 하는 값은 기기에 저장한다. `shared_preferences`는 설정값처럼 작은 키와 값(문자열, 숫자, 불리언, 문자열 목록)을 저장한다. 파일이 필요하면 `path_provider`로 앱 전용 폴더 경로를 얻어 `dart:io`의 `File`로 읽고 쓴다. 저장과 읽기는 모두 비동기이다.

<br>

```dart
final prefs = await SharedPreferences.getInstance();
await prefs.setBool('dark', true);
final dark = prefs.getBool('dark') ?? false;
```

<br>

- 예제 코드: [shared_preferences](../F03Advanced/lib/ch03_local_storage/ch03-01_shared_preferences.dart), [파일 입출력](../F03Advanced/lib/ch03_local_storage/ch03-02_file_io.dart), [설정 예제](../F03Advanced/lib/ch03_local_storage/ch03-03_settings_example.dart)

---

### 이미지 선택

> `image_picker`는 갤러리에서 사진을 고르거나 카메라로 촬영한 파일을 가져온다. 선택 결과는 `XFile`로 오며 사용자가 취소하면 null이다. 안드로이드와 iOS는 카메라, 사진 접근 권한 설정을 플랫폼 설정 파일에 추가해야 한다.

<br>

- 예제 코드: [갤러리](../F03Advanced/lib/ch04_image_media/ch04-01_image_picker_gallery.dart), [카메라](../F03Advanced/lib/ch04_image_media/ch04-02_image_picker_camera.dart), [여러 장](../F03Advanced/lib/ch04_image_media/ch04-03_image_picker_multiple.dart)

---

### HTTP 통신

> `http` 패키지로 서버와 통신한다. 주소는 `Uri.parse`로 만들고 `http.get`, `http.post`를 `await`로 호출한다. 응답은 `statusCode`로 성공을 확인하고 `jsonDecode(response.body)`로 JSON을 Dart 객체로 바꾼다. 요청 본문은 `jsonEncode`로 만들고 `Content-Type: application/json` 헤더를 붙인다. 여러 요청을 동시에 보낼 때는 `Future.wait`를 쓴다.

<br>

- 예제 코드: [GET](../F03Advanced/lib/ch05_external_packages/ch05-01_http_get.dart), [POST](../F03Advanced/lib/ch05_external_packages/ch05-02_http_post.dart), [여러 요청](../F03Advanced/lib/ch05_external_packages/ch05-03_http_multiple.dart), [고급 커리큘럼](../F03Advanced/00_ADVANCED_CURRICULUM.md)
