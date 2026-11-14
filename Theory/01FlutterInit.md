# Flutter Init

- [Flutter란](#flutter란)
- [프로젝트 구조](#프로젝트-구조)
- [실행](#실행)
- [Android 빌드](#android-빌드)
- [iOS 빌드](#ios-빌드)

<br>

---

### Flutter란

> Flutter는 Dart 언어 하나로 Android, iOS, 웹, 데스크톱 앱을 만드는 UI 프레임워크이다. 화면의 모든 요소를 위젯(Widget)이라는 객체로 표현하고, 플랫폼의 기본 UI 부품을 쓰지 않고 자체 엔진으로 화면을 직접 그리기 때문에 플랫폼마다 모양과 동작이 같다. 코드를 저장하면 앱 상태를 유지한 채 화면만 바뀌는 핫 리로드를 지원해 개발이 빠르다.

<br>

| 구분 | 내용 |
| --- | --- |
| 언어 | Dart |
| 화면 단위 | 위젯 트리 |
| 개발 도구 | Flutter SDK, Android Studio 또는 VS Code |
| 환경 점검 | `flutter doctor` |

---

### 프로젝트 구조

> `flutter create`로 만든 프로젝트는 소스 폴더 `lib`, 테스트 폴더 `test`, 플랫폼별 폴더(`android`, `ios`, `web`, `windows`, `linux`, `macos`)와 설정 파일로 구성된다. 우리가 작성하는 코드는 거의 `lib`에 있고, 진입점은 `lib/main.dart`의 `main()` 함수이다. 플랫폼 폴더는 해당 플랫폼에서 빌드하고 권한, 아이콘, 앱 이름을 설정할 때만 건드린다.

<br>

| 파일 | 역할 |
| --- | --- |
| `pubspec.yaml` | 이름, SDK 버전, 의존 패키지, 에셋 선언 |
| `pubspec.lock` | 실제 설치된 패키지 버전 고정 |
| `analysis_options.yaml` | 코드 검사 규칙(lint) |
| `lib/main.dart` | 앱 시작점 |
| `test/` | 위젯 테스트 |

<br>

- 예제 코드: [main.dart](../F00Init/lib/main.dart), [pubspec.yaml](../F00Init/pubspec.yaml), [프로젝트 구조 문서](../F00Init/01_PROJECT_STRUCTURE.md)

---

### 실행

> 패키지는 `flutter pub get`으로 내려받고 `flutter run`으로 연결된 기기나 에뮬레이터에 실행한다. 실행 중 터미널에서 `r`을 누르면 핫 리로드, `R`은 핫 리스타트이다. 대상 기기는 `flutter devices`로 확인한다.

<br>

```bash
flutter doctor
flutter pub get
flutter run
```

---

### Android 빌드

> 배포용 APK는 `flutter build apk --release`로 만들고, 결과는 `build/app/outputs/flutter-apk`에 생긴다. 기기 구조(ABI)별로 나누어 빌드하면 용량이 줄어든다(`--split-per-abi`). 앱 이름은 `AndroidManifest.xml`의 label, 아이콘은 `mipmap` 폴더에서 바꾼다. 스토어 배포는 키스토어를 만들고 `key.properties`와 `build.gradle`에 서명 설정을 해야 하며, 키스토어와 `key.properties`는 저장소에 올리지 않는다.

<br>

- 예제 코드: [APK 빌드 문서](../F00Init/02_FLUTTER_APK_BUILD.md)

---

### iOS 빌드

> iOS 빌드는 macOS와 Xcode, Apple 개발자 계정이 필요하다. 시뮬레이터에서 실행해 개발하고, 배포용은 Xcode에서 서명과 팀을 설정한 뒤 Archive를 만들어 `.ipa`로 내보내거나 `flutter build ipa`로 자동화해 App Store Connect에 업로드한다.

<br>

- 예제 코드: [iOS 빌드 문서](../F00Init/03_FLUTTER_IOS_BUILD.md)
