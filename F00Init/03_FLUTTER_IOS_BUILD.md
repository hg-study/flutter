# Flutter iOS 파일 생성 가이드

##  개요

이 문서는 Flutter 프로젝트에서 iOS IPA 파일을 생성하고 App Store에 배포하는 방법을 단계별로 설명합니다.

**중요**: iOS 빌드는 **반드시 macOS 환경**이 필요합니다.

**대상 환경**: macOS (Xcode 설치 필수)

---

##  필수 준비사항

iOS용 빌드를 시작하기 전에 다음이 모두 준비되어 있어야 합니다:

### 필수 하드웨어/소프트웨어

-  **macOS** - 맥북, 아이맥 등 (Windows에서는 불가능)
-  **Xcode** - App Store에서 설치 (최신 버전 권장)
-  **Flutter SDK** - Flutter 개발 환경 설치
-  **Apple ID** - Apple 개발자 계정

### Apple 개발자 계정

| 계정 유형 | 비용 | 용도 |
|----------|------|------|
| **무료 계정** | 무료 | 실기기 테스트만 가능 |
| **유료 개발자 계정** | 연 $99 | App Store 배포, TestFlight 베타 테스트 |

**참고**: App Store에 앱을 배포하려면 유료 개발자 계정($99/년)이 필수입니다.

---

## 1단계. Flutter 환경 확인

빌드 전에 Flutter 및 iOS 환경이 올바르게 설정되어 있는지 확인합니다.

### 환경 확인 명령어

터미널에서 실행:

```bash
flutter doctor
```

### 확인 사항

다음 항목들이 모두 정상인지 확인:

-  **Xcode** - Xcode 설치 및 버전 확인
-  **iOS toolchain** - iOS 개발 도구 체인 확인
-  **CocoaPods** - iOS 의존성 관리 도구 (자동 설치됨)
-  **Flutter SDK** - Flutter SDK 설치 및 경로 확인

**예시 출력**:
```
[] Xcode - develop for iOS and macOS (Xcode 15.0)
[] iOS toolchain - develop for iOS devices (iOS 17.0)
[] CocoaPods version 1.12.0
[] Flutter (Channel stable, 3.x.x)
```

모든 항목이 체크되어 있어야 iOS 빌드가 정상적으로 진행됩니다.

---

## 2단계. iOS 시뮬레이터 / 실기기에서 실행 (개발용)

### 2-1. iOS 시뮬레이터 실행

#### 시뮬레이터 열기

```bash
open -a Simulator
```

또는 Xcode에서:
```
Xcode > Open Developer Tool > Simulator
```

#### 연결된 디바이스 확인

```bash
flutter devices
```

**출력 예시**:
```
iPhone 15 Pro (simulator) • 12345678-1234-1234-1234-123456789012 • ios • com.apple.CoreSimulator.SimRuntime.iOS-17-0
```

#### 앱 실행

```bash
flutter run
```

특정 시뮬레이터 지정:
```bash
flutter run -d "iPhone 15 Pro"
```

### 2-2. Xcode로 프로젝트 열기

#### Xcode 워크스페이스 열기

```bash
cd 프로젝트폴더
open ios/Runner.xcworkspace
```

**중요**: `.xcworkspace` 파일을 열어야 합니다. `.xcodeproj`가 아닙니다!

#### Xcode에서 실행

1. Xcode 상단 타깃 선택 (예: iPhone 15 Pro)
2. ▶ (Run) 버튼 클릭
3. 시뮬레이터 또는 연결된 실기기에서 앱 실행

---

## 3단계. 배포용 iOS 빌드 (IPA) 만들기

iOS 배포는 크게 다음 단계로 구성됩니다:

1. **Flutter에서 iOS 릴리즈 빌드 준비**
2. **Xcode에서 Archive 생성**
3. **Archive에서 .ipa 생성 및 배포**

### 3-1. Flutter에서 iOS 릴리즈 빌드

프로젝트 폴더에서 실행:

```bash
flutter build ios --release
```

**이 명령의 역할**:
- iOS용 릴리즈 빌드 설정 준비
- Flutter 프레임워크 컴파일
- 실제 `.ipa` 파일은 Xcode Archive 과정에서 생성됨

**빌드 결과물 위치**:
```
프로젝트폴더/build/ios/iphoneos/Runner.app
```

### 3-2. Xcode에서 서명 및 팀 설정

#### Xcode 워크스페이스 열기

