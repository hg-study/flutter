# ch04-01: 갤러리에서 이미지 선택 - 코드 설명

##  학습 목표
- ImagePicker 기본 사용법
- 갤러리에서 이미지 선택
- 이미지 표시

---

##  중요 코드 설명

### ImagePicker 사용

```dart
final ImagePicker _picker = ImagePicker();

final XFile? image = await _picker.pickImage(
  source: ImageSource.gallery,
  maxWidth: 800,
  maxHeight: 800,
  imageQuality: 85,
);
```

**핵심 포인트:**
- `ImageSource.gallery`: 갤러리에서 선택
- `maxWidth`, `maxHeight`: 이미지 크기 제한
- `imageQuality`: 이미지 품질 (0-100)

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] ImagePicker를 사용할 수 있습니다
- [ ] 갤러리에서 이미지를 선택할 수 있습니다

---

##  실행 방법

```bash
cd F03Advanced
flutter run lib/ch04_image_media/ch04-01_image_picker_gallery.dart
```

