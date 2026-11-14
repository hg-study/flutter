# ch03-06: 실전 예제 - 카드 UI 코드 설명

##  학습 목표
- Text, Icon, Button 등을 조합한 카드 UI
- StatefulWidget으로 상태 관리
- 실제 앱에서 사용하는 패턴
- AppBar의 actions 사용

---

##  중요 코드 설명

### 1. 카드 UI 구조

```dart
Card(
  elevation: 4,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Row(...),  // 헤더
        Text(...), // 내용
        Row(...),  // 액션
      ],
    ),
  ),
)
```

**핵심 포인트:**
- Card로 카드 스타일
- Row와 Column 조합
- 상태 관리로 인터랙션

### 2. 상태 관리

```dart
bool _isLiked = false;
int _likeCount = 0;

void _toggleLike() {
  setState(() {
    _isLiked = !_isLiked;
    if (_isLiked) {
      _likeCount++;
    } else {
      _likeCount--;
    }
  });
}
```

**핵심 포인트:**
- StatefulWidget으로 상태 관리
- setState()로 UI 업데이트

---

##  각 라인별 상세 설명

### AppBar의 actions

```47:56:F02Ui/lib/ch03_basic_ui_widgets/ch03-06_practical_example.dart
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 47 | `actions` - AppBar 우측 액션 버튼들 |
| 48-52 | 검색 아이콘 버튼 |
| 53-56 | 더보기 아이콘 버튼 |

---

### 카드 헤더 영역

```89:110:F02Ui/lib/ch03_basic_ui_widgets/ch03-06_practical_example.dart
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Icon(Icons.person, color: Colors.blue),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '사용자 이름',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '2시간 전',
                                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_horiz),
                          onPressed: () {},
                        ),
                      ],
                    ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 90 | `Row` - 가로 배치 |
| 91-100 | 프로필 이미지 Container |
| 101 | `Expanded` - 텍스트 영역 확장 |
| 110 | 더보기 아이콘 버튼 |

---

### 좋아요 기능

```133:140:F02Ui/lib/ch03_basic_ui_widgets/ch03-06_practical_example.dart
                        IconButton(
                          icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border),
                          color: _isLiked ? Colors.red : Colors.grey,
                          onPressed: _toggleLike,
                        ),
                        Text('$_likeCount'),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 134 | 상태에 따른 아이콘 변경 |
| 135 | 상태에 따른 색상 변경 |
| 136 | `_toggleLike` 함수 호출 |
| 137 | 좋아요 개수 표시 |

---

##  핵심 개념 정리

### 카드 UI 패턴

1. **Card 위젯 사용**
   - `elevation`: 그림자 효과
   - `child`: 내용

2. **레이아웃 구조**
   - Row: 가로 배치
   - Column: 세로 배치
   - Expanded: 공간 분배

3. **상태 관리**
   - StatefulWidget
   - setState()로 업데이트

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] 카드 UI를 만들 수 있습니다
- [ ] 여러 위젯을 조합할 수 있습니다
- [ ] 상태 관리로 인터랙션을 구현할 수 있습니다
- [ ] AppBar의 actions를 사용할 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch03_basic_ui_widgets/ch03-06_practical_example.dart
```

