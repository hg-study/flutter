# Dart 기초 강의 예제 (F01DartBasic)

Flutter 학습을 위한 Dart 언어 기초 예제 모음입니다.

> 이 프로젝트는 **콘솔 전용**입니다. 화면(UI)이 없으며, 모든 예제는 터미널에 `print` 출력으로 실행 결과를 보여줍니다. `flutter run`이 아니라 `dart run`으로 실행하세요.

## 강의 구성

| 챕터 | 주제 | 주요 내용 |
|------|------|-----------|
| 01 | 기본 문법 | 변수, 타입, 연산자, 문자열 |
| 02 | 제어문 | if/else, switch, for, while, break/continue |
| 03 | 컬렉션 | List, Map, Set, 스프레드 연산자, 컬렉션 if/for |
| 04 | Null Safety | `?.` `??` `??=` `!` `late`, 타입 프로모션 |
| 05 | 클래스와 객체 | 생성자, getter/setter, 상속, 추상 클래스, static |
| 06 | 제네릭 | 제네릭 클래스와 함수, 타입 제약 |
| 07 | 비동기 프로그래밍 | Future, async/await, then, 에러 처리 |
| 08 | 함수형 프로그래밍 | 람다, map, where, reduce, fold, firstWhere |

## 실행 방법

프로젝트 폴더(`F01DartBasic`)에서 각 챕터를 개별 실행합니다.

```bash
dart run lib/ch01_basic_syntax/main.dart
dart run lib/ch02_control_flow/main.dart
dart run lib/ch03_collections/main.dart
dart run lib/ch04_null_safety/main.dart
dart run lib/ch05_classes_objects/main.dart
dart run lib/ch06_generics/main.dart
dart run lib/ch07_async/main.dart
dart run lib/ch08_functional/main.dart
```

`lib/main.dart`를 실행하면 위 실행 방법 안내가 출력됩니다.

```bash
dart run lib/main.dart
```

## 참고

- 각 챕터의 `main.dart`는 독립적으로 실행 가능하며, 섹션별 배너 주석으로 구분되어 있습니다.
- 코드를 직접 수정해 보면서 출력이 어떻게 바뀌는지 확인하는 것이 가장 좋은 학습 방법입니다.
