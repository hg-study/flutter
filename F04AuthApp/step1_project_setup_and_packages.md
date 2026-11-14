# 단계 1: 프로젝트 설정 및 패키지 설치

##  목표
Flutter 프로젝트에 필요한 패키지를 설치하고 프로젝트 구조를 준비합니다.

##  사전 준비 사항
-  Flutter SDK 설치 완료
-  백엔드 서버(F04AuthBn) 실행 중 (포트 8090)
-  MySQL 데이터베이스 실행 중
-  Redis 서버 실행 중

##  작업 내용

### 1.1 pubspec.yaml 파일 수정

`F04AuthApp/pubspec.yaml` 파일을 열고 `dependencies` 섹션에 다음 패키지를 추가합니다:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  
  # HTTP 통신을 위한 패키지
  http: ^1.1.0
  dio: ^5.4.0
  
  # 쿠키 관리를 위한 패키지
  cookie_jar: ^4.0.8
  dio_cookie_manager: ^3.0.0
  
  # 로컬 저장소를 위한 패키지
  shared_preferences: ^2.2.2
```

### 1.2 패키지 설치

터미널에서 다음 명령어를 실행합니다:

```bash
cd F04AuthApp
flutter pub get
```

### 1.3 디렉토리 구조 생성

`lib` 폴더 안에 다음 디렉토리를 생성합니다:

```
lib/
├── services/      # API 서비스 클래스
├── screens/       # 화면 위젯
└── main.dart      # 앱 진입점
```

**작업 방법:**
- `lib` 폴더 우클릭 → New → Directory
- `services` 폴더 생성
- `screens` 폴더 생성

##  패키지 설명

### HTTP 통신 패키지
- **http**: 기본 HTTP 요청 패키지
- **dio**: 고급 HTTP 클라이언트 (인터셉터, 쿠키 관리 등 지원)

### 쿠키 관리 패키지
- **cookie_jar**: 쿠키 저장소 관리
- **dio_cookie_manager**: Dio와 쿠키 관리 연동

### 로컬 저장소 패키지
- **shared_preferences**: 키-값 형태의 로컬 저장소 (로그인 상태 저장용)

##  확인 사항
- [ ] `pubspec.yaml`에 모든 패키지가 추가되었는지 확인
- [ ] `flutter pub get` 실행 후 에러가 없는지 확인
- [ ] `lib/services`와 `lib/screens` 폴더가 생성되었는지 확인

##  문제 해결

### 패키지 설치 실패 시
1. 인터넷 연결 확인
2. `flutter clean` 실행 후 다시 `flutter pub get`
3. 패키지 버전 확인 (pub.dev에서 최신 버전 확인)

### 디렉토리 생성 오류 시
- IDE에서 직접 생성하거나
- 터미널에서 `mkdir lib/services lib/screens` 명령어 사용

##  다음 단계
다음 단계에서는 API 서비스 기본 클래스를 생성합니다.
→ [단계2: API 서비스 구현](./step2_api_service.md)