```bash
open ios/Runner.xcworkspace
```

#### 서명 설정

1. **왼쪽 상단에서 Runner 프로젝트 클릭**
2. **TARGETS > Runner 선택**
3. **Signing & Capabilities 탭** 선택

**설정 항목**:

- **Team**: 본인의 Apple 개발자 계정 선택
  - 무료 계정: "Personal Team (이름)"
  - 유료 계정: "Apple Developer Program (팀명)"
  
- **Bundle Identifier**: 고유한 앱 식별자
  - 형식: `com.회사명.앱이름`
  - 예: `com.mycompany.myapp`
  - **중요**: App Store에 이미 등록된 Bundle ID와 중복되면 안 됩니다

- **Automatically manage signing**: 체크 (권장)
  - Xcode가 자동으로 인증서 및 프로비저닝 프로파일 관리

#### 버전 정보 설정

**General 탭**에서:

- **Version**: 사용자에게 보이는 버전 번호
  - 예: `1.0.0`, `1.2.3`
  
- **Build**: 빌드 번호 (배포할 때마다 증가해야 함)
  - 예: `1`, `2`, `3`...
  - **중요**: App Store 업로드 시 이전보다 큰 숫자여야 함

**예시**:
```
Version: 1.0.0
Build: 1
```

### 3-3. Archive 생성

#### Archive 전 준비

1. **Xcode 상단 디바이스 선택**
   - `Any iOS Device (arm64)` 선택
   - 또는 실제 연결된 iOS 기기 선택
   - **시뮬레이터는 Archive 불가**

2. **Product > Scheme > Runner** 확인

#### Archive 실행

1. **Xcode 상단 메뉴**: `Product > Archive`
2. 빌드가 시작되고 완료되면 **Organizer 창**이 자동으로 열림
3. 생성된 Archive가 목록에 표시됨

**Archive 위치**:
```
~/Library/Developer/Xcode/Archives/YYYY-MM-DD/
```

### 3-4. .ipa 파일 만들기 (배포용)

Organizer에서 Archive를 선택한 후:

#### Distribute App 클릭

1. **Organizer 창**에서 생성된 Archive 선택
2. **Distribute App** 버튼 클릭

#### 배포 방법 선택

다음 중 목적에 맞는 방법 선택:

| 배포 방법 | 용도 | 설명 |
|----------|------|------|
| **App Store Connect** | App Store 배포 | 공식 앱스토어 배포용 |
| **Ad Hoc** | 제한된 기기 테스트 | 최대 100대 기기, UDID 등록 필요 |
| **Development** | 개발자 테스트 | 개발자 계정에 등록된 기기만 |
| **Enterprise** | 기업 내부 배포 | Enterprise 계정 필요 ($299/년) |

#### .ipa 파일 생성 과정

1. **배포 방법 선택** (예: Ad Hoc)
2. **Distribution options** 확인
   - Rebuild from Bitcode: 체크 (권장)
   - Upload your app's symbols: 체크 (크래시 리포트용)
3. **Signing** 선택
   - Automatically manage signing (권장)
   - 또는 수동 서명 선택
4. **App Thinning** 선택
   - All compatible device variants (권장)
5. **최종 확인** 후 **Distribute** 클릭
6. **저장 위치 선택** → `.ipa` 파일 생성 완료

**생성된 .ipa 파일 위치**:
```
선택한 저장 경로/앱이름.ipa
```

---

## 4단계. App Store Connect로 업로드 (App Store 배포)

### 4-1. Archive에서 App Store Connect 업로드

#### Organizer에서 업로드

1. **Organizer**에서 Archive 선택
2. **Distribute App** 클릭
3. **App Store Connect** 선택
4. **Upload** 선택
5. 안내에 따라 진행:
   - Distribution options 확인
   - Signing 설정 확인
   - **Upload** 클릭
6. 업로드 완료까지 대기 (몇 분 소요)

### 4-2. App Store Connect에서 앱 설정

#### 웹 브라우저에서 접속

