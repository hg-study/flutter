import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _authService = AuthService();
  Map<String, dynamic>? _userInfo;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // 화면이 로드될 때 사용자 정보 가져오기
    _loadUserInfo();
  }

  // 사용자 정보 로드 함수
  Future<void> _loadUserInfo() async {
    setState(() {
      _isLoading = true;
    });

    final userInfo = await _authService.getUserInfo();

    // await 후에는 화면이 이미 사라졌을 수 있으므로 mounted 확인
    if (!mounted) return;

    setState(() {
      _userInfo = userInfo;
      _isLoading = false;
    });
  }

  // 로그아웃 처리 함수
  Future<void> _handleLogout() async {
    // 로그아웃 API 호출
    await _authService.logout();
    
    // 화면이 아직 마운트되어 있는지 확인
    if (mounted) {
      // 로그인 화면으로 이동
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('홈'),
        actions: [
          // 로그아웃 버튼
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _handleLogout,
            tooltip: '로그아웃',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _userInfo == null
              // 재시도 후에도 실패한 경우: 재시도 버튼 + 로그인 화면 이동 버튼 제공
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('사용자 정보를 불러올 수 없습니다'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadUserInfo,
                        child: const Text('재시도'),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text('로그인 화면으로'),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '사용자 정보',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 16),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '사용자명: ${_userInfo!['username']}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '권한: ${_userInfo!['role']}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}

