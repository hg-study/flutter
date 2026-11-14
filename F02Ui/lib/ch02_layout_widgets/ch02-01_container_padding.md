# ch02-01: Container와 Padding - 코드 설명

##  학습 목표
- Container의 개념과 사용법
- decoration 속성 이해
- Padding의 개념과 사용법
- EdgeInsets의 다양한 사용법

---

##  중요 코드 설명

### 1. Container 기본 구조

```dart
Container(
  width: 200,
  height: 100,
  color: Colors.blue,
  child: Center(
    child: Text('기본 Container'),
  ),
)
```

**핵심 포인트:**
- `width`, `height`: 크기 지정
- `color`: 배경색 (간단한 경우)
- `decoration`: 복잡한 스타일 (color와 동시 사용 불가)
- `child`: 자식 위젯

### 2. decoration 사용

```dart
Container(
  decoration: BoxDecoration(
    color: Colors.green,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.green.shade700, width: 2),
  ),
)
```

**핵심 포인트:**
- `BoxDecoration`: 복잡한 스타일 설정
- `borderRadius`: 둥근 모서리
- `border`: 테두리
- `boxShadow`: 그림자 효과

### 3. Padding 기본 구조

```dart
Padding(
  padding: EdgeInsets.all(20.0),
  child: Container(...),
)
```

**핵심 포인트:**
- `EdgeInsets`: 여백 크기 지정
- Container보다 간단하게 여백 설정
- 자식 위젯 주변에 여백 추가

---

##  각 라인별 상세 설명

### Container 예제 1: 기본