1. [App Store Connect](https://appstoreconnect.apple.com) 접속
2. Apple ID로 로그인

#### 앱 정보 입력

업로드된 빌드가 처리되면 (보통 10-30분):

1. **내 앱** 메뉴에서 앱 선택 (또는 새로 만들기)
2. **앱 정보** 입력:
   - 앱 이름
   - 카테고리
   - 가격 및 판매 지역
   - 연령 등급
3. **스크린샷** 업로드:
   - iPhone 6.7인치 디스플레이 (필수)
   - iPhone 6.5인치 디스플레이 (필수)
   - iPhone 5.5인치 디스플레이 (선택)
   - iPad Pro 12.9인치 (선택)
4. **앱 설명** 작성:
   - 앱 설명 (최대 4000자)
   - 키워드
   - 홍보 텍스트
   - 지원 URL
   - 마케팅 URL (선택)
5. **개인정보 보호** 정보 입력
6. **빌드 선택**: 업로드된 빌드 선택
7. **심사 정보** 입력:
   - 연락처 정보
   - 심사 노트
   - 데모 계정 (필요시)

### 4-3. 심사 제출

1. 모든 필수 정보 입력 완료 확인
2. **심사 제출** 버튼 클릭
3. 심사 진행 상황은 App Store Connect에서 확인 가능

**심사 소요 시간**: 보통 1-3일 (앱 복잡도에 따라 다름)

---

## 5단계. flutter build ipa 명령 (자동화)

Flutter 최신 버전에서는 명령어로 직접 IPA를 생성할 수 있습니다.

### 기본 IPA 빌드

```bash
flutter build ipa
```

**이 명령의 역할**:
- iOS 릴리즈 빌드
- Xcode Archive 생성
- .ipa 파일 생성

**생성 위치**:
```
프로젝트폴더/build/ios/ipa/앱이름.ipa
```

### 주의사항

- Xcode에서 **서명 및 팀 설정이 완료**되어 있어야 함
- `ios/Runner.xcworkspace`의 Signing & Capabilities 설정 필요
- 배포 옵션 세부 조절은 여전히 Xcode Organizer에서 가능

### 권장 워크플로우

**초보자**: Xcode Organizer 방식 권장 (더 명확한 제어)  
**고급 사용자**: `flutter build ipa` 명령 활용 (자동화)

---

## 6단계. TestFlight 베타 테스트

TestFlight를 통해 앱을 배포 전에 테스터들에게 배포할 수 있습니다.

### 6-1. TestFlight 업로드

1. **Archive 생성** 후 **App Store Connect**로 업로드
2. App Store Connect에서 **TestFlight** 탭으로 이동
3. 업로드된 빌드가 처리되면 (10-30분) 테스트 가능 상태가 됨

### 6-2. 내부 테스터 추가

1. **내부 테스터** 섹션에서
2. **+ 버튼** 클릭하여 이메일 주소 추가
3. 최대 100명까지 추가 가능
4. 테스터는 이메일로 초대장 수신

### 6-3. 외부 테스터 추가 (심사 필요)

1. **외부 테스터** 섹션에서
2. 테스터 그룹 생성
3. 최대 10,000명까지 추가 가능
4. **Apple 심사 필요** (보통 24-48시간)

### 6-4. 테스터 앱 설치

테스터는:
1. TestFlight 앱 다운로드 (App Store)
2. 초대 이메일의 링크 클릭
3. TestFlight에서 앱 설치 및 테스트

---

## 7단계. Windows 환경에서 iOS 빌드하기

**중요**: Windows PC에서는 직접 iOS `.ipa`를 만들 수 없습니다.

### 대안 방법

#### 방법 1: macOS 하드웨어 사용

- 맥북, 아이맥 등 macOS 기기 직접 사용
- 가장 확실하고 권장되는 방법

#### 방법 2: 클라우드 macOS 서비스

다음 서비스에서 macOS 인스턴스를 임대:

- **MacStadium** - 전용 맥 서버
- **MacinCloud** - 클라우드 맥 서비스
- **AWS EC2 Mac instances** - AWS의 macOS 인스턴스

#### 방법 3: CI/CD 서비스 활용

다음 서비스에서 자동 빌드:

- **Codemagic** - Flutter 전용 CI/CD
- **Bitrise** - 모바일 앱 CI/CD
- **AppCircle** - 모바일 앱 CI/CD
- **GitHub Actions** (macOS runner 사용)

**예시 - Codemagic**:
1. GitHub/GitLab에 코드 푸시
2. Codemagic에서 프로젝트 연결
3. iOS 빌드 설정
4. 자동으로 `.ipa` 생성 및 배포

---

## 8단계. 빌드 명령어 요약

### iOS 빌드 명령어

| 목적 | 명령어 | 결과물 위치 |
|------|--------|------------|
| 릴리즈 빌드 준비 | `flutter build ios --release` | `build/ios/iphoneos/Runner.app` |
| IPA 직접 생성 | `flutter build ipa` | `build/ios/ipa/앱이름.ipa` |
| 디버그 빌드 | `flutter build ios --debug` | `build/ios/iphoneos/Runner.app` |
| 프로파일 빌드 | `flutter build ios --profile` | `build/ios/iphoneos/Runner.app` |

### Xcode 작업

| 작업 | 방법 |
|------|------|
| 프로젝트 열기 | `open ios/Runner.xcworkspace` |
| Archive 생성 | Xcode: `Product > Archive` |
| IPA 내보내기 | Organizer: `Distribute App` |
| App Store 업로드 | Organizer: `Distribute App > App Store Connect` |

---

##  초보자용 빠른 시작

### 가장 빠른 iOS 앱 실행 (3단계)

1. **환경 확인**
   ```bash
   flutter doctor
   ```

2. **시뮬레이터 실행**
   ```bash
   open -a Simulator
   flutter run
   ```

3. **앱 실행 확인**
   - 시뮬레이터에서 앱이 실행되는지 확인

### App Store 배포용 최소 루틴

1. **Flutter 릴리즈 빌드**
   ```bash
   flutter build ios --release
   ```

2. **Xcode에서 설정 및 Archive**
   ```bash
   open ios/Runner.xcworkspace
   ```
   - Signing & Capabilities에서 Team 설정
   - `Product > Archive`

3. **App Store Connect 업로드**
   - Organizer에서 `Distribute App > App Store Connect`

---

##  실제 사용 시나리오

### 시나리오 1: 개발 중 테스트

**목적**: 개발 중 빠른 테스트

```bash
# 시뮬레이터 실행
open -a Simulator
flutter run
```

또는 실기기:
```bash
# USB로 iPhone 연결 후
flutter devices
flutter run -d "iPhone 이름"
```

### 시나리오 2: 내부 테스터에게 배포

**목적**: 제한된 사용자에게 테스트용 IPA 배포

1. `flutter build ios --release`
2. Xcode에서 Archive 생성
3. Organizer에서 `Distribute App > Ad Hoc`
4. 테스터 기기 UDID 등록
5. `.ipa` 파일 배포

### 시나리오 3: TestFlight 베타 테스트

**목적**: 많은 테스터에게 베타 버전 배포

1. `flutter build ios --release`
2. Xcode에서 Archive 생성
3. Organizer에서 `Distribute App > App Store Connect`
4. App Store Connect에서 TestFlight 설정
5. 테스터 초대

### 시나리오 4: 최종 App Store 배포

**목적**: 공식 App Store 출시

1. `flutter build ios --release`
2. Xcode에서 Archive 생성
3. Organizer에서 `Distribute App > App Store Connect`
4. App Store Connect에서 앱 정보 입력
5. 심사 제출

---

##  주의사항 및 트러블슈팅

### 빌드 실패 시 확인 사항

#### 1. Flutter 환경 확인

```bash
flutter doctor -v
```

모든 iOS 관련 항목이 체크되어 있는지 확인

#### 2. CocoaPods 설치 및 업데이트

```bash
cd ios
pod install
pod update
cd ..
```

#### 3. Xcode 캐시 정리

```bash
flutter clean
cd ios
rm -rf Pods Podfile.lock
pod install
cd ..
flutter pub get
```

#### 4. Xcode 재설정

- Xcode > Preferences > Locations
- Command Line Tools가 올바른 Xcode 버전 선택되어 있는지 확인

### 서명 오류 해결

#### "No signing certificate found"

**해결 방법**:
1. Xcode에서 `Signing & Capabilities` 탭 확인
2. **Team** 선택 (Apple ID 로그인 필요)
3. **Automatically manage signing** 체크
4. Xcode가 자동으로 인증서 생성

#### "Bundle identifier is already in use"

**해결 방법**:
1. `Bundle Identifier`를 고유한 값으로 변경
2. 형식: `com.회사명.앱이름`
3. App Store Connect에서 이미 사용 중인 ID는 사용 불가

#### "Provisioning profile doesn't match"

**해결 방법**:
1. Xcode에서 `Automatically manage signing` 체크
2. Xcode가 자동으로 프로비저닝 프로파일 생성/업데이트
3. 또는 수동으로 프로비저닝 프로파일 다운로드

### Archive 실패 시

#### "No devices connected"

**해결 방법**:
- Xcode 상단에서 `Any iOS Device (arm64)` 선택
- 시뮬레이터가 아닌 실제 디바이스 타깃 선택

#### "Code signing is required"

**해결 방법**:
1. `Signing & Capabilities`에서 Team 설정
2. Bundle Identifier 설정
3. `Automatically manage signing` 체크

### 업로드 실패 시

#### "Invalid Bundle"

**해결 방법**:
- 앱 아이콘 확인 (1024x1024 필수)
- Info.plist 설정 확인
- 최소 iOS 버전 확인

#### "Missing compliance"

**해결 방법**:
- App Store Connect에서 Export Compliance 정보 입력
- 암호화 사용 여부 확인

---

##  자동화 스크립트 예제

### macOS - 빌드 스크립트

`build-ios.sh` 파일 생성:

```bash
#!/bin/bash

echo "=== Flutter iOS 빌드 시작 ==="

# Flutter 환경 확인
flutter doctor

# 클린 빌드
echo "=== 클린 빌드 ==="
flutter clean
flutter pub get

# iOS 의존성 설치
echo "=== CocoaPods 설치 ==="
cd ios
pod install
cd ..

# iOS 릴리즈 빌드
echo "=== iOS 릴리즈 빌드 ==="
flutter build ios --release

echo "=== 빌드 완료 ==="
echo "다음 단계: Xcode에서 Archive 생성"
echo "명령어: open ios/Runner.xcworkspace"
```

실행 권한 부여 및 실행:
```bash
chmod +x build-ios.sh
./build-ios.sh
```

### IPA 자동 빌드 스크립트

`build-ipa.sh` 파일 생성:

```bash
#!/bin/bash

echo "=== Flutter IPA 빌드 시작 ==="

# 환경 확인
flutter doctor

# 클린 빌드
flutter clean
flutter pub get

# CocoaPods
cd ios
pod install
cd ..

# IPA 빌드
flutter build ipa

echo "=== IPA 빌드 완료 ==="
echo "위치: build/ios/ipa/"
```

---

##  추가 참고 자료

- [Flutter 공식 문서 - iOS 배포](https://docs.flutter.dev/deployment/ios)
- [Apple Developer Documentation](https://developer.apple.com/documentation/)
- [App Store Connect 가이드](https://developer.apple.com/app-store-connect/)
- [TestFlight 베타 테스트 가이드](https://developer.apple.com/testflight/)

---

##  체크리스트

iOS 빌드 전 확인 사항:

### 환경 설정
- [ ] macOS 환경 확인
- [ ] Xcode 설치 완료
- [ ] Flutter 환경 설정 완료 (`flutter doctor` 통과)
- [ ] Apple ID 계정 준비
- [ ] 개발자 계정 준비 (App Store 배포 시 유료 계정 필요)

### 프로젝트 설정
- [ ] `ios/Runner.xcworkspace` 파일 존재 확인
- [ ] CocoaPods 설치 완료 (`pod install`)
- [ ] Bundle Identifier 설정 (고유한 값)
- [ ] 앱 버전 및 빌드 번호 설정

### 서명 설정
- [ ] Xcode에서 Team 선택 완료
- [ ] Signing & Capabilities 설정 완료
- [ ] Automatically manage signing 활성화 (또는 수동 설정)

### 빌드 및 배포
- [ ] Flutter 릴리즈 빌드 성공 (`flutter build ios --release`)
- [ ] Xcode Archive 생성 성공
- [ ] .ipa 파일 생성 또는 App Store Connect 업로드 완료
- [ ] App Store Connect에서 앱 정보 입력 (배포 시)

---

##  Android vs iOS 비교

| 항목 | Android (APK) | iOS (IPA) |
|------|---------------|-----------|
| **필수 환경** | Windows/macOS/Linux | macOS만 가능 |
| **개발 도구** | Android Studio (선택) | Xcode (필수) |
| **계정 비용** | 무료 | 무료 (테스트) / $99/년 (배포) |
| **빌드 명령어** | `flutter build apk` | `flutter build ios` + Xcode Archive |
| **배포 플랫폼** | Google Play Store | App Store |
| **심사** | 자동화 (빠름) | 수동 심사 (1-3일) |
| **서명** | 키스토어 (한 번 생성) | 인증서 + 프로비저닝 프로파일 (자동 관리) |

---

**마지막 업데이트**: 2024년

