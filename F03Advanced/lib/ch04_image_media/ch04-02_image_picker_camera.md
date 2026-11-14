# ch04-02: 카메라로 사진 촬영 - 코드 설명

##  학습 목표
- 카메라로 사진 촬영
- ImageSource.camera 사용
- 카메라 권한 처리

---

##  중요 코드 설명

### 카메라로 촬영

```dart
final XFile? image = await _picker.pickImage(
  source: ImageSource.camera,
  maxWidth: 800,
  maxHeight: 800,
  imageQuality: 85,
);
```

**핵심 포인트:**
- `ImageSource.camera`: 카메라 사용
- 카메라 권한 필요 (AndroidManifest.xml, Info.plist)

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] 카메라로 사진을 촬영할 수 있습니다
- [ ] 카메라 권한을 처리할 수 있습니다

---

##  실행 방법

```bash
cd F03Advanced
flutter run lib/ch04_image_media/ch04-02_image_picker_camera.dart
```

