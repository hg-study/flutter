# Flutter APK 파일 생성 가이드

##  개요

이 문서는 Flutter 프로젝트에서 Android APK 파일을 생성하는 방법을 단계별로 설명합니다.

**대상 환경**: Windows / macOS (Flutter 기본 환경 구축 완료 상태 가정)

---

## 1단계. Flutter 환경 확인

빌드 전에 Flutter 환경이 올바르게 설정되어 있는지 확인합니다.

### 환경 확인 명령어

터미널(명령 프롬프트/PowerShell)에서 실행:

```bash
flutter doctor
```

### 확인 사항

다음 항목들이 모두 정상인지 확인:

-  **Android toolchain** - Android SDK 및 도구 설치 확인
-  **Android Studio** - Android Studio 설치 확인
-  **Flutter SDK** - Flutter SDK 설치 및 경로 확인

모든 항목이 체크되어 있어야 APK 빌드가 정상적으로 진행됩니다.

---

## 2단계. 기본 APK 빌드

### 릴리즈 APK 생성 (배포용)

가장 간단한 방법으로 릴리즈 APK를 생성합니다:

```bash
flutter build apk
```

### 빌드 결과물 위치

빌드 완료 후 APK 파일 위치:

```
프로젝트폴더/build/app/outputs/flutter-apk/app-release.apk
```

이 파일이 최종 배포용 APK입니다.

---

## 3단계. 디버그 APK 생성 (테스트용)

개발 중 테스트를 위한 디버그 APK를 생성합니다.

### 디버그 APK 빌드

```bash
flutter build apk --debug
```

### 빌드 결과물 위치

```
프로젝트폴더/build/app/outputs/flutter-apk/app-debug.apk
```

**용도**:
- USB로 연결된 폰에서 바로 설치하여 테스트
- 개발 중 빠른 테스트용
- 디버깅 정보 포함 (용량이 더 큼)

---

## 4단계. APK 빌드 옵션

### 단일 파일로 만들기 (Universal APK)

기본 빌드는 64비트, 32비트 각각 분리된 여러 APK를 생성합니다.

**단일 파일 1개로 만들기**:

```bash
flutter build apk --split-per-abi=false
```

**결과물**:
- `app-release.apk` - 모든 아키텍처를 포함한 단일 파일

**장점**: 하나의 파일로 모든 기기 지원  
**단점**: 파일 크기가 큼 (약 2~3배)

### ABI 분리 빌드 (권장 - 용량 최적화)

각 아키텍처별로 별도 APK를 생성하여 용량을 최소화합니다:

```bash
flutter build apk --split-per-abi
```

**결과물**:
- `app-armeabi-v7a-release.apk` - 32비트 ARM 기기용
- `app-arm64-v8a-release.apk` - 64비트 ARM 기기용 (대부분의 최신 기기)
- `app-x86_64-release.apk` - x86_64 기기용

**장점**: 
- 각 APK 파일 크기가 작음
- 사용자 기기에 맞는 APK만 설치하여 용량 최소화

**단점**: 여러 파일 관리 필요

---

## 5단계. 앱 아이콘 및 이름 변경

### 앱 이름 변경

**파일 위치**: `android/app/src/main/AndroidManifest.xml`

```xml
<application
    android:label="내앱이름"
    ...
>
```

또는 `android/app/src/main/res/values/strings.xml` 파일 생성/수정:

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">내앱이름</string>
</resources>
```

그리고 `AndroidManifest.xml`에서 참조:

```xml
<application
    android:label="@string/app_name"
    ...
>
```

### 앱 아이콘 설정

#### 1. 패키지 설치

```bash
flutter pub add flutter_launcher_icons --dev
```

#### 2. `pubspec.yaml` 설정

`pubspec.yaml` 파일에 다음 설정 추가:

```yaml
dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_icons:
  android: true
  ios: false
  image_path: "assets/icon.png"  # 아이콘 이미지 경로 (1024x1024 권장)
