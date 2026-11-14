# ch08-04: LayoutBuilder - 코드 설명

##  학습 목표
- LayoutBuilder 사용법
- 반응형 레이아웃 구현
- constraints 활용

---

##  중요 코드 설명

### 1. LayoutBuilder 구조

```dart
LayoutBuilder(
  builder: (context, constraints) {
    final isWide = constraints.maxWidth > 600;
    return isWide ? Row(...) : Column(...);
  },
)
```

**핵심 포인트:**
- `constraints`: 사용 가능한 크기 정보
- `maxWidth`, `maxHeight` 활용
- 반응형 레이아웃 구현

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] LayoutBuilder를 사용할 수 있습니다
- [ ] 반응형 레이아웃을 구현할 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch08_advanced_layout/ch08-04_layoutbuilder.dart
```

