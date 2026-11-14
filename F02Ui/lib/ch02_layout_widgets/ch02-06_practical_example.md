# ch02-06: 실전 예제 - 카드 레이아웃 코드 설명

##  학습 목표
- 여러 레이아웃 위젯 조합
- 실제 앱에서 사용하는 카드 레이아웃 패턴
- Container, Row, Column, Expanded 활용
- 실전 UI 구성 방법

---

##  중요 코드 설명

### 1. 프로필 카드 구조

```dart
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(...),
  child: Column(
    children: [
      Row(...),  // 프로필 정보
      Divider(),
      Row(...),  // 액션 버튼
    ],
  ),
)
```

**핵심 포인트:**
- Container로 카드 스타일
- Row와 Column 조합
- Expanded로 공간 분배

### 2. 상품 카드 구조

```dart
Container(
  decoration: BoxDecoration(...),
  child: Column(
    children: [
      Container(...),  // 이미지 영역
      Padding(...),    // 내용 영역
    ],
  ),
)
```

**핵심 포인트:**
- 이미지와 내용 분리
- Padding으로 여백 조절
- Row로 가격과 버튼 배치

---

##  각 라인별 상세 설명

### 예제 1: 프로필 카드

```76:135:F02Ui/lib/ch02_layout_widgets/ch02-06_practical_example.dart
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(Icons.person, size: 30, color: Colors.blue),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '사용자 이름',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '사용자 설명',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(Icons.thumb_up, '좋아요'),
                      _buildActionButton(Icons.comment, '댓글'),
                      _buildActionButton(Icons.share, '공유'),
                    ],
                  ),
                ],
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 77 | `padding` - 내부 여백 |
| 78-88 | `decoration` - 카드 스타일 (둥근 모서리, 그림자) |
| 90 | `Column` - 세로 배치 |
| 93 | `Row` - 프로필 정보 가로 배치 |
| 95-103 | 프로필 이미지 Container |
| 105 | `SizedBox` - 간격 |
| 106 | `Expanded` - 텍스트 영역 확장 |
| 122 | `Divider` - 구분선 |
| 125 | `Row` - 액션 버튼 가로 배치 |
| 126 | `mainAxisAlignment: spaceEvenly` - 균등 분배 |

---

### 예제 2: 상품 카드

```149:216:F02Ui/lib/ch02_layout_widgets/ch02-06_practical_example.dart
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 이미지 영역
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: const Icon(Icons.shopping_bag, size: 80, color: Colors.white),
                  ),
                  // 내용 영역
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '상품 이름',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '상품 설명이 여기에 표시됩니다.',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '₩10,000',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: null,
                              child: const Text('구매하기'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 165-177 | 이미지 영역 Container |
| 171-174 | `BorderRadius.only` - 위쪽만 둥글게 |
| 179 | `Padding` - 내용 영역 여백 |
| 194 | `Row` - 가격과 버튼 배치 |
| 195 | `mainAxisAlignment: spaceBetween` - 양 끝 정렬 |

---

### 예제 3: 리스트 아이템

```230:268:F02Ui/lib/ch02_layout_widgets/ch02-06_practical_example.dart
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.check_circle, color: Colors.green),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '리스트 항목 제목',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '리스트 항목 설명',
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 237 | `Row` - 가로 배치 |
| 239-247 | 아이콘 Container |
| 249 | `Expanded` - 텍스트 영역 확장 |
| 265 | 오른쪽 화살표 아이콘 |

---

##  핵심 개념 정리

### 카드 레이아웃 패턴

1. **Container로 카드 스타일**
   - `borderRadius`: 둥근 모서리
   - `boxShadow`: 그림자 효과
   - `padding`: 내부 여백

2. **Row와 Column 조합**
   - Row: 가로 배치
   - Column: 세로 배치
   - 중첩 사용

3. **Expanded로 공간 분배**
   - 텍스트 영역 확장
   - 남은 공간 활용

---

##  실전 팁

### 1. 카드 스타일 통일

```dart
BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(12),
  border: Border.all(color: Colors.grey.shade300),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.shade300,
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ],
)
```

### 2. 레이아웃 구조화

```dart
Container(
  child: Column(
    children: [
      Row(...),      // 헤더
      Divider(),     // 구분선
      Row(...),      // 내용
    ],
  ),
)
```

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] 여러 레이아웃 위젯을 조합할 수 있습니다
- [ ] 카드 레이아웃을 만들 수 있습니다
- [ ] Row와 Column을 적절히 사용할 수 있습니다
- [ ] Expanded로 공간을 분배할 수 있습니다
- [ ] 실제 앱에서 사용하는 패턴을 이해했습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch02_layout_widgets/ch02-06_practical_example.dart
```

