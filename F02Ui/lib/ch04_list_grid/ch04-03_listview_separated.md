# ch04-03: ListView.separated - 코드 설명

##  학습 목표
- ListView.separated의 사용법
- separatorBuilder 이해
- 구분선이 있는 리스트

---

##  중요 코드 설명

### 1. ListView.separated 기본 구조

```dart
ListView.separated(
  itemCount: items.length,
  separatorBuilder: (context, index) => Divider(),
  itemBuilder: (context, index) {
    return ListTile(...);
  },
)
```

**핵심 포인트:**
- `separatorBuilder`: 구분선 생성 함수
- 항목 사이에 구분선 자동 삽입

---

##  각 라인별 상세 설명

### ListView.separated 예제

```25:50:F02Ui/lib/ch04_list_grid/ch04-03_listview_separated.dart
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          thickness: 1,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: Icon(
              item['icon'],
              color: Colors.primaries[index % Colors.primaries.length],
            ),
            title: Text(item['title']),
            subtitle: Text(item['subtitle']),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item['title']} 클릭')),
              );
            },
          );
        },
      ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 25 | `ListView.separated` - 구분선이 있는 리스트 |
| 29 | `separatorBuilder` - 구분선 생성 함수 |
| 30-33 | `Divider` - 구분선 위젯 |

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] ListView.separated를 사용할 수 있습니다
- [ ] separatorBuilder를 이해했습니다
- [ ] 구분선이 있는 리스트를 만들 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch04_list_grid/ch04-03_listview_separated.dart
```

