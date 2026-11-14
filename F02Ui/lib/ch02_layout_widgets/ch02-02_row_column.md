# ch02-02: Row와 Column - 코드 설명

##  학습 목표
- Row의 개념과 사용법
- Column의 개념과 사용법
- mainAxisAlignment 이해
- crossAxisAlignment 이해

---

##  중요 코드 설명

### 1. Row 기본 구조

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Widget1(),
    Widget2(),
    Widget3(),
  ],
)
```

**핵심 포인트:**
- `mainAxisAlignment`: 주축(가로) 정렬
- `crossAxisAlignment`: 교차축(세로) 정렬
- `children`: 가로로 배치할 위젯들

### 2. Column 기본 구조

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Widget1(),
    Widget2(),
    Widget3(),
  ],
)
```

**핵심 포인트:**
- `mainAxisAlignment`: 주축(세로) 정렬
- `crossAxisAlignment`: 교차축(가로) 정렬
- `children`: 세로로 배치할 위젯들

---

##  각 라인별 상세 설명

### Row 예제: mainAxisAlignment

```79:148:F02Ui/lib/ch02_layout_widgets/ch02-02_row_column.dart
                // Row - start
                Row(
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('mainAxisAlignment: start (기본값)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 16),
                // Row - center
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('mainAxisAlignment: center', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 16),
                // Row - end
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('mainAxisAlignment: end', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 16),
                // Row - spaceBetween
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('mainAxisAlignment: spaceBetween', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 16),
                // Row - spaceAround
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('mainAxisAlignment: spaceAround', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 16),
                // Row - spaceEvenly
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('mainAxisAlignment: spaceEvenly', style: TextStyle(fontSize: 12, color: Colors.grey)),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 79-85 | `Row` - 기본 정렬 (start, 왼쪽 정렬) |
| 91 | `mainAxisAlignment: MainAxisAlignment.center` - 가로 중앙 정렬 |
| 103 | `mainAxisAlignment: MainAxisAlignment.end` - 가로 오른쪽 정렬 |
| 115 | `mainAxisAlignment: MainAxisAlignment.spaceBetween` - 양 끝 정렬, 중간 공간 분배 |
| 127 | `mainAxisAlignment: MainAxisAlignment.spaceAround` - 양 끝 여백, 중간 공간 분배 |
| 139 | `mainAxisAlignment: MainAxisAlignment.spaceEvenly` - 모든 공간 균등 분배 |

**mainAxisAlignment 종류:**
- `start`: 시작점 정렬 (기본값)
- `center`: 중앙 정렬
- `end`: 끝점 정렬
- `spaceBetween`: 양 끝 정렬, 중간 공간 분배
- `spaceAround`: 양 끝 여백, 중간 공간 분배
- `spaceEvenly`: 모든 공간 균등 분배

---

### Column 예제: mainAxisAlignment

```195:244:F02Ui/lib/ch02_layout_widgets/ch02-02_row_column.dart
                // Column - start
                Column(
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(width: 16),
                // Column - center
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(width: 16),
                // Column - end
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(width: 16),
                // Column - spaceEvenly
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('start', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(width: 16),
                const Text('center', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(width: 16),
                const Text('end', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(width: 16),
                const Text('spaceEvenly', style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 195-201 | `Column` - 기본 정렬 (start, 위쪽 정렬) |
| 205 | `mainAxisAlignment: MainAxisAlignment.center` - 세로 중앙 정렬 |
| 215 | `mainAxisAlignment: MainAxisAlignment.end` - 세로 아래쪽 정렬 |
| 225 | `mainAxisAlignment: MainAxisAlignment.spaceEvenly` - 세로 공간 균등 분배 |

---

### crossAxisAlignment 예제

```262:301:F02Ui/lib/ch02_layout_widgets/ch02-02_row_column.dart
                // crossAxisAlignment.start
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(width: 16),
                // crossAxisAlignment.center
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(width: 16),
                // crossAxisAlignment.end
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('start', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(width: 16),
                const Text('center', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(width: 16),
                const Text('end', style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 263 | `crossAxisAlignment: CrossAxisAlignment.start` - 가로 왼쪽 정렬 |
| 273 | `crossAxisAlignment: CrossAxisAlignment.center` - 가로 중앙 정렬 |
| 283 | `crossAxisAlignment: CrossAxisAlignment.end` - 가로 오른쪽 정렬 |

**crossAxisAlignment 종류:**
- `start`: 시작점 정렬
- `center`: 중앙 정렬 (기본값)
- `end`: 끝점 정렬
- `stretch`: 전체 너비/높이로 확장

---

##  핵심 개념 정리

### Row vs Column

| 특징 | Row | Column |
|------|-----|--------|
| 방향 | 가로 | 세로 |
| mainAxisAlignment | 가로 정렬 | 세로 정렬 |
| crossAxisAlignment | 세로 정렬 | 가로 정렬 |

### mainAxisAlignment vs crossAxisAlignment

**Row에서:**
- `mainAxisAlignment`: 가로 정렬 (주축)
- `crossAxisAlignment`: 세로 정렬 (교차축)

**Column에서:**
- `mainAxisAlignment`: 세로 정렬 (주축)
- `crossAxisAlignment`: 가로 정렬 (교차축)

---

##  실전 팁

### 1. Row 사용 시 주의사항

```dart
//  위젯이 화면을 벗어날 수 있음
Row(
  children: [
    Container(width: 200, ...),
    Container(width: 200, ...),
    Container(width: 200, ...),  // 화면을 벗어날 수 있음
  ],
)

//  Expanded나 Flexible 사용
Row(
  children: [
    Expanded(child: Container(...)),
    Expanded(child: Container(...)),
    Expanded(child: Container(...)),
  ],
)
```

### 2. Column 사용 시 주의사항

```dart
//  위젯이 화면을 벗어날 수 있음
Column(
  children: [
    Container(height: 200, ...),
    Container(height: 200, ...),
    Container(height: 200, ...),  // 화면을 벗어날 수 있음
  ],
)

//  SingleChildScrollView로 감싸기
SingleChildScrollView(
  child: Column(
    children: [...],
  ),
)
```

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] Row의 기본 사용법을 이해했습니다
- [ ] Column의 기본 사용법을 이해했습니다
- [ ] mainAxisAlignment를 사용할 수 있습니다
- [ ] crossAxisAlignment를 사용할 수 있습니다
- [ ] Row와 Column의 차이를 이해했습니다
- [ ] mainAxisAlignment와 crossAxisAlignment의 차이를 이해했습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch02_layout_widgets/ch02-02_row_column.dart
```

