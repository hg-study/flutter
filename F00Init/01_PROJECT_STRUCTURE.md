# F00Init Flutter 프로젝트 구조

##  프로젝트 개요

- **프로젝트명**: ch01_init (pubspec.yaml 기준)
- **설명**: 새로운 Flutter 프로젝트의 초기 템플릿
- **버전**: 1.0.0+1
- **Dart SDK**: ^3.9.2

##  디렉토리 구조

```
F00Init/
├── lib/                    # Dart 소스 코드
│   └── main.dart          # 애플리케이션 진입점
├── test/                   # 테스트 코드
│   └── widget_test.dart   # 위젯 테스트
├── android/                # Android 플랫폼 설정
├── ios/                    # iOS 플랫폼 설정
├── web/                    # Web 플랫폼 설정
├── windows/                # Windows 플랫폼 설정
├── linux/                  # Linux 플랫폼 설정
├── macos/                  # macOS 플랫폼 설정
├── pubspec.yaml           # 프로젝트 설정 및 의존성
├── pubspec.lock           # 의존성 잠금 파일
├── analysis_options.yaml  # Dart 코드 분석 설정
└── README.md              # 프로젝트 설명
```

##  상세 파일 구조

### `lib/` - Dart 소스 코드
```
lib/
└── main.dart              # Flutter 애플리케이션 진입점
```

### `test/` - 테스트 코드
```
test/
└── widget_test.dart       # 위젯 테스트 파일
```

### `android/` - Android 플랫폼
```
android/
├── app/
│   ├── build.gradle.kts   # Android 앱 빌드 설정
│   └── src/
│       ├── debug/
│       │   └── AndroidManifest.xml
│       ├── main/
│       │   ├── AndroidManifest.xml    # Android 앱 매니페스트
│       │   ├── kotlin/
│       │   │   └── com/example/ch01_init/
│       │   │       └── MainActivity.kt # Android 진입점
│       │   └── res/                    # Android 리소스
│       │       ├── drawable/
│       │       │   └── launch_background.xml
│       │       ├── drawable-v21/
│       │       │   └── launch_background.xml
│       │       ├── mipmap-*/           # 런처 아이콘 (다양한 해상도)
│       │       │   └── ic_launcher.png
│       │       ├── values/
│       │       │   └── styles.xml
│       │       └── values-night/
│       │           └── styles.xml
│       └── profile/
│           └── AndroidManifest.xml
├── build.gradle.kts       # 프로젝트 레벨 빌드 설정
├── gradle.properties      # Gradle 속성
├── settings.gradle.kts    # Gradle 설정
└── gradle/
    └── wrapper/
        └── gradle-wrapper.properties
```

### `ios/` - iOS 플랫폼
```
ios/
├── Flutter/
│   ├── AppFrameworkInfo.plist
│   ├── Debug.xcconfig     # Debug 빌드 설정
│   └── Release.xcconfig    # Release 빌드 설정
├── Runner/
│   ├── AppDelegate.swift  # iOS 앱 델리게이트 (진입점)
│   ├── Info.plist         # iOS 앱 정보 설정
│   ├── Runner-Bridging-Header.h
│   ├── Assets.xcassets/   # 앱 아이콘 및 이미지
│   │   ├── AppIcon.appiconset/
│   │   │   ├── Contents.json
│   │   │   └── Icon-App-*.png (다양한 크기)
│   │   └── LaunchImage.imageset/
│   │       ├── Contents.json
│   │       └── LaunchImage*.png
│   └── Base.lproj/
│       ├── LaunchScreen.storyboard
│       └── Main.storyboard
├── Runner.xcodeproj/      # Xcode 프로젝트
│   ├── project.pbxproj
│   ├── project.xcworkspace/
│   └── xcshareddata/
│       └── xcschemes/
│           └── Runner.xcscheme
├── Runner.xcworkspace/    # Xcode 워크스페이스
│   ├── contents.xcworkspacedata
│   └── xcshareddata/
└── RunnerTests/
    └── RunnerTests.swift
```

