import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class ApiService {
  // ═══════════════════════════════════════════════════════════════
  // ★★★ 서버 주소 설정 (수업 필독!) ★★★
  //
  // 1) 에뮬레이터로 실행하는 경우:
  //    - 아무것도 안 해도 됩니다. 기본값 10.0.2.2 사용.
  //    - 10.0.2.2 는 "에뮬레이터에서 PC의 localhost에 접근하는 특수 주소"입니다.
  //
  // 2) 실제 기기(핸드폰)로 실행하는 경우:
  //    - PC와 핸드폰이 같은 Wi-Fi에 연결되어 있어야 합니다.
  //    - PC의 IP를 확인한 뒤(예: ipconfig → YOUR_PC_IP) 아래처럼 실행:
  //      flutter run --dart-define=SERVER_IP=YOUR_PC_IP
  // ═══════════════════════════════════════════════════════════════
  static const String _serverIp =
      String.fromEnvironment('SERVER_IP', defaultValue: '10.0.2.2');

  // 백엔드 서버 주소
  static const String baseUrl = 'http://$_serverIp:8090';
  
  // 싱글톤 인스턴스
  static ApiService? _instance;
  
  // Dio 인스턴스와 쿠키 관리자
  late Dio _dio;
  late PersistCookieJar _cookieJar;
  bool _initialized = false;

  // 싱글톤 생성자
  ApiService._internal();

  // 싱글톤 인스턴스 가져오기
  static ApiService get instance {
    _instance ??= ApiService._internal();
    return _instance!;
  }

  // 비동기 초기화 (앱 시작 시 한 번만 호출)
  Future<void> initialize() async {
    if (_initialized) return;
    
    // 영구 쿠키 저장소 초기화
    final appDocDir = await getApplicationDocumentsDirectory();
    final cookiePath = '${appDocDir.path}/.cookies';
    _cookieJar = PersistCookieJar(
      storage: FileStorage(cookiePath),
    );
    
    // Dio 인스턴스 초기화
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      // 첫 로그인 요청은 서버의 BCrypt 암호 검증 때문에 오래 걸릴 수 있어 넉넉하게 15초
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
      },
      // 쿠키를 포함하여 요청 전송 (CookieManager가 자동 처리)
      followRedirects: true,
      // 참고: validateStatus를 따로 설정하지 않으면 4xx 응답은 DioException으로 던져집니다.
      // 그래야 auth_service에서 서버가 보내준 에러 메시지(e.response.data)를 꺼내 쓸 수 있습니다.
    ));

    // 쿠키 관리자 추가 (자동으로 쿠키 저장/전송)
    _dio.interceptors.add(CookieManager(_cookieJar));

    // 디버깅을 위한 로깅 인터셉터 추가
    // 주의: 비밀번호/토큰이 로그에 그대로 찍히므로 반드시 "디버그 모드 전용"으로만 사용!
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ));
    }
    
    _initialized = true;
  }

  // Dio 인스턴스를 외부에서 사용할 수 있도록 getter 제공
  Dio get dio {
    if (!_initialized) {
      throw Exception('ApiService가 초기화되지 않았습니다. initialize()를 먼저 호출하세요.');
    }
    return _dio;
  }
  
  // 쿠키 초기화 (로그아웃 시 사용)
  Future<void> clearCookies() async {
    if (_initialized) {
      await _cookieJar.deleteAll();
    }
  }
}

