# Flutter Auth App

- [전체 구조](#전체-구조)
- [서버 주소](#서버-주소)
- [API 서비스](#api-서비스)
- [인증 서비스](#인증-서비스)
- [화면과 라우팅](#화면과-라우팅)
- [실기기 연결](#실기기-연결)

<br>

---

### 전체 구조

> Spring Boot 인증 서버(JWT와 쿠키)에 Flutter 앱으로 회원가입, 로그인, 로그아웃을 붙이는 실습이다. 같은 서버를 웹(React)과 모바일(Flutter)이 함께 쓴다는 점이 핵심이다. 서버는 로그인 성공 시 토큰을 쿠키로 내려 주고, 앱은 그 쿠키를 저장했다가 이후 요청에 자동으로 실어 보낸다.

<br>

| 프로젝트 | 역할 |
| --- | --- |
| F04AuthBn | Spring Boot 인증 서버(포트 8090) |
| F04AuthFn | React 웹 클라이언트 |
| F04AuthApp | Flutter 모바일 클라이언트 |

<br>

- 예제 코드: [Flutter 앱 가이드](../F04AuthApp/app_guide.md), [단계별 작업 가이드](../F04AuthApp/step_by_step_guide.md), [서버 설정](../F04AuthBn/src/main/resources/application.properties)

---

### 서버 주소

> 에뮬레이터에서 PC의 `localhost`는 에뮬레이터 자신이므로 PC에 접근하려면 특수 주소 `10.0.2.2`를 쓴다. 코드의 기본값을 이 주소로 두고, 실제 기기로 실행할 때는 `--dart-define=SERVER_IP=PC의IP`로 주소를 바꾼다. 주소를 소스에 고정하지 않고 빌드 시점 값(`String.fromEnvironment`)으로 받는 방식이다.

<br>

```dart
static const String _serverIp =
    String.fromEnvironment('SERVER_IP', defaultValue: '10.0.2.2');
static const String baseUrl = 'http://$_serverIp:8090';
```

<br>

- 예제 코드: [api_service.dart](../F04AuthApp/lib/services/api_service.dart), [IP 도우미](../F04AuthApp/lib/utils/ip_helper.dart)

---

### API 서비스

> 모든 요청을 한 곳에서 보내는 싱글톤 클래스이다. HTTP 클라이언트는 `dio`를 쓰고, 서버가 내려 준 쿠키를 `cookie_jar`의 `PersistCookieJar`로 파일에 저장해 앱을 다시 켜도 로그인 상태가 이어지게 한다. 저장 경로는 `path_provider`로 얻는다. 연결 제한 시간은 5초, 응답 대기는 15초로 두었는데, 첫 로그인은 서버의 BCrypt 암호 검증 때문에 오래 걸릴 수 있기 때문이다. 앱 시작 때 `initialize()`를 한 번 호출한다.

<br>

| 패키지 | 역할 |
| --- | --- |
| dio | HTTP 클라이언트, 타임아웃, 인터셉터 |
| cookie_jar, dio_cookie_manager | 쿠키 저장과 자동 전송 |
| path_provider | 앱 전용 저장 경로 |
| shared_preferences | 사용자 이름 등 간단한 값 저장 |

---

### 인증 서비스

> 인증 관련 호출을 한곳에 모은 클래스이다. 서버의 REST 주소에 맞춰 메서드를 만든다.

<br>

| 메서드 | 요청 | 역할 |
| --- | --- | --- |
| `join` | `POST /join` | 회원가입 |
| `login` | `POST /login` | 로그인, 쿠키 저장 |
| `logout` | `POST /logout` | 로그아웃 |
| `validateToken` | `GET /validate` | 토큰 유효성 확인 |
| `getUserInfo` | `GET /user` | 로그인한 사용자 정보 |
| `isLoggedIn` | 내부 확인 | 앱 시작 시 로그인 여부 판단 |

<br>

- 예제 코드: [auth_service.dart](../F04AuthApp/lib/services/auth_service.dart)

---

### 화면과 라우팅

> 로그인, 회원가입, 홈 세 화면으로 구성하고 `MaterialApp`의 `routes`에 이름을 등록해 이동한다. 시작 시 `initialRoute`에서 로그인 여부에 따라 로그인 화면 또는 홈 화면으로 보낸다. 각 화면은 입력 검증, 진행 중 표시, 실패 메시지를 처리한다.

<br>

- 예제 코드: [main.dart](../F04AuthApp/lib/main.dart), [로그인 화면](../F04AuthApp/lib/screens/login_screen.dart), [회원가입 화면](../F04AuthApp/lib/screens/join_screen.dart), [홈 화면](../F04AuthApp/lib/screens/home_screen.dart)

---

### 실기기 연결

> 실제 폰에서 쓰려면 PC와 폰이 같은 Wi-Fi에 있어야 하고, PC의 IP로 접속하도록 서버 주소를 바꾸며, 서버 쪽 CORS 허용 출처와 PC 방화벽의 포트(8090)도 열어야 한다. 환경에 따라 IP가 바뀌므로 고정 IP를 쓰거나 실행할 때마다 `--dart-define`으로 넘기는 방식이 안전하다. APK를 배포한 뒤 같은 Wi-Fi에서 연결하는 절차는 단계 문서에 정리했다.

<br>

- 예제 코드: [9단계 문서](../F04AuthApp/step9_apk_deploy_same_wifi_optional.md), [React 로그인](../F04AuthFn/src/components/Login.jsx)
