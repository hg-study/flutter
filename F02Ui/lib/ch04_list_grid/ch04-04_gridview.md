# ch04-04: GridView - 코드 설명

##  학습 목표
- GridView.builder의 사용법
- gridDelegate 이해
- 그리드 레이아웃 구성

---

##  중요 코드 설명

### 1. GridView.builder 기본 구조

```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
  ),
  itemCount: items.length,
  itemBuilder: (context, index) {
    return Container(...);
  },
)
```

**핵심 포인트:**
- `gridDelegate`: 그리드 레이아웃 설정
- `crossAxisCount`: 열 개수
- `crossAxisSpacing`: 가로 간격
- `mainAxisSpacing`: 세로 간격

---

##  각 라인별 상세 설명

### GridView.builder 예제

```25:60:F02Ui/lib/ch04_list_grid/ch04-04_gridview.dart
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 열 개수
          crossAxisSpacing: 16, // 가로 간격
          mainAxisSpacing: 16, // 세로 간격
          childAspectRatio: 0.75, // 가로:세로 비율
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            decoration: BoxDecoration(
              color: product['color'].withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: product['color'],
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_bag,
                  size: 50,
                  color: product['color'],
                ),
                const SizedBox(height: 8),
                Text(
                  product['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${product['price']}원',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
      ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 28 | `crossAxisCount: 2` - 2열 그리드 |
| 29 | `crossAxisSpacing: 16` - 가로 간격 16px |
| 30 | `mainAxisSpacing: 16` - 세로 간격 16px |
| 31 | `childAspectRatio: 0.75` - 가로:세로 = 3:4 |

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] GridView.builder를 사용할 수 있습니다
- [ ] gridDelegate를 이해했습니다
- [ ] 그리드 레이아웃을 만들 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch04_list_grid/ch04-04_gridview.dart
```

