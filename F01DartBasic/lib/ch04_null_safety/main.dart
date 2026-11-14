// ============================================
// 04단계: Null Safety 예제
// ============================================
// 포인트: 함수의 반환값은 컴파일러가 null 여부를 미리 알 수 없으므로
// null 안전 연산자(?. ?? ??= !)가 실제로 필요한 상황을 만들 수 있다.

void main() {
  print('==================================================');
  print('04단계: Null Safety 예제');
  print('==================================================');

  // ============================================
  // 1. Nullable vs Non-nullable
  // ============================================
  print('\n[1. Nullable vs Non-nullable]');
  print('------------------------------');

  // Non-nullable (null 불가능)
  String name = 'Flutter';
  // name = null;  // 에러! null 할당 불가

  // Nullable (null 가능) - 함수가 null을 돌려줄 수도 있음
  String? nickname = findNickname(false);

  print('Non-nullable name: $name');
  print('Nullable nickname: $nickname');

  // ============================================
  // 2. Null 체크와 타입 프로모션
  // ============================================
  print('\n[2. Null 체크와 타입 프로모션]');
  print('------------------------------');

  // if (x != null) 체크를 통과하면 그 블록 안에서는
  // String?가 String으로 승격(promotion)되어 바로 사용 가능
  String? found = findNickname(true);
  if (found != null) {
    print('닉네임 길이: ${found.length} (found가 String으로 승격됨)');
  } else {
    print('닉네임이 null입니다');
  }

  String? notFound = findNickname(false);
  if (notFound != null) {
    print('닉네임 길이: ${notFound.length}');
  } else {
    print('닉네임이 null입니다');
  }

  // ============================================
  // 3. Null 안전 연산자 (?.)
  // ============================================
  print('\n[3. Null 안전 연산자 (?.)]');
  print('------------------------------');

  // ?. 연산자: 왼쪽이 null이면 전체가 null, 아니면 멤버 접근
  int? lengthWhenNull = findNickname(false)?.length;
  print('findNickname(false)?.length: $lengthWhenNull');

  int? lengthWhenFound = findNickname(true)?.length;
  print('findNickname(true)?.length: $lengthWhenFound');

  // 체이닝
  String? upperWhenNull = findNickname(false)?.toUpperCase();
  print('findNickname(false)?.toUpperCase(): $upperWhenNull');

  String? upperWhenFound = findNickname(true)?.toUpperCase();
  print('findNickname(true)?.toUpperCase(): $upperWhenFound');

  // ============================================
  // 4. Null 병합 연산자 (??)
  // ============================================
  print('\n[4. Null 병합 연산자 (??)]');
  print('------------------------------');

  // ?? 연산자: 왼쪽이 null이면 오른쪽 값을 사용
  String display1 = findNickname(false) ?? '기본값';
  print('findNickname(false) ?? "기본값": $display1');

  String display2 = findNickname(true) ?? '기본값';
  print('findNickname(true) ?? "기본값": $display2');

  // 숫자 예제
  int total1 = findScore(false) ?? 0;
  print('findScore(false) ?? 0: $total1');

  int total2 = findScore(true) ?? 0;
  print('findScore(true) ?? 0: $total2');

  // ============================================
  // 5. Null 병합 할당 연산자 (??=)
  // ============================================
  print('\n[5. Null 병합 할당 연산자 (??=)]');
  print('------------------------------');

  // ??= 연산자: 변수가 null일 때만 값을 할당
  String? userTitle = findNickname(false);
  print('할당 전: $userTitle');
  userTitle ??= '손님';  // null이므로 '손님'이 할당됨
  print('userTitle ??= "손님" 후: $userTitle');

  String? memberTitle = findNickname(true);
  print('\n할당 전: $memberTitle');
  memberTitle ??= '손님';  // 이미 값이 있으므로 그대로 유지
  print('memberTitle ??= "손님" 후: $memberTitle (기존 값 유지)');

  // ============================================
  // 6. Null 단언 연산자 (!)
  // ============================================
  print('\n[6. Null 단언 연산자 (!)]');
  print('------------------------------');

  // ! 연산자: "절대 null이 아니다"라고 개발자가 보장 (위험!)
  // null이 아님이 확실할 때만 사용해야 함
  String sureName = findNickname(true)!;
  print('findNickname(true)!: $sureName');

  // 주의: 실제로 null이면 런타임 에러 발생!
  // String crash = findNickname(false)!;  // 런타임 에러!
  print('주의: findNickname(false)! 는 런타임 에러가 발생합니다');

  // ============================================
  // 7. late 키워드
  // ============================================
  print('\n[7. late 키워드]');
  print('------------------------------');

  // late: "지금은 아니지만 사용 전에 반드시 값을 넣겠다"고 약속
  // null을 쓰지 않고도 초기화를 나중으로 미룰 수 있음
  late String greeting;

  // 현재 시간에 따라 나중에 값을 결정 (사용 전에만 할당하면 OK)
  bool isMorning = DateTime.now().hour < 12;
  if (isMorning) {
    greeting = '좋은 아침입니다!';
  } else {
    greeting = '좋은 저녁입니다!';
  }
  print('late 변수 사용: $greeting');

  // late는 클래스 필드에서 자주 사용됨 (Flutter의 initState 등)
  UserProfile profile = UserProfile('Alice');
  profile.loadBio();
  print('프로필 소개: ${profile.bio}');

  // ============================================
  // 8. List와 Map에서의 Null Safety
  // ============================================
  print('\n[8. List와 Map에서의 Null Safety]');
  print('------------------------------');

  // List의 nullable 요소
  List<String?> nullableList = ['apple', null, 'banana', null];
  print('Nullable List: $nullableList');

  for (String? item in nullableList) {
    if (item != null) {
      print('  - $item');
    } else {
      print('  - (null)');
    }
  }

  // Map의 nullable 값
  Map<String, int?> nullableMap = {
    'Alice': 95,
    'Bob': null,
    'Charlie': 88,
  };

  print('\nNullable Map:');
  nullableMap.forEach((student, score) {
    String scoreText = score != null ? '$score점' : '점수 없음';
    print('  $student: $scoreText');
  });

  // ============================================
  // 9. 함수에서 Null Safety
  // ============================================
  print('\n[9. 함수에서 Null Safety]');
  print('------------------------------');

  // Nullable 매개변수
  greetUser('Alice');
  greetUser(null);

  // Nullable 반환값
  List<String> names = ['Alice', 'Bob', 'Charlie'];
  String? result = findName(names, 'Bob');
  print('\n찾기 결과: ${result ?? "없음"}');

  result = findName(names, 'David');
  print('찾기 결과: ${result ?? "없음"}');

  // ============================================
  // 10. 실전 예제
  // ============================================
  print('\n[10. 실전 예제]');
  print('------------------------------');

  // 예제 1: 사용자 정보 처리 (Map의 값 접근은 항상 nullable)
  Map<String, String?> userInfo = {
    'name': 'Alice',
    'email': 'alice@example.com',
    'phone': null,
  };

  print('사용자 정보:');
  print('  이름: ${userInfo['name'] ?? '없음'}');
  print('  이메일: ${userInfo['email'] ?? '없음'}');
  print('  전화번호: ${userInfo['phone'] ?? '없음'}');

  // 예제 2: 안전한 계산
  // (a ?? 0)은 null이 아닌 int이므로 결과도 int (int? 아님)
  int? a = findScore(true);
  int? b = findScore(false);
  int? c = findScore(true);

  int sum = (a ?? 0) + (b ?? 0) + (c ?? 0);
  print('\n안전한 계산:');
  print('  a: $a, b: $b, c: $c');
  print('  합계: $sum');

  // 예제 3: 리스트에서 null 필터링
  List<int?> numbers = [1, null, 3, null, 5];
  List<int> nonNullNumbers = [];

  for (int? number in numbers) {
    if (number != null) {
      nonNullNumbers.add(number);
    }
  }

  print('\nNull 필터링:');
  print('  원본: $numbers');
  print('  필터링 후: $nonNullNumbers');
}

// ============================================
// 함수 정의들
// ============================================

// 닉네임 찾기: 없으면 null 반환
// 함수 반환값은 컴파일러가 미리 알 수 없어 null 처리가 꼭 필요함
String? findNickname(bool hasNickname) => hasNickname ? '홍길동' : null;

// 점수 찾기: 없으면 null 반환
int? findScore(bool hasScore) => hasScore ? 10 : null;

// Nullable 매개변수와 기본값
void greetUser(String? userName) {
  String greeting = 'Hello, ${userName ?? 'Guest'}!';
  print(greeting);
}

// Nullable 반환값을 가진 함수
String? findName(List<String> names, String target) {
  for (String candidate in names) {
    if (candidate == target) {
      return candidate;
    }
  }
  return null;  // 찾지 못하면 null 반환
}

// late 필드를 가진 클래스
class UserProfile {
  String name;
  late String bio;  // 생성 시점이 아니라 나중에 초기화

  UserProfile(this.name);

  void loadBio() {
    bio = '$name의 자기소개입니다.';
  }
}
