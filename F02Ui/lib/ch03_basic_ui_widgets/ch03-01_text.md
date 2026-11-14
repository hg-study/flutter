# ch03-01: Text - 코드 설명

##  학습 목표
- Text 위젯의 기본 사용법
- TextStyle으로 스타일 설정
- 텍스트 정렬 방법
- RichText와 TextSpan 사용

---

##  중요 코드 설명

### 1. Text 기본 구조

```dart
Text('기본 텍스트')
```

**핵심 포인트:**
- 가장 간단한 텍스트 표시
- 기본 스타일 사용

### 2. TextStyle 사용

```dart
Text(
  '큰 텍스트',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
)
```

**핵심 포인트:**
- `fontSize`: 글자 크기
- `fontWeight`: 글자 굵기
- `color`: 글자 색상
- `fontStyle`: 이탤릭체 등

### 3. RichText (TextSpan)

```dart
Text.rich(
  TextSpan(
    text: '일반 텍스트 ',
    children: [
      TextSpan(
        text: '굵은 텍스트',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  ),
)
```

**핵심 포인트:**
- 여러 스타일을 한 텍스트에 적용
- `TextSpan`으로 부분별 스타일 지정

---

##  각 라인별 상세 설명

### 예제 1: 기본 Text

```73:73:F02Ui/lib/ch03_basic_ui_widgets/ch03-01_text.dart
                  const Text('기본 텍스트'),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 73 | `Text` - 기본 텍스트 위젯 |
| 73 | `'기본 텍스트'` - 표시할 문자열 |

---

### 예제 2: 스타일이 있는 Text

```75:88:F02Ui/lib/ch03_basic_ui_widgets/ch03-01_text.dart
                  const Text(
                    '큰 텍스트',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '작은 텍스트',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '이탤릭체 텍스트',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 76 | `'큰 텍스트'` - 표시할 텍스트 |
| 77 | `TextStyle` - 텍스트 스타일 |
| 77 | `fontSize: 24` - 글자 크기 24px |
| 77 | `fontWeight: FontWeight.bold` - 굵게 |
| 82 | `fontSize: 12` - 작은 글자 |
| 87 | `fontStyle: FontStyle.italic` - 이탤릭체 |

---

### 예제 3: 색상이 있는 Text

```80:88:F02Ui/lib/ch03_basic_ui_widgets/ch03-01_text.dart
                  const Text(
                    '파란색 텍스트',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '빨간색 텍스트',
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '초록색 텍스트',
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 82 | `color: Colors.blue` - 파란색 |
| 87 | `color: Colors.red` - 빨간색 |
| 92 | `color: Colors.green` - 초록색 |

---

### 예제 4: 여러 줄 Text

```85:88:F02Ui/lib/ch03_basic_ui_widgets/ch03-01_text.dart
                  const Text(
                    '여러 줄 텍스트\n두 번째 줄\n세 번째 줄',
                    style: TextStyle(fontSize: 14),
                  ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 86 | `\n` - 줄바꿈 문자 |

---

### 예제 5: 정렬이 있는 Text

```108:135:F02Ui/lib/ch03_basic_ui_widgets/ch03-01_text.dart
            Container(
              width: double.infinity,
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(8),
              child: const Text(
                '왼쪽 정렬 (기본값)',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(8),
              child: const Text(
                '중앙 정렬',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(8),
              child: const Text(
                '오른쪽 정렬',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 14),
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 113 | `textAlign: TextAlign.left` - 왼쪽 정렬 |
| 124 | `textAlign: TextAlign.center` - 중앙 정렬 |
| 135 | `textAlign: TextAlign.right` - 오른쪽 정렬 |

**주의:** `textAlign`은 `width`가 지정된 경우에만 작동합니다.

---

### 예제 7: RichText (TextSpan)

```175:196:F02Ui/lib/ch03_basic_ui_widgets/ch03-01_text.dart
            const Text.rich(
              TextSpan(
                text: '일반 텍스트 ',
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: '굵은 텍스트 ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                    text: '빨간색 텍스트',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 175 | `Text.rich` - RichText 생성 |
| 176 | `TextSpan` - 텍스트 스팬 |
| 177 | `text` - 기본 텍스트 |
| 178 | `style` - 기본 스타일 |
| 179 | `children` - 추가 텍스트 스팬들 |
| 180-186 | 첫 번째 TextSpan (굵은 텍스트) |
| 187-194 | 두 번째 TextSpan (빨간색 텍스트) |

---

##  핵심 개념 정리

### TextStyle 주요 속성

| 속성 | 설명 | 예시 |
|------|------|------|
| `fontSize` | 글자 크기 | `fontSize: 18` |
| `fontWeight` | 글자 굵기 | `FontWeight.bold` |
| `color` | 글자 색상 | `Colors.blue` |
| `fontStyle` | 글자 스타일 | `FontStyle.italic` |
| `decoration` | 장식 | `TextDecoration.underline` |
| `letterSpacing` | 글자 간격 | `letterSpacing: 1.5` |

### TextAlign 종류

- `TextAlign.left`: 왼쪽 정렬 (기본값)
- `TextAlign.center`: 중앙 정렬
- `TextAlign.right`: 오른쪽 정렬
- `TextAlign.justify`: 양쪽 정렬

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] Text의 기본 사용법을 이해했습니다
- [ ] TextStyle으로 스타일을 설정할 수 있습니다
- [ ] 텍스트 정렬을 할 수 있습니다
- [ ] RichText와 TextSpan을 사용할 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch03_basic_ui_widgets/ch03-01_text.dart
```

