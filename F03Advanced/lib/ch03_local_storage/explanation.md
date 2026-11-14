# -------------------------------------------
# 03단계: 로컬 저장소
# -------------------------------------------

## 학습 목표

이 단계에서는 Flutter의 로컬 저장소를 학습합니다:
- SharedPreferences: 간단한 키-값 저장
- File I/O: 파일 읽기/쓰기
- path_provider: 경로 관리
- 데이터 영구 저장

---

# -------------------------------------------
# 1. SharedPreferences
# -------------------------------------------

## 1.1 패키지 추가

`pubspec.yaml`에 추가:
```yaml
dependencies:
  shared_preferences: ^2.2.2
```

## 1.2 기본 사용법

```dart
// 저장
final prefs = await SharedPreferences.getInstance();
await prefs.setString('key', 'value');
await prefs.setInt('number', 42);
await prefs.setBool('flag', true);

// 읽기
final value = prefs.getString('key');
final number = prefs.getInt('number');
final flag = prefs.getBool('flag');

// 삭제
await prefs.remove('key');
```

## 1.3 지원하는 타입

- `String`
- `int`
- `double`
- `bool`
- `List<String>`

## 1.4 사용 시나리오

- 사용자 설정
- 간단한 데이터 저장
- 플래그 저장
- 작은 데이터

---

# -------------------------------------------
# 2. File I/O
# -------------------------------------------

## 2.1 패키지 추가

`pubspec.yaml`에 추가:
```yaml
dependencies:
  path_provider: ^2.1.1
```

## 2.2 경로 가져오기

```dart
// 문서 디렉토리
final directory = await getApplicationDocumentsDirectory();
final path = directory.path;

// 임시 디렉토리
final tempDir = await getTemporaryDirectory();
```

## 2.3 파일 읽기/쓰기

```dart
// 파일 경로
final file = File('$path/my_file.txt');

// 쓰기
await file.writeAsString('내용');

// 읽기
final content = await file.readAsString();

// 존재 확인
if (await file.exists()) {
  // 파일이 있음
}

// 삭제
await file.delete();
```

## 2.4 사용 시나리오

- 큰 데이터 저장
- 텍스트 파일
- 로그 파일
- 사용자 생성 콘텐츠

---

# -------------------------------------------
# 3. 경로 관리
# -------------------------------------------

## 3.1 path_provider 사용

```dart
import 'package:path_provider/path_provider.dart';

// 앱 문서 디렉토리
final docDir = await getApplicationDocumentsDirectory();

// 임시 디렉토리
final tempDir = await getTemporaryDirectory();

// 외부 저장소 (Android)
final extDir = await getExternalStorageDirectory();
```

## 3.2 파일 경로 생성

```dart
final file = File('${directory.path}/my_file.txt');
```

---

# -------------------------------------------
# 4. 실전 예제
# -------------------------------------------

## 예제 1: 사용자 설정 저장

```dart
class SettingsService {
  static Future<void> saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }
  
  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }
}
```

## 예제 2: 로그 파일 저장

```dart
Future<void> writeLog(String message) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/app.log');
  final timestamp = DateTime.now().toString();
  await file.writeAsString('$timestamp: $message\n', mode: FileMode.append);
}
```

---

# -------------------------------------------
# 체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] SharedPreferences를 사용할 수 있습니다
- [ ] File I/O를 사용할 수 있습니다
- [ ] path_provider로 경로를 가져올 수 있습니다
- [ ] 데이터를 저장할 수 있습니다
- [ ] 데이터를 읽을 수 있습니다
- [ ] 데이터를 삭제할 수 있습니다
- [ ] 실전 예제를 만들 수 있습니다

---

# -------------------------------------------
# 실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [run.md](run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F03Advanced
flutter pub get
flutter run lib/ch03_local_storage/main.dart
```

---

# -------------------------------------------
# 다음 단계
# -------------------------------------------

03단계를 완료했다면 다음 단계로 진행하세요:
- **04단계: 이미지 & 미디어** - image_picker

## 전체 커리큘럼

1. 완료 **01단계: 상태 관리** - Provider
2. 완료 **02단계: 비동기 처리** - FutureBuilder, StreamBuilder
3. 완료 **03단계: 로컬 저장소** - SharedPreferences, File I/O (현재 단계)
4. 다음 **04단계: 이미지 & 미디어** - image_picker
5. 다음 **05단계: 외부 패키지 사용** - http 등

---

# -------------------------------------------
# 팁
# -------------------------------------------

1. **저장소 선택 가이드**
   - 작은 데이터: SharedPreferences
   - 큰 데이터: File I/O
   - 구조화된 데이터: SQLite (별도 패키지)

2. **에러 처리**
   - 항상 try-catch 사용
   - 파일 존재 확인
   - 권한 확인 (Android/iOS)

3. **실전 활용**
   - 설정 저장: SharedPreferences
   - 로그 파일: File I/O
   - 사용자 데이터: File I/O 또는 데이터베이스

4. **주의사항**
   - 비동기 처리 필수
   - 경로 확인
   - 파일 크기 제한