### `web/` - Web 플랫폼
```
web/
├── index.html             # 웹 앱 진입점 HTML
├── manifest.json          # PWA 매니페스트
├── favicon.png            # 파비콘
└── icons/                 # 웹 아이콘
    ├── Icon-192.png
    ├── Icon-512.png
    ├── Icon-maskable-192.png
    └── Icon-maskable-512.png
```

### `windows/` - Windows 플랫폼
```
windows/
├── CMakeLists.txt         # CMake 빌드 설정
├── flutter/
│   ├── CMakeLists.txt
│   ├── generated_plugin_registrant.cc
│   ├── generated_plugin_registrant.h
│   └── generated_plugins.cmake
└── runner/
    ├── main.cpp           # Windows 앱 진입점
    ├── flutter_window.cpp
    ├── flutter_window.h
    ├── win32_window.cpp
    ├── win32_window.h
    ├── utils.cpp
    ├── utils.h
    ├── resource.h
    ├── Runner.rc
    ├── runner.exe.manifest
    └── resources/
        └── app_icon.ico
```

### `linux/` - Linux 플랫폼
```
linux/
├── CMakeLists.txt         # CMake 빌드 설정
├── flutter/
│   ├── CMakeLists.txt
│   ├── generated_plugin_registrant.cc
│   ├── generated_plugin_registrant.h
│   └── generated_plugins.cmake
└── runner/
    ├── main.cc            # Linux 앱 진입점
    ├── my_application.cc
    ├── my_application.h
    └── CMakeLists.txt
```

### `macos/` - macOS 플랫폼
```
macos/
├── Flutter/
│   ├── Flutter-Debug.xcconfig
│   ├── Flutter-Release.xcconfig
│   └── GeneratedPluginRegistrant.swift
├── Runner/
│   ├── AppDelegate.swift      # macOS 앱 델리게이트
│   ├── MainFlutterWindow.swift # Flutter 윈도우 관리
│   ├── Info.plist             # macOS 앱 정보
│   ├── Assets.xcassets/       # 앱 아이콘
│   │   └── AppIcon.appiconset/
│   │       ├── Contents.json
│   │       └── app_icon_*.png (다양한 크기)
│   ├── Base.lproj/
│   │   └── MainMenu.xib
│   ├── Configs/
│   │   ├── AppInfo.xcconfig
│   │   ├── Debug.xcconfig
│   │   ├── Release.xcconfig
│   │   └── Warnings.xcconfig
│   ├── DebugProfile.entitlements
│   └── Release.entitlements
├── Runner.xcodeproj/      # Xcode 프로젝트
│   ├── project.pbxproj
│   ├── project.xcworkspace/
│   └── xcshareddata/
│       └── xcschemes/
│           └── Runner.xcscheme
├── Runner.xcworkspace/    # Xcode 워크스페이스
│   ├── contents.xcworkspacedata
│   └── xcshareddata/
└── RunnerTests/
    └── RunnerTests.swift
```

##  주요 파일 설명

### 1. 프로젝트 설정 파일

#### `pubspec.yaml`
- 프로젝트 메타데이터 및 의존성 관리
- **의존성**:
  - `flutter`: Flutter SDK
  - `cupertino_icons: ^1.0.8`: iOS 스타일 아이콘
- **개발 의존성**:
  - `flutter_test`: 테스트 프레임워크
  - `flutter_lints: ^5.0.0`: 코드 린팅 규칙

#### `analysis_options.yaml`
- Dart 코드 분석기 설정
- `flutter_lints` 패키지의 권장 린트 규칙 사용

### 2. 소스 코드

#### `lib/main.dart`
애플리케이션의 진입점으로, 기본 카운터 앱을 구현합니다.

**주요 구성 요소**:
- `MyApp`: 루트 StatelessWidget
  - MaterialApp 설정
  - 테마 설정 (deepPurple 색상 스킴)
- `MyHomePage`: StatefulWidget
  - 카운터 상태 관리
  - AppBar, Center, Column, FloatingActionButton 위젯 사용

**코드 구조**:
```dart
main() → MyApp → MyHomePage → _MyHomePageState
```

### 3. 테스트 코드

#### `test/widget_test.dart`
- 위젯 테스트 예제
- 카운터 증가 기능 테스트
- `flutter_test` 패키지 사용

