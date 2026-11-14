# ch02-05: SizedBox와 Center - 코드 설명

##  학습 목표
- SizedBox의 개념과 사용법
- Center의 개념과 사용법
- 간격 조절 방법
- 중앙 정렬 방법

---

##  중요 코드 설명

### 1. SizedBox 기본 구조

```dart
SizedBox(
  width: 150,
  height: 50,
  child: ElevatedButton(...),
)
```

**핵심 포인트:**
- 고정 크기의 공간 생성
- 위젯 간 간격 조절
- 자식 위젯의 크기 제한

### 2. Center 기본 구조

```dart
Center(
  child: Text('중앙 정렬'),
)
```

**핵심 포인트:**
- 자식 위젯을 중앙에 배치
- 가장 간단한 정렬 위젯

---

##  각 라인별 상세 설명

### SizedBox 예제 1: 고정 크기

```76:83:F02Ui/lib/ch02_layout_widgets/ch02-05_sizedbox_center.dart
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('고정 크기 버튼'),
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 76 | `SizedBox` - 고정 크기 위젯 |
| 77 | `width: 150` - 가로 150px |
| 78 | `height: 50` - 세로 50px |
| 79 | `child` - 크기 제한할 위젯 |

---

### SizedBox 예제 2: 전체 너비

```97:104:F02Ui/lib/ch02_layout_widgets/ch02-05_sizedbox_center.dart
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('전체 너비 버튼'),
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 98 | `width: double.infinity` - 전체 너비 |

---

### SizedBox 예제 3: 간격 조절

```118:141:F02Ui/lib/ch02_layout_widgets/ch02-05_sizedbox_center.dart
            Column(
              children: [
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.red,
                  child: const Center(child: Text('위', style: TextStyle(color: Colors.white))),
                ),
                const SizedBox(height: 20), // 간격
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.green,
                  child: const Center(child: Text('중간', style: TextStyle(color: Colors.white))),
                ),
                const SizedBox(height: 20), // 간격
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                  child: const Center(child: Text('아래', style: TextStyle(color: Colors.white))),
                ),
              ],
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 126 | `SizedBox(height: 20)` - 세로 간격 20px |
| 133 | `SizedBox(height: 20)` - 세로 간격 20px |

---

### Center 예제

```245:255:F02Ui/lib/ch02_layout_widgets/ch02-05_sizedbox_center.dart
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.grey.shade200,
              child: const Center(
                child: Text(
                  '중앙 정렬된 텍스트',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 249 | `Center` - 중앙 정렬 위젯 |
| 250-254 | 중앙에 배치할 위젯 |

---

##  핵심 개념 정리

### SizedBox의 용도

1. **크기 제한**
   ```dart
   SizedBox(
     width: 200,
     height: 100,
     child: Container(...),
   )
   ```

2. **간격 조절**
   ```dart
   Column(
     children: [
       Widget1(),
       SizedBox(height: 20),  // 간격
       Widget2(),
     ],
   )
   ```

### Center vs Container의 alignment

```dart
// 방법 1: Center 위젯
Center(
  child: Text('...'),
)

// 방법 2: Container의 alignment
Container(
  alignment: Alignment.center,
  child: Text('...'),
)
```

**차이점:**
- `Center`: 간단하고 직관적
- `Container`의 `alignment`: 더 많은 정렬 옵션

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] SizedBox의 기본 사용법을 이해했습니다
- [ ] 간격 조절에 SizedBox를 사용할 수 있습니다
- [ ] Center의 기본 사용법을 이해했습니다
- [ ] 중앙 정렬을 구현할 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch02_layout_widgets/ch02-05_sizedbox_center.dart
```

