# ch04-01: ListView 기본 - 코드 설명

##  학습 목표
- ListView의 기본 사용법
- ListTile 사용법
- 정적 리스트 생성
- ListTile의 다양한 속성

---

##  중요 코드 설명

### 1. ListView 기본 구조

```dart
ListView(
  padding: EdgeInsets.all(16),
  children: [
    ListTile(...),
    ListTile(...),
  ],
)
```

**핵심 포인트:**
- `children`: 위젯 리스트 제공
- 정적 리스트에 적합
- 스크롤 가능

### 2. ListTile 구조

```dart
ListTile(
  leading: Icon(Icons.home),
  title: Text('제목'),
  subtitle: Text('부제목'),
  trailing: Icon(Icons.chevron_right),
  onTap: () {},
)
```

**핵심 포인트:**
- `leading`: 왼쪽 위젯
- `title`: 제목
- `subtitle`: 부제목
- `trailing`: 오른쪽 위젯
- `onTap`: 클릭 이벤트

---

##  각 라인별 상세 설명

### 예제 1: 기본 ListView

```78:85:F02Ui/lib/ch04_list_grid/ch04-01_listview_basic.dart
            children: items.take(5).map((item) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    item.split(' ')[1],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(item),
                subtitle: Text('부제목: $item'),
                trailing: const Icon(Icons.chevron_right),
              );
            }).toList(),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 78 | `items.take(5)` - 처음 5개 항목만 선택 |
| 78 | `.map()` - 각 항목을 ListTile로 변환 |
| 80 | `ListTile` - 리스트 항목 위젯 |
| 81-88 | `leading` - 왼쪽 CircleAvatar |
| 90 | `title` - 제목 텍스트 |
| 91 | `subtitle` - 부제목 텍스트 |
| 92 | `trailing` - 오른쪽 아이콘 |

---

##  핵심 개념 정리

### ListView vs ListView.builder

| 특징 | ListView | ListView.builder |
|------|-----------|------------------|
| 데이터 | 정적 | 동적 |
| 성능 | 작은 리스트에 적합 | 큰 리스트에 적합 |
| 사용법 | children 리스트 | itemBuilder 함수 |

### ListTile 속성

- `leading`: 왼쪽 위젯 (아이콘, 아바타 등)
- `title`: 제목 (필수)
- `subtitle`: 부제목 (선택)
- `trailing`: 오른쪽 위젯 (아이콘, 버튼 등)
- `onTap`: 클릭 이벤트

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] ListView의 기본 사용법을 이해했습니다
- [ ] ListTile을 사용할 수 있습니다
- [ ] ListTile의 다양한 속성을 이해했습니다
- [ ] 정적 리스트를 만들 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch04_list_grid/ch04-01_listview_basic.dart
```