##  플랫폼별 설정

### Android (`android/`)

**주요 파일**:
- `app/build.gradle.kts`: Android 빌드 설정
  - Application ID: `com.example.ch01_init`
  - Kotlin 사용
  - Java 11 호환성
- `app/src/main/AndroidManifest.xml`: Android 앱 매니페스트
- `app/src/main/kotlin/`: Kotlin 네이티브 코드
- `gradle/`: Gradle 래퍼 설정

### iOS (`ios/`)

**주요 파일**:
- `Runner/AppDelegate.swift`: iOS 앱 델리게이트
- `Runner/Info.plist`: iOS 앱 정보 설정
- `Runner/Assets.xcassets/`: 앱 아이콘 및 이미지 리소스
- `Runner.xcodeproj/`: Xcode 프로젝트 파일
- `Runner.xcworkspace/`: Xcode 워크스페이스

### Web (`web/`)

**주요 파일**:
- `index.html`: 웹 앱 진입점 HTML
- `manifest.json`: PWA 매니페스트
- `icons/`: 웹 아이콘 (192px, 512px, maskable 버전)
- `favicon.png`: 파비콘

### Windows (`windows/`)

**주요 파일**:
- `CMakeLists.txt`: CMake 빌드 설정
- `runner/main.cpp`: Windows 앱 진입점
- `runner/flutter_window.cpp/h`: Flutter 윈도우 관리
- `runner/win32_window.cpp/h`: Win32 윈도우 래퍼

### Linux (`linux/`)

**주요 파일**:
- `CMakeLists.txt`: CMake 빌드 설정
- `runner/main.cc`: Linux 앱 진입점
- `runner/my_application.cc/h`: GTK 애플리케이션 클래스

### macOS (`macos/`)

**주요 파일**:
- `Runner/AppDelegate.swift`: macOS 앱 델리게이트
- `Runner/MainFlutterWindow.swift`: Flutter 윈도우 관리
- `Runner/Info.plist`: macOS 앱 정보 설정
- `Runner/Assets.xcassets/`: 앱 아이콘 리소스
- `Runner.xcodeproj/`: Xcode 프로젝트 파일

##  프로젝트 특징

### 1. 멀티 플랫폼 지원
- Android, iOS, Web, Windows, Linux, macOS 6개 플랫폼 지원

### 2. 기본 카운터 앱
- StatefulWidget을 사용한 상태 관리 예제
- Material Design UI 컴포넌트 사용

### 3. 테스트 코드 포함
- 위젯 테스트 예제 제공

### 4. 코드 품질 관리
- `flutter_lints`를 통한 코드 린팅
- `analysis_options.yaml`을 통한 분석 설정

##  의존성 정보

### 프로덕션 의존성
- `flutter`: Flutter SDK (SDK에서 제공)
- `cupertino_icons: ^1.0.8`: iOS 스타일 아이콘

### 개발 의존성
- `flutter_test`: Flutter 테스트 프레임워크 (SDK에서 제공)
- `flutter_lints: ^5.0.0`: Flutter 린팅 규칙

##  애플리케이션 시작 위치

### Flutter 진입점 (공통)
모든 플랫폼에서 Flutter 애플리케이션은 다음 파일에서 시작됩니다:

**`lib/main.dart`**
- 모든 플랫폼의 공통 진입점
- `main()` 함수가 애플리케이션을 시작
- `runApp()`을 통해 `MyApp` 위젯을 실행

```dart
void main() {
  runApp(const MyApp());
}
```

### 플랫폼별 네이티브 진입점

#### Android
**시작 위치**: `android/app/src/main/kotlin/com/example/ch01_init/MainActivity.kt`

```kotlin
class MainActivity : FlutterActivity()
```

**실행 흐름**:
1. Android 시스템이 `MainActivity`를 시작
2. `FlutterActivity`가 Flutter 엔진을 초기화
3. `lib/main.dart`의 `main()` 함수 호출

**관련 파일**:
- `android/app/src/main/AndroidManifest.xml`: 앱 매니페스트에서 MainActivity 등록

#### iOS
**시작 위치**: `ios/Runner/AppDelegate.swift`

