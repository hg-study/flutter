# ch03-04: Button - 코드 설명

##  학습 목표
- ElevatedButton 사용법
- TextButton 사용법
- OutlinedButton 사용법
- IconButton 사용법
- 버튼 스타일 커스터마이징

---

##  중요 코드 설명

### 1. ElevatedButton

```dart
ElevatedButton(
  onPressed: () {},
  child: Text('ElevatedButton'),
)
```

**핵심 포인트:**
- 강조된 버튼
- 그림자 효과
- 주요 액션에 사용

### 2. TextButton

```dart
TextButton(
  onPressed: () {},
  child: Text('TextButton'),
)
```

**핵심 포인트:**
- 평면 스타일
- 보조 액션에 사용

### 3. OutlinedButton

```dart
OutlinedButton(
  onPressed: () {},
  child: Text('OutlinedButton'),
)
```

**핵심 포인트:**
- 테두리만 있는 버튼
- 중간 강조

---

##  각 라인별 상세 설명

### 예제 1: ElevatedButton

```67:85:F02Ui/lib/ch03_basic_ui_widgets/ch03-04_button.dart
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('ElevatedButton'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: null, // 비활성화
                  child: const Text('비활성화된 버튼'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('초록색 버튼'),
                ),
              ],
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 69 | `ElevatedButton` - 강조된 버튼 |
| 70 | `onPressed` - 클릭 이벤트 |
| 74 | `onPressed: null` - 비활성화 |
| 79-82 | `style` - 버튼 스타일 커스터마이징 |

---

### 예제 5: 버튼 with 아이콘

```157:175:F02Ui/lib/ch03_basic_ui_widgets/ch03-04_button.dart
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const Text('다운로드'),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  label: const Text('공유'),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                  label: const Text('삭제'),
                ),
              ],
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 70 | `ElevatedButton.icon` - 아이콘과 텍스트 버튼 |
| 72 | `icon` - 아이콘 |
| 73 | `label` - 텍스트 |

---

##  핵심 개념 정리

### 버튼 종류 비교

| 버튼 | 특징 | 사용 시나리오 |
|------|------|-------------|
| ElevatedButton | 강조, 그림자 | 주요 액션 |
| TextButton | 평면 | 보조 액션 |
| OutlinedButton | 테두리 | 중간 강조 |
| IconButton | 아이콘만 | 툴바, 앱바 |

### 버튼 비활성화

```dart
ElevatedButton(
  onPressed: null,  // null이면 비활성화
  child: Text('버튼'),
)
```

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] ElevatedButton을 사용할 수 있습니다
- [ ] TextButton을 사용할 수 있습니다
- [ ] OutlinedButton을 사용할 수 있습니다
- [ ] IconButton을 사용할 수 있습니다
- [ ] 버튼 스타일을 커스터마이징할 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch03_basic_ui_widgets/ch03-04_button.dart
```