```76:86:F02Ui/lib/ch02_layout_widgets/ch02-01_container_padding.dart
            Container(
              width: 200,
              height: 100,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  '기본 Container',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 76 | `Container` - 위젯을 감싸는 박스 |
| 77 | `width: 200` - 가로 크기 200px |
| 78 | `height: 100` - 세로 크기 100px |
| 79 | `color: Colors.blue` - 배경색 (간단한 경우) |
| 80 | `child: Center` - 자식 위젯 (중앙 정렬) |
| 81-85 | `Text` - 표시할 텍스트 |

**주의:** `color`와 `decoration`은 동시에 사용할 수 없습니다.

---

### Container 예제 2: decoration 사용

```100:114:F02Ui/lib/ch02_layout_widgets/ch02-01_container_padding.dart
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green.shade700, width: 2),
              ),
              child: const Center(
                child: Text(
                  '둥근 모서리',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 100 | `Container` - 위젯 박스 |
| 103 | `BoxDecoration` - 복잡한 스타일 설정 |
| 104 | `color: Colors.green` - 배경색 (decoration 내부) |
| 105 | `borderRadius` - 둥근 모서리 설정 |
| 105 | `BorderRadius.circular(16)` - 모든 모서리를 16px로 둥글게 |
| 106 | `border` - 테두리 설정 |
| 106 | `Border.all()` - 모든 방향에 테두리 |
| 106 | `color: Colors.green.shade700` - 테두리 색상 (어두운 초록) |
| 106 | `width: 2` - 테두리 두께 2px |

**핵심:** `decoration`을 사용하면 `color` 속성은 사용할 수 없습니다.

---

### Container 예제 3: 그림자 효과

```128:149:F02Ui/lib/ch02_layout_widgets/ch02-01_container_padding.dart
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  '그림자 효과',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 134 | `boxShadow` - 그림자 효과 리스트 |
| 135-140 | `BoxShadow` - 그림자 설정 |
| 136 | `color` - 그림자 색상 |
| 136 | `withOpacity(0.5)` - 투명도 50% |
| 137 | `spreadRadius: 2` - 그림자 확산 범위 |
| 138 | `blurRadius: 5` - 그림자 흐림 정도 |
| 139 | `offset: Offset(0, 3)` - 그림자 위치 (x: 0, y: 3) |

**팁:** 여러 개의 그림자를 추가하려면 `boxShadow` 리스트에 여러 `BoxShadow`를 추가합니다.

---

### Padding 예제 1: 기본

```192:207:F02Ui/lib/ch02_layout_widgets/ch02-01_container_padding.dart
            Container(
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  color: Colors.orange,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Padding 예제',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 192 | 외부 `Container` - 배경 (회색) |
| 194 | `Padding` - 여백 추가 위젯 |
| 195 | `padding: EdgeInsets.all(20.0)` - 모든 방향 20px 여백 |
| 196 | 내부 `Container` - 오렌지색 박스 |
| 198 | 내부 `Padding` - 텍스트 주변 여백 |
| 199 | `padding: EdgeInsets.all(10.0)` - 모든 방향 10px 여백 |

**핵심:** Padding은 자식 위젯 주변에 여백을 추가합니다.

---

### Padding 예제 2: 다양한 EdgeInsets

```221:267:F02Ui/lib/ch02_layout_widgets/ch02-01_container_padding.dart
            Column(
              children: [
                // EdgeInsets.all
                Container(
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      color: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('EdgeInsets.all(16)', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // EdgeInsets.symmetric
                Container(
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Container(
                      color: Colors.green,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('EdgeInsets.symmetric(horizontal: 20, vertical: 10)', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // EdgeInsets.only
                Container(
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10, right: 10, bottom: 20),
                    child: Container(
                      color: Colors.blue,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('EdgeInsets.only(left: 30, top: 10, right: 10, bottom: 20)', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 227 | `EdgeInsets.all(16.0)` - 모든 방향 16px |
| 242 | `EdgeInsets.symmetric()` - 대칭 여백 |
| 242 | `horizontal: 20` - 좌우 20px |
| 242 | `vertical: 10` - 상하 10px |
| 257 | `EdgeInsets.only()` - 방향별 개별 설정 |
| 257 | `left: 30` - 왼쪽 30px |
| 257 | `top: 10` - 위 10px |
| 257 | `right: 10` - 오른쪽 10px |
| 257 | `bottom: 20` - 아래 20px |

**EdgeInsets 종류:**
- `EdgeInsets.all(value)` - 모든 방향 동일
- `EdgeInsets.symmetric(horizontal: x, vertical: y)` - 대칭 여백
- `EdgeInsets.only(left: x, top: y, right: z, bottom: w)` - 방향별 개별 설정
- `EdgeInsets.fromLTRB(left, top, right, bottom)` - 좌상우하 순서

---

##  핵심 개념 정리

### Container vs Padding

| 특징 | Container | Padding |
|------|-----------|---------|
| 용도 | 스타일 + 여백 | 여백만 |
| 복잡도 | 복잡 | 간단 |
| 사용 시나리오 | 스타일이 필요할 때 | 여백만 필요할 때 |

### color vs decoration

```dart
//  간단한 경우: color 사용
Container(
  color: Colors.blue,
  child: Text('...'),
)

//  복잡한 경우: decoration 사용
Container(
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  ),
  child: Text('...'),
)

//  동시 사용 불가
Container(
  color: Colors.blue,  // 
  decoration: BoxDecoration(...),  // 
)
```

### Container의 padding vs Padding 위젯

```dart
// 방법 1: Container의 padding 속성
Container(
  padding: EdgeInsets.all(16),
  child: Text('...'),
)

// 방법 2: Padding 위젯
Padding(
  padding: EdgeInsets.all(16),
  child: Text('...'),
)
```

**차이점:**
- Container의 padding: Container 내부에 여백
- Padding 위젯: 자식 위젯 주변에 여백

---

##  실전 팁

### 1. Container 사용 가이드

```dart
//  간단한 스타일: color 사용
Container(
  color: Colors.blue,
  child: Text('...'),
)

//  복잡한 스타일: decoration 사용
Container(
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(...),
    boxShadow: [...],
  ),
  child: Text('...'),
)
```

### 2. Padding 사용 가이드

```dart
//  간단한 여백: EdgeInsets.all
Padding(
  padding: EdgeInsets.all(16),
  child: Text('...'),
)

//  대칭 여백: EdgeInsets.symmetric
Padding(
  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  child: Text('...'),
)

//  개별 여백: EdgeInsets.only
Padding(
  padding: EdgeInsets.only(left: 30, top: 10),
  child: Text('...'),
)
```

### 3. 그림자 효과

```dart
boxShadow: [
  BoxShadow(
    color: Colors.grey.withOpacity(0.5),  // 그림자 색상
    spreadRadius: 2,  // 확산 범위
    blurRadius: 5,    // 흐림 정도
    offset: Offset(0, 3),  // 위치 (x, y)
  ),
]
```

---

##  주의사항

### 1. color와 decoration 동시 사용 금지

```dart
//  잘못된 예
Container(
  color: Colors.blue,
  decoration: BoxDecoration(...),  // 에러 발생!
)

//  올바른 예
Container(
  decoration: BoxDecoration(
    color: Colors.blue,  // decoration 내부에서 color 설정
    ...
  ),
)
```

### 2. Container의 크기 제약

```dart
//  명시적 크기 지정
Container(
  width: 200,
  height: 100,
  ...
)

//  부모 크기에 맞춤
Container(
  width: double.infinity,  // 전체 너비
  height: 100,
  ...
)
```

### 3. Padding의 중첩

```dart
//  필요시 중첩 가능
Padding(
  padding: EdgeInsets.all(20),
  child: Padding(
    padding: EdgeInsets.all(10),
    child: Text('...'),
  ),
)
```

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] Container의 기본 사용법을 이해했습니다
- [ ] decoration을 사용할 수 있습니다
- [ ] borderRadius로 둥근 모서리를 만들 수 있습니다
- [ ] boxShadow로 그림자 효과를 만들 수 있습니다
- [ ] Padding 위젯을 사용할 수 있습니다
- [ ] EdgeInsets의 다양한 사용법을 이해했습니다
- [ ] color와 decoration의 차이를 이해했습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch02_layout_widgets/ch02-01_container_padding.dart
```

##  다음 단계

이 예제를 완료했다면 다음으로 진행하세요:
- **ch02-02**: Row와 Column