```

#### 3. 아이콘 생성 및 적용

```bash
flutter pub get
flutter pub run flutter_launcher_icons
```

**아이콘 이미지 요구사항**:
- 권장 크기: 1024x1024 픽셀
- 형식: PNG (투명 배경 가능)
- 위치: `assets/icon.png` (또는 원하는 경로)

---

## 6단계. 릴리즈 서명 (Play Store 배포 필수)

Google Play Store에 앱을 배포하려면 서명된 APK/AAB가 필요합니다.

### 키스토어 생성

#### Windows / macOS / Linux 공통

```bash
keytool -genkey -v -keystore mykey.jks -keyalg RSA -keysize 2048 -validity 10000 -alias mykey
```

**입력 정보**:
- 키스토어 비밀번호
- 키 비밀번호
- 이름, 조직 단위, 조직, 도시, 시/도, 국가 코드 등

**생성 위치**: 프로젝트 루트 또는 `android/` 폴더

### `android/key.properties` 파일 생성

`android/key.properties` 파일을 생성하고 다음 내용 추가:

```properties
storePassword=키스토어비밀번호
keyPassword=키비밀번호
keyAlias=mykey
storeFile=../mykey.jks
```

**주의**: 
- `key.properties` 파일은 **절대 Git에 커밋하지 마세요**
- `.gitignore`에 추가 권장

### `android/app/build.gradle` 설정

`android/app/build.gradle` 파일을 열고 다음 설정 추가:

#### 1. 파일 상단에 키스토어 속성 로드

```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}
```

#### 2. `android` 블록 내에 `signingConfigs` 추가

```gradle
android {
    // ... 기존 설정 ...

    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }

    buildTypes {
        release {
            signingConfig signingConfigs.release
            // ... 기타 설정 ...
        }
    }
}
```

### 서명 포함 빌드

설정 완료 후 빌드:

```bash
flutter build apk
```

또는 AAB 빌드 (Play Store 권장):

```bash
flutter build appbundle
```

**AAB 생성 위치**:
```
build/app/outputs/bundle/release/app-release.aab
```

---

## 7단계. 안드로이드 폰에 직접 설치

### USB 디버깅 활성화

1. 안드로이드 기기에서 **설정 > 개발자 옵션 > USB 디버깅** 활성화
2. USB로 컴퓨터에 연결

### 기기 연결 확인

```bash
flutter devices
```

또는

```bash
adb devices
```

### APK 설치

```bash
adb install build/app/outputs/flutter-apk/app-release.apk
```

**기존 앱이 설치되어 있는 경우**:

```bash
adb install -r build/app/outputs/flutter-apk/app-release.apk
```

(`-r` 옵션: 기존 앱 제거 후 재설치)

---

## 8단계. 빌드 명령어 요약

### 기본 빌드 명령어

| 목적 | 명령어 | 결과물 위치 |
|------|--------|------------|
| 릴리즈 APK | `flutter build apk` | `build/app/outputs/flutter-apk/app-release.apk` |
| 디버그 APK | `flutter build apk --debug` | `build/app/outputs/flutter-apk/app-debug.apk` |
| 단일 APK | `flutter build apk --split-per-abi=false` | `build/app/outputs/flutter-apk/app-release.apk` |
| ABI 분리 APK | `flutter build apk --split-per-abi` | `build/app/outputs/flutter-apk/app-*-release.apk` |
| AAB (Play Store) | `flutter build appbundle` | `build/app/outputs/bundle/release/app-release.aab` |

---

##  초보자용 빠른 시작

### 가장 빠른 APK 만들기 (3단계)

1. **환경 확인**
   ```bash
   flutter doctor
   ```

2. **APK 빌드**
   ```bash
   flutter build apk
   ```

3. **파일 확인**
   ```
   build/app/outputs/flutter-apk/app-release.apk
   ```

### Play Store 배포용 (AAB 권장)

Play Store에 올릴 때는 APK 대신 **AAB (Android App Bundle)** 빌드를 권장합니다:

```bash
flutter build appbundle
```

**AAB 장점**:
- Google Play가 기기별로 최적화된 APK 생성
- 앱 크기 자동 최적화
- Play Store에서 요구하는 형식

**생성 위치**:
```
build/app/outputs/bundle/release/app-release.aab
```

---

##  실제 사용 시나리오

### 시나리오 1: 수업/테스트 배포

**목적**: 빠른 테스트 및 배포

```bash
flutter build apk
```

→ `app-release.apk` 파일을 학생/테스터에게 배포

### 시나리오 2: 최종 마켓 등록

**목적**: Google Play Store 등록

```bash
flutter build appbundle
```

→ `app-release.aab` 파일을 Play Console에 업로드

### 시나리오 3: 용량 최적화 배포

**목적**: 각 기기별 최적화된 APK 배포

```bash
flutter build apk --split-per-abi
```

→ 기기 아키텍처에 맞는 APK 선택 배포

---

##  주의사항 및 트러블슈팅

### 빌드 실패 시 확인 사항

1. **Flutter 환경 확인**
   ```bash
   flutter doctor -v
   ```

2. **의존성 확인**
   ```bash
   flutter pub get
   ```

3. **캐시 정리 후 재빌드**
   ```bash
   flutter clean
   flutter pub get
   flutter build apk
   ```

### 서명 오류 해결

- **키스토어 파일 경로 확인**: `key.properties`의 `storeFile` 경로가 올바른지 확인
- **비밀번호 확인**: 키스토어 비밀번호와 키 비밀번호가 정확한지 확인
- **키 별칭 확인**: `keyAlias`가 키스토어 생성 시 사용한 별칭과 일치하는지 확인

### 빌드 크기 최적화

- **ProGuard/R8 사용**: `android/app/build.gradle`에서 코드 난독화 및 최적화 활성화
- **불필요한 리소스 제거**: 사용하지 않는 이미지, 폰트 등 제거
- **ABI 분리**: `--split-per-abi` 옵션 사용

---

##  추가 참고 자료

- [Flutter 공식 문서 - Android 배포](https://docs.flutter.dev/deployment/android)
- [Google Play Console 가이드](https://support.google.com/googleplay/android-developer)
- [Android App Bundle 가이드](https://developer.android.com/guide/app-bundle)

---

##  자동화 스크립트 예제

### Windows (PowerShell) - 빌드 스크립트

`build-apk.ps1` 파일 생성:

```powershell
# Flutter 환경 확인
flutter doctor

