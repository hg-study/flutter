# ch04-05: Card 기본 - 코드 설명

##  학습 목표
- Card 위젯의 기본 사용법
- elevation 이해
- ListTile과 Card 조합
- Card 색상 설정

---

##  중요 코드 설명

### 1. Card 기본 구조

```dart
Card(
  elevation: 4,
  child: ListTile(
    title: Text('제목'),
  ),
)
```

**핵심 포인트:**
- `elevation`: 그림자 효과 (0~24)
- `child`: 카드 내용
- `color`: 카드 배경색

---

##  각 라인별 상세 설명

### 예제 1: 기본 Card

```67:78:F02Ui/lib/ch04_list_grid/ch04-05_card_basic.dart
          Card(
            child: ListTile(
              leading: const Icon(Icons.info, color: Colors.blue),
              title: const Text('카드 제목'),
              subtitle: const Text('카드 부제목'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('카드 클릭')),
                );
              },
            ),
          ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 67 | `Card` - Material Design 카드 위젯 |
| 68 | `child` - 카드 내용 (ListTile) |
| 69 | `leading` - 왼쪽 아이콘 |
| 70 | `title` - 제목 |
| 71 | `subtitle` - 부제목 |
| 72 | `trailing` - 오른쪽 아이콘 |
| 73 | `onTap` - 클릭 이벤트 |

---

##  핵심 개념 정리

### elevation 값

- `0`: 그림자 없음
- `1-4`: 작은 그림자
- `8-12`: 중간 그림자
- `16-24`: 큰 그림자

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] Card를 사용할 수 있습니다
- [ ] elevation을 이해했습니다
- [ ] ListTile과 Card를 조합할 수 있습니다
- [ ] Card 색상을 설정할 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch04_list_grid/ch04-05_card_basic.dart
```

