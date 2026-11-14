# ch03-02: Icon - 코드 설명

##  학습 목표
- Icon 위젯의 기본 사용법
- IconButton 사용법
- 아이콘 크기와 색상 설정
- 상태에 따른 아이콘 변경

---

##  중요 코드 설명

### 1. Icon 기본 구조

```dart
Icon(Icons.home, size: 40, color: Colors.blue)
```

**핵심 포인트:**
- `Icons`: Material Icons 사용
- `size`: 아이콘 크기
- `color`: 아이콘 색상

### 2. IconButton

```dart
IconButton(
  icon: Icon(Icons.favorite),
  onPressed: () {},
)
```

**핵심 포인트:**
- 클릭 가능한 아이콘
- `onPressed`: 클릭 이벤트 핸들러

---

##  각 라인별 상세 설명

### 예제 1: 기본 Icon

```67:76:F02Ui/lib/ch03_basic_ui_widgets/ch03-02_icon.dart
            const Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                Icon(Icons.home),
                Icon(Icons.favorite),
                Icon(Icons.star),
                Icon(Icons.settings),
                Icon(Icons.search),
                Icon(Icons.person),
              ],
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 67 | `Wrap` - 여러 아이콘을 배치 |
| 70-75 | 다양한 `Icon` 위젯들 |

---

### 예제 2: 크기가 다른 Icon

```84:95:F02Ui/lib/ch03_basic_ui_widgets/ch03-02_icon.dart
            const Row(
              children: [
                Icon(Icons.star, size: 20),
                SizedBox(width: 16),
                Icon(Icons.star, size: 40),
                SizedBox(width: 16),
                Icon(Icons.star, size: 60),
                SizedBox(width: 16),
                Icon(Icons.star, size: 80),
              ],
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 86 | `size: 20` - 작은 아이콘 |
| 88 | `size: 40` - 중간 아이콘 |
| 90 | `size: 60` - 큰 아이콘 |
| 92 | `size: 80` - 매우 큰 아이콘 |

---

### 예제 4: IconButton

```118:142:F02Ui/lib/ch03_basic_ui_widgets/ch03-02_icon.dart
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                IconButton(
                  icon: const Icon(Icons.thumb_up),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.favorite),
                  color: Colors.red,
                  iconSize: 40,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.blue.shade100,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border),
                  color: _isLiked ? Colors.red : Colors.grey,
                  iconSize: 40,
                  onPressed: _toggleLike,
                ),
              ],
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 121 | `IconButton` - 클릭 가능한 아이콘 |
| 122 | `icon` - 표시할 아이콘 |
| 123 | `onPressed` - 클릭 이벤트 |
| 127 | `color` - 아이콘 색상 |
| 128 | `iconSize` - 아이콘 크기 |
| 133-135 | `style` - 버튼 스타일 |
| 137-140 | 상태에 따른 아이콘 변경 |

---

##  핵심 개념 정리

### Icon vs IconButton

| 특징 | Icon | IconButton |
|------|------|------------|
| 클릭 가능 |  |  |
| onPressed | 없음 | 있음 |
| 사용 시나리오 | 표시만 | 클릭 액션 |

### 상태에 따른 아이콘 변경

```dart
IconButton(
  icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border),
  color: _isLiked ? Colors.red : Colors.grey,
  onPressed: _toggleLike,
)
```

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] Icon의 기본 사용법을 이해했습니다
- [ ] IconButton을 사용할 수 있습니다
- [ ] 아이콘 크기와 색상을 설정할 수 있습니다
- [ ] 상태에 따라 아이콘을 변경할 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch03_basic_ui_widgets/ch03-02_icon.dart
```

