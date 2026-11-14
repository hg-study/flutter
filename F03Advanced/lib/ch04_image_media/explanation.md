# -------------------------------------------
# 04단계: 이미지 & 미디어
# -------------------------------------------

## 학습 목표

이 단계에서는 Flutter의 이미지와 미디어 처리를 학습합니다:
- image_picker 패키지
- 갤러리에서 이미지 선택
- 카메라로 사진 촬영
- 여러 이미지 선택
- 이미지 표시 및 처리

---

# -------------------------------------------
# 1. image_picker 패키지
# -------------------------------------------

## 1.1 패키지 추가

`pubspec.yaml`에 추가:
```yaml
dependencies:
  image_picker: ^1.0.7
```

## 1.2 권한 설정

**Android (android/app/src/main/AndroidManifest.xml):**
```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```

**iOS (ios/Runner/Info.plist):**
```xml
<key>NSCameraUsageDescription</key>
<string>카메라 사용 권한이 필요합니다</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>갤러리 접근 권한이 필요합니다</string>
```

---

# -------------------------------------------
# 2. 갤러리에서 이미지 선택
# -------------------------------------------

## 2.1 기본 사용법

```dart
final ImagePicker picker = ImagePicker();

final XFile? image = await picker.pickImage(
  source: ImageSource.gallery,
);
```

## 2.2 옵션 설정

```dart
final XFile? image = await picker.pickImage(
  source: ImageSource.gallery,
  maxWidth: 800,      // 최대 너비
  maxHeight: 800,     // 최대 높이
  imageQuality: 85,   // 품질 (0-100)
);
```

## 2.3 이미지 표시

```dart
if (image != null) {
  Image.file(File(image.path))
}
```

---

# -------------------------------------------
# 3. 카메라로 사진 촬영
# -------------------------------------------

## 3.1 기본 사용법

```dart
final XFile? image = await picker.pickImage(
  source: ImageSource.camera,
);
```

## 3.2 옵션 설정

```dart
final XFile? image = await picker.pickImage(
  source: ImageSource.camera,
  maxWidth: 1920,
  maxHeight: 1080,
  imageQuality: 90,
);
```

---

# -------------------------------------------
# 4. 여러 이미지 선택
# -------------------------------------------

## 4.1 기본 사용법

```dart
final List<XFile> images = await picker.pickMultiImage();
```

## 4.2 옵션 설정

```dart
final List<XFile> images = await picker.pickMultiImage(
  maxWidth: 800,
  maxHeight: 800,
  imageQuality: 85,
);
```

---

# -------------------------------------------
# 5. 이미지 정보
# -------------------------------------------

## 5.1 XFile 속성

```dart
image.path      // 파일 경로
image.name      // 파일 이름
image.length    // 파일 크기 (bytes)
image.mimeType  // MIME 타입
```

## 5.2 이미지 읽기

```dart
final bytes = await image.readAsBytes();
final path = image.path;
```

---

# -------------------------------------------
# 6. 실전 예제
# -------------------------------------------

## 예제 1: 프로필 사진 선택

```dart
Future<void> _selectProfileImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(
    source: ImageSource.gallery,
    maxWidth: 300,
    maxHeight: 300,
  );
  
  if (image != null) {
    setState(() {
      _profileImage = image;
    });
  }
}
```

## 예제 2: 이미지 갤러리

```dart
Future<void> _selectMultipleImages() async {
  final ImagePicker picker = ImagePicker();
  final List<XFile> images = await picker.pickMultiImage();
  
  if (images.isNotEmpty) {
    setState(() {
      _galleryImages = images;
    });
  }
}
```

---

# -------------------------------------------
# 체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] image_picker 패키지를 추가할 수 있습니다
- [ ] 권한을 설정할 수 있습니다
- [ ] 갤러리에서 이미지를 선택할 수 있습니다
- [ ] 카메라로 사진을 촬영할 수 있습니다
- [ ] 여러 이미지를 선택할 수 있습니다
- [ ] 이미지를 표시할 수 있습니다
- [ ] 이미지 정보를 가져올 수 있습니다

---

# -------------------------------------------
# 실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [run.md](run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F03Advanced
flutter pub get
flutter run lib/ch04_image_media/main.dart
```

---

# -------------------------------------------
# 다음 단계
# -------------------------------------------

04단계를 완료했다면 다음 단계로 진행하세요:
- **05단계: 외부 패키지 사용** - http 등

## 전체 커리큘럼

1. 완료 **01단계: 상태 관리** - Provider
2. 완료 **02단계: 비동기 처리** - FutureBuilder, StreamBuilder
3. 완료 **03단계: 로컬 저장소** - SharedPreferences, File I/O
4. 완료 **04단계: 이미지 & 미디어** - image_picker (현재 단계)
5. 다음 **05단계: 외부 패키지 사용** - http 등

---

# -------------------------------------------
# 팁
# -------------------------------------------

1. **권한 처리**
   - Android/iOS 권한 설정 필수
   - 런타임 권한 요청 (Android 6.0+)
   - 사용자에게 권한 필요 이유 설명

2. **이미지 최적화**
   - maxWidth, maxHeight로 크기 제한
   - imageQuality로 품질 조절
   - 메모리 사용량 고려

3. **실전 활용**
   - 프로필 사진: 단일 이미지
   - 갤러리: 여러 이미지
   - 촬영: 카메라 사용

4. **주의사항**
   - 에러 처리 필수
   - 권한 거부 시 처리
   - 파일 크기 제한

