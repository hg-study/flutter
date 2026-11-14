# ch03-02: File I/O - 코드 설명

##  학습 목표
- 파일 읽기/쓰기
- path_provider 사용
- 파일 존재 확인

---

##  중요 코드 설명

### 파일 경로 가져오기

```dart
final directory = await getApplicationDocumentsDirectory();
final file = File('${directory.path}/my_file.txt');
```

**핵심 포인트:**
- `getApplicationDocumentsDirectory()`: 앱 문서 디렉토리
- `File`: 파일 객체

### 파일 읽기/쓰기

```dart
// 읽기
String content = await file.readAsString();

// 쓰기
await file.writeAsString(content);

// 삭제
await file.delete();
```

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] 파일을 읽고 쓸 수 있습니다
- [ ] path_provider를 사용할 수 있습니다

---

##  실행 방법

```bash
cd F03Advanced
flutter run lib/ch03_local_storage/ch03-02_file_io.dart
```

