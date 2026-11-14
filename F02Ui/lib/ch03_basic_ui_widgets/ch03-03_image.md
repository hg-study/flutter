# ch03-03: Image - 코드 설명

##  학습 목표
- Image 위젯의 기본 개념
- Image.asset 사용법
- Image.network 사용법
- 이미지 크기와 fit 속성

---

##  중요 코드 설명

### 1. Image.asset (로컬 이미지)

```dart
Image.asset("assets/images/photo.jpg")
```

**핵심 포인트:**
- 프로젝트 내 assets 폴더의 이미지 사용
- `pubspec.yaml`에 assets 등록 필요

### 2. Image.network (네트워크 이미지)

```dart
Image.network("https://example.com/image.jpg")
```

**핵심 포인트:**
- 인터넷에서 이미지 로드
- 네트워크 연결 필요

### 3. 이미지 크기와 fit

```dart
Image.asset(
  "assets/images/photo.jpg",
  width: 200,
  height: 200,
  fit: BoxFit.cover,
)
```

**핵심 포인트:**
- `width`, `height`: 크기 지정
- `fit`: 이미지 맞춤 방식

---

##  각 라인별 상세 설명

### 예제 1: 기본 이미지 영역

```67:78:F02Ui/lib/ch03_basic_ui_widgets/ch03-03_image.dart
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.image, size: 80, color: Colors.grey),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 68-69 | 이미지 영역 크기 지정 |
| 70-73 | 배경 스타일 |
| 74 | 플레이스홀더 아이콘 |

**실제 사용:**
```dart
Image.asset("assets/images/photo.jpg")
```

---

### 예제 5: 이미지 사용 예시 코드

```175:226:F02Ui/lib/ch03_basic_ui_widgets/ch03-03_image.dart
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '로컬 이미지 (assets):',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Image.asset("assets/images/photo.jpg")',
                    style: TextStyle(fontFamily: 'monospace', fontSize: 12),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '네트워크 이미지:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Image.network("https://example.com/image.jpg")',
                    style: TextStyle(fontFamily: 'monospace', fontSize: 12),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '크기 지정:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Image.asset(\n  "assets/images/photo.jpg",\n  width: 200,\n  height: 200,\n)',
                    style: TextStyle(fontFamily: 'monospace', fontSize: 12),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'fit 속성:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'BoxFit.cover - 영역을 채움\nBoxFit.contain - 비율 유지하며 맞춤\nBoxFit.fill - 영역에 맞춤',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
```

---

##  핵심 개념 정리

### BoxFit 종류

| 종류 | 설명 |
|------|------|
| `cover` | 영역을 채우며 비율 유지 (잘릴 수 있음) |
| `contain` | 비율 유지하며 영역에 맞춤 |
| `fill` | 영역에 맞춤 (비율 무시) |
| `fitWidth` | 너비에 맞춤 |
| `fitHeight` | 높이에 맞춤 |

### assets 설정 (pubspec.yaml)

```yaml
flutter:
  assets:
    - assets/images/
```

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] Image.asset을 사용할 수 있습니다
- [ ] Image.network를 사용할 수 있습니다
- [ ] 이미지 크기를 지정할 수 있습니다
- [ ] fit 속성을 이해했습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch03_basic_ui_widgets/ch03-03_image.dart
```

