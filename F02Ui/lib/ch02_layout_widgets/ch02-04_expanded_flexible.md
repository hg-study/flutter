# ch02-04: Expanded와 Flexible - 코드 설명

##  학습 목표
- Expanded의 개념과 사용법
- Flexible의 개념과 사용법
- flex 속성 이해
- Expanded vs Flexible 차이

---

##  중요 코드 설명

### 1. Expanded 기본 구조

```dart
Row(
  children: [
    Expanded(
      flex: 1,
      child: Container(...),
    ),
    Expanded(
      flex: 2,
      child: Container(...),
    ),
  ],
)
```

**핵심 포인트:**
- Row/Column 내에서 남은 공간을 차지
- `flex` 속성으로 비율 조절
- 항상 사용 가능한 모든 공간을 차지

### 2. Flexible 기본 구조

```dart
Row(
  children: [
    Flexible(
      flex: 1,
      child: Container(...),
    ),
    Container(width: 100, ...),  // 고정 크기
    Flexible(
      flex: 2,
      child: Container(...),
    ),
  ],
)
```

**핵심 포인트:**
- 필요할 때만 공간을 차지
- 고정 크기 위젯과 함께 사용 가능
- Expanded보다 유연함

---

##  각 라인별 상세 설명

### Expanded 예제 1: 기본

```76:100:F02Ui/lib/ch02_layout_widgets/ch02-04_expanded_flexible.dart
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.red,
                    child: const Center(child: Text('Expanded', style: TextStyle(color: Colors.white))),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.green,
                    child: const Center(child: Text('Expanded', style: TextStyle(color: Colors.white))),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('Expanded', style: TextStyle(color: Colors.white))),
                  ),
                ),
              ],
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 78 | `Expanded` - 남은 공간을 차지하는 위젯 |
| 78 | `child` - Expanded 내부 위젯 |
| 79-83 | 첫 번째 Expanded (빨간색) |
| 85-89 | 두 번째 Expanded (초록색) |
| 92-96 | 세 번째 Expanded (파란색) |

**결과:** 각 Expanded가 동일한 비율(1:1:1)로 공간을 차지합니다.

---

### Expanded 예제 2: flex 속성

```116:145:F02Ui/lib/ch02_layout_widgets/ch02-04_expanded_flexible.dart
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    color: Colors.red,
                    child: const Center(child: Text('flex: 1', style: TextStyle(color: Colors.white))),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    color: Colors.green,
                    child: const Center(child: Text('flex: 2', style: TextStyle(color: Colors.white))),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('flex: 1', style: TextStyle(color: Colors.white))),
                  ),
                ),
              ],
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 119 | `flex: 1` - 비율 1 |
| 127 | `flex: 2` - 비율 2 |
| 135 | `flex: 1` - 비율 1 |

**결과:** 비율 1:2:1로 공간을 차지합니다 (총 4분할 중 각각 1, 2, 1).

---

### Flexible 예제

```232:258:F02Ui/lib/ch02_layout_widgets/ch02-04_expanded_flexible.dart
            Row(
              children: [
                Flexible(
                  child: Container(
                    height: 50,
                    color: Colors.orange,
                    child: const Center(child: Text('Flexible', style: TextStyle(color: Colors.white))),
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.purple,
                  child: const Center(child: Text('고정', style: TextStyle(color: Colors.white))),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 50,
                    color: Colors.teal,
                    child: const Center(child: Text('Flexible flex: 2', style: TextStyle(color: Colors.white))),
                  ),
                ),
              ],
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 234 | `Flexible` - 유연한 공간 차지 |
| 241-246 | 고정 크기 Container (100px) |
| 247 | `Flexible` - flex: 2 |

**결과:** Flexible은 필요 공간만 차지하고, 고정 위젯과 함께 사용할 수 있습니다.

---

##  핵심 개념 정리

### Expanded vs Flexible

| 특징 | Expanded | Flexible |
|------|----------|----------|
| 공간 차지 | 항상 모든 공간 | 필요할 때만 |
| 고정 위젯과 사용 | 어려움 | 가능 |
| flex 속성 | 지원 | 지원 |
| 사용 시나리오 | 비율 배치 | 유연한 배치 |

### flex 속성 계산

```dart
// flex: 1, flex: 2, flex: 1
// 총 비율: 1 + 2 + 1 = 4
// 각각: 1/4, 2/4, 1/4
```

---

##  실전 팁

### 1. Expanded 사용 시나리오

```dart
//  비율 배치가 필요할 때
Row(
  children: [
    Expanded(flex: 2, child: ...),  // 2/3
    Expanded(flex: 1, child: ...),  // 1/3
  ],
)
```

### 2. Flexible 사용 시나리오

```dart
//  고정 위젯과 함께 사용할 때
Row(
  children: [
    Flexible(child: ...),  // 유연
    Container(width: 100, ...),  // 고정
    Flexible(child: ...),  // 유연
  ],
)
```

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] Expanded의 기본 사용법을 이해했습니다
- [ ] Flexible의 기본 사용법을 이해했습니다
- [ ] flex 속성을 사용할 수 있습니다
- [ ] Expanded와 Flexible의 차이를 이해했습니다
- [ ] 적절한 상황에 Expanded/Flexible을 선택할 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch02_layout_widgets/ch02-04_expanded_flexible.dart
```

