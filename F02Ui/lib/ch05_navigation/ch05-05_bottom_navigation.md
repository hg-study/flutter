# ch05-05: BottomNavigationBar - 코드 설명

##  학습 목표
- BottomNavigationBar 사용법
- 탭 전환 구현
- 상태 관리로 탭 변경

---

##  중요 코드 설명

### 1. BottomNavigationBar 구조

```dart
BottomNavigationBar(
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
  items: [...],
)
```

**핵심 포인트:**
- `currentIndex`: 현재 선택된 탭
- `onTap`: 탭 클릭 이벤트
- `items`: 탭 아이템들

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] BottomNavigationBar를 사용할 수 있습니다
- [ ] 탭 전환을 구현할 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch05_navigation/ch05-05_bottom_navigation.dart
```