# 클린 빌드
flutter clean
flutter pub get

# APK 빌드
flutter build apk --release

Write-Host "APK 빌드 완료!"
Write-Host "위치: build/app/outputs/flutter-apk/app-release.apk"
```

실행:
```powershell
.\build-apk.ps1
```

### macOS/Linux (Bash) - 빌드 스크립트

`build-apk.sh` 파일 생성:

```bash
#!/bin/bash

# Flutter 환경 확인
flutter doctor

# 클린 빌드
flutter clean
flutter pub get

# APK 빌드
flutter build apk --release

echo "APK 빌드 완료!"
echo "위치: build/app/outputs/flutter-apk/app-release.apk"
```

실행 권한 부여 및 실행:
```bash
chmod +x build-apk.sh
./build-apk.sh
```

---

##  체크리스트

APK 빌드 전 확인 사항:

- [ ] Flutter 환경 설정 완료 (`flutter doctor` 통과)
- [ ] 프로젝트 의존성 설치 완료 (`flutter pub get`)
- [ ] 앱 이름 및 아이콘 설정 (선택)
- [ ] 키스토어 생성 및 서명 설정 (Play Store 배포 시 필수)
- [ ] `key.properties` 파일 `.gitignore`에 추가 (보안)
- [ ] 빌드 성공 확인
- [ ] 생성된 APK/AAB 파일 확인

---

**마지막 업데이트**: 2024년