```swift
@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(...) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(...)
  }
}
```

**실행 흐름**:
1. iOS 시스템이 `AppDelegate`를 시작
2. `FlutterAppDelegate`가 Flutter 엔진을 초기화
3. `lib/main.dart`의 `main()` 함수 호출

**관련 파일**:
- `ios/Runner/Info.plist`: 앱 설정 정보

#### Web
**시작 위치**: `web/index.html`

```html
<script>
  window.addEventListener('load', function(ev) {
    _flutter.loader.loadEntrypoint({
      serviceWorker: {
        serviceWorkerVersion: serviceWorkerVersion,
      },
      onEntrypointLoaded: function(engineInitializer) {
        engineInitializer.initializeEngine().then(function(appRunner) {
          appRunner.runApp();
        });
      }
    });
  });
</script>
```

**실행 흐름**:
1. 브라우저가 `index.html`을 로드
2. Flutter Web 엔진이 초기화
3. `lib/main.dart`의 `main()` 함수 호출

#### Windows
**시작 위치**: `windows/runner/main.cpp`

```cpp
int APIENTRY wWinMain(...) {
  flutter::DartProject project(L"data");
  FlutterWindow window(project);
  // ...
  window.Run();
}
```

**실행 흐름**:
1. Windows가 `wWinMain()` 함수를 시작
2. `FlutterWindow`가 Flutter 엔진을 초기화
3. `lib/main.dart`의 `main()` 함수 호출

#### Linux
**시작 위치**: `linux/runner/main.cc`

```cpp
int main(int argc, char** argv) {
  g_autoptr(MyApplication) app = my_application_new();
  return g_application_run(G_APPLICATION(app), argc, argv);
}
```

**실행 흐름**:
1. Linux가 `main()` 함수를 시작
2. GTK 애플리케이션이 Flutter 엔진을 초기화
3. `lib/main.dart`의 `main()` 함수 호출

#### macOS
**시작 위치**: `macos/Runner/AppDelegate.swift`

```swift
@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  override func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Flutter 엔진 초기화
  }
}
```

**실행 흐름**:
1. macOS가 `AppDelegate`를 시작
2. `FlutterAppDelegate`가 Flutter 엔진을 초기화
3. `lib/main.dart`의 `main()` 함수 호출

### 실행 흐름 요약

```
[플랫폼별 네이티브 진입점]
    ↓
[Flutter 엔진 초기화]
    ↓
lib/main.dart의 main() 함수
    ↓
runApp(MyApp())
    ↓
MyApp.build() → MaterialApp
    ↓
MyHomePage → _MyHomePageState
    ↓
UI 렌더링
```

##  실행 방법

### 개발 모드 실행
```bash
flutter run
```

### 특정 플랫폼 실행
```bash
flutter run -d android    # Android
flutter run -d ios        # iOS
flutter run -d chrome     # Web
flutter run -d windows    # Windows
flutter run -d linux      # Linux
flutter run -d macos      # macOS
```

### 테스트 실행
```bash
flutter test
```

### 코드 분석
```bash
flutter analyze
```

##  주요 위젯 구조

```
MaterialApp
└── MyHomePage (StatefulWidget)
    └── Scaffold
        ├── AppBar
        ├── Body (Center)
        │   └── Column
        │       ├── Text ("You have pushed...")
        │       └── Text (카운터 값)
        └── FloatingActionButton
```

##  코드 분석

### 상태 관리
- `StatefulWidget`과 `State` 클래스를 사용한 로컬 상태 관리
- `setState()` 메서드를 통한 상태 업데이트

### 위젯 계층
- **StatelessWidget**: `MyApp` - 정적 위젯
- **StatefulWidget**: `MyHomePage` - 상태를 가진 위젯
- **State**: `_MyHomePageState` - 상태 관리 로직

### 테마 설정
- `ColorScheme.fromSeed()`를 사용한 Material 3 색상 스킴
- 기본 색상: `Colors.deepPurple`

##  참고 자료

- [Flutter 공식 문서](https://docs.flutter.dev/)
- [Dart 언어 가이드](https://dart.dev/guides)
- [Material Design 3](https://m3.material.io/)

