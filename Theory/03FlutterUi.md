# Flutter UI

- [위젯 기초](#위젯-기초)
- [레이아웃 위젯](#레이아웃-위젯)
- [기본 UI 위젯](#기본-ui-위젯)
- [리스트와 그리드](#리스트와-그리드)
- [네비게이션](#네비게이션)
- [폼과 입력](#폼과-입력)
- [테마와 스타일링](#테마와-스타일링)
- [고급 레이아웃](#고급-레이아웃)

<br>

---

### 위젯 기초

> Flutter의 화면은 위젯이 중첩된 트리이다. 값이 변하지 않는 화면은 `StatelessWidget`, 상태가 바뀌면 화면을 다시 그려야 하는 화면은 `StatefulWidget`으로 만든다. `StatefulWidget`은 상태를 `State` 클래스에 두고 값을 바꿀 때 `setState(() {...})`를 호출해야 `build`가 다시 실행되어 화면이 갱신된다. `build`는 자주 호출되므로 오래 걸리는 작업을 넣지 않는다.

<br>

| 구분 | StatelessWidget | StatefulWidget |
| --- | --- | --- |
| 상태 | 없음 | `State`에 보관 |
| 갱신 | 부모가 다시 만들 때 | `setState` 호출 |
| 예 | 제목, 아이콘 | 카운터, 입력창 |

<br>

- 예제 코드: [Stateless](../F02Ui/lib/ch01_widget_basics/ch01-01_stateless_widget.dart), [카운터](../F02Ui/lib/ch01_widget_basics/ch01-02_stateful_widget_counter.dart), [위젯 트리](../F02Ui/lib/ch01_widget_basics/ch01-04_widget_tree_build.dart)

---

### 레이아웃 위젯

> 위젯을 배치하는 위젯들이다. `Container`는 크기, 여백, 장식을 한꺼번에 주고, `Row`와 `Column`은 가로와 세로로 나열한다. 주 축과 교차 축 정렬은 `mainAxisAlignment`, `crossAxisAlignment`로 정한다. `Stack`은 겹쳐 쌓고, `Expanded`와 `Flexible`은 남은 공간을 비율로 나눠 가지며, `SizedBox`는 고정 크기나 간격, `Center`는 가운데 배치에 쓴다.

<br>

| 위젯 | 용도 |
| --- | --- |
| Container, Padding | 여백, 크기, 장식 |
| Row, Column | 가로, 세로 나열 |
| Stack, Positioned | 겹치기와 위치 지정 |
| Expanded, Flexible | 남은 공간 분배 |
| SizedBox, Center | 간격, 가운데 정렬 |

<br>

- 예제 코드: [Row, Column](../F02Ui/lib/ch02_layout_widgets/ch02-02_row_column.dart), [Stack](../F02Ui/lib/ch02_layout_widgets/ch02-03_stack.dart), [Expanded](../F02Ui/lib/ch02_layout_widgets/ch02-04_expanded_flexible.dart)

---

### 기본 UI 위젯

> `Text`는 `style`로 글꼴을 꾸미고, `Icon`은 내장 아이콘, `Image`는 네트워크와 에셋 이미지를 보여 준다. 버튼은 `ElevatedButton`, `TextButton`, `OutlinedButton`, `IconButton`이 있고 `onPressed`에 null을 주면 비활성화된다. `FloatingActionButton`은 화면의 주요 동작 한 가지를 떠 있는 버튼으로 제공한다.

<br>

- 예제 코드: [Text](../F02Ui/lib/ch03_basic_ui_widgets/ch03-01_text.dart), [버튼](../F02Ui/lib/ch03_basic_ui_widgets/ch03-04_button.dart), [이미지](../F02Ui/lib/ch03_basic_ui_widgets/ch03-03_image.dart)

---

### 리스트와 그리드

> `ListView`는 스크롤되는 목록이다. 항목이 많으면 `ListView.builder`를 써서 화면에 보이는 항목만 만들어 메모리를 아끼고, 항목 사이에 구분선이 필요하면 `ListView.separated`를 쓴다. 격자 배치는 `GridView`, 정보 묶음을 카드 모양으로 보여 줄 때는 `Card`를 쓴다.

<br>

- 예제 코드: [ListView.builder](../F02Ui/lib/ch04_list_grid/ch04-02_listview_builder.dart), [GridView](../F02Ui/lib/ch04_list_grid/ch04-04_gridview.dart), [Card](../F02Ui/lib/ch04_list_grid/ch04-05_card_basic.dart)

---

### 네비게이션

> 화면 이동은 `Navigator`가 화면을 스택으로 쌓고 빼는 방식이다. `push`로 새 화면을 올리고 `pop`으로 돌아오며, 돌아오면서 결과 값을 넘길 수 있다. 화면마다 이름을 붙여 `routes`에 등록하면 `pushNamed`로 이동한다. 화면에 데이터를 넘길 때는 생성자 인자나 `arguments`를 쓴다. 화면 하단의 `BottomNavigationBar`와 옆에서 나오는 `Drawer`는 주요 화면 전환에 쓴다.

<br>

| 방법 | 코드 |
| --- | --- |
| 이동 | `Navigator.push(context, MaterialPageRoute(builder: ...))` |
| 뒤로 | `Navigator.pop(context, 결과)` |
| 이름으로 이동 | `Navigator.pushNamed(context, '/home')` |

<br>

- 예제 코드: [push](../F02Ui/lib/ch05_navigation/ch05-01_navigator_push.dart), [이름 있는 라우트](../F02Ui/lib/ch05_navigation/ch05-02_named_routes.dart), [데이터 전달](../F02Ui/lib/ch05_navigation/ch05-03_data_passing.dart), [하단 탭](../F02Ui/lib/ch05_navigation/ch05-05_bottom_navigation.dart)

---

### 폼과 입력

> `TextField`는 `TextEditingController`로 입력값을 읽고 `onChanged`로 변화를 받는다. `Form`과 `TextFormField`를 쓰면 `validator`로 입력값을 검증하고 `formKey.currentState!.validate()`로 한꺼번에 확인한다. 선택 입력은 `Checkbox`, `Switch`, `Radio`, `Slider`, `DropdownButton`이다. 컨트롤러는 쓰고 나면 `dispose()`에서 해제해야 메모리 누수를 막는다.

<br>

- 예제 코드: [TextField](../F02Ui/lib/ch06_form_input/ch06-01_textfield.dart), [TextFormField](../F02Ui/lib/ch06_form_input/ch06-02_textformfield.dart), [드롭다운](../F02Ui/lib/ch06_form_input/ch06-05_dropdown.dart)

---

### 테마와 스타일링

> 앱 전체의 색과 글꼴은 `MaterialApp`의 `theme`에서 한 번에 정한다. `ColorScheme.fromSeed`로 기준색에서 어울리는 색 체계를 만들고, 위젯에서는 `Theme.of(context)`로 꺼내 쓴다. 개별 글꼴은 `TextStyle`, 상자의 배경, 테두리, 모서리, 그림자는 `BoxDecoration`으로 꾸민다. 색을 직접 쓰지 않고 테마에서 가져오면 다크 모드 전환이 쉽다.

<br>

- 예제 코드: [ColorScheme](../F02Ui/lib/ch07_theme_styling/ch07-01_colorscheme.dart), [TextStyle](../F02Ui/lib/ch07_theme_styling/ch07-02_textstyle.dart), [BoxDecoration](../F02Ui/lib/ch07_theme_styling/ch07-03_boxdecoration.dart)

---

### 고급 레이아웃

> `Wrap`은 공간이 모자라면 다음 줄로 넘기며 나열하고, `AspectRatio`는 가로세로 비율을 유지하며, `SafeArea`는 노치와 상태 표시줄을 피해 배치한다. `LayoutBuilder`는 부모가 주는 크기 제약을 읽어 화면 크기에 따라 다른 레이아웃을 그릴 때 쓴다.

<br>

- 예제 코드: [Wrap](../F02Ui/lib/ch08_advanced_layout/ch08-01_wrap.dart), [LayoutBuilder](../F02Ui/lib/ch08_advanced_layout/ch08-04_layoutbuilder.dart), [UI 커리큘럼](../F02Ui/00_FLUTTER_UI_CURRICULUM.md)
