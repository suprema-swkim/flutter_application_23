/// 로그인 페이지
/// 이메일과 비밀번호를 입력받아 사용자 인증을 처리하는 페이지
import 'package:flutter/material.dart';

/// 로그인 페이지 위젯
/// StatefulWidget을 사용하여 폼 입력 및 로딩 상태를 관리
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

/// LoginPage의 상태 관리 클래스
class _LoginPageState extends State<LoginPage> {
  // Form 위젯의 상태를 제어하기 위한 GlobalKey
  final _formKey = GlobalKey<FormState>();

  // 이메일 입력 필드 컨트롤러
  final _emailController = TextEditingController();

  // 비밀번호 입력 필드 컨트롤러
  final _passwordController = TextEditingController();

  // 로딩 상태를 나타내는 변수
  bool _isLoading = false;

  // 비밀번호 표시/숨김 상태를 나타내는 변수
  bool _obscurePassword = true;

  @override
  void dispose() {
    // 메모리 누수 방지를 위해 컨트롤러 해제
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// 이메일 유효성 검사 함수
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '이메일을 입력해주세요';
    }
    // 이메일 형식 정규식 검사
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return '올바른 이메일 형식이 아닙니다';
    }
    return null;
  }

  /// 비밀번호 유효성 검사 함수
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력해주세요';
    }
    if (value.length < 6) {
      return '비밀번호는 6자 이상이어야 합니다';
    }
    return null;
  }

  /// 로그인 처리 함수
  Future<void> _handleLogin() async {
    // 폼 유효성 검사
    if (_formKey.currentState!.validate()) {
      // 로딩 상태 시작
      setState(() {
        _isLoading = true;
      });

      // 로그인 처리 시뮬레이션 (2초 대기)
      await Future.delayed(const Duration(seconds: 2));

      // 위젯이 여전히 마운트되어 있는지 확인
      if (!mounted) return;

      // 로딩 상태 종료
      setState(() {
        _isLoading = false;
      });

      // 홈 페이지로 이동 (현재 페이지를 히스토리에서 제거)
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    // 화면의 색상 스킴 가져오기
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      // 키보드가 올라올 때 화면이 넘치는 것을 방지
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 로고 또는 아이콘
                  Icon(
                    Icons.lock_outline,
                    size: 80,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(height: 24),

                  // 환영 텍스트
                  Text(
                    '로그인',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    '계정에 로그인하세요',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(height: 48),

                  // 이메일 입력 필드
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    enabled: !_isLoading,
                    decoration: InputDecoration(
                      labelText: '이메일',
                      hintText: 'example@email.com',
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                    ),
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 16),

                  // 비밀번호 입력 필드
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.done,
                    enabled: !_isLoading,
                    decoration: InputDecoration(
                      labelText: '비밀번호',
                      hintText: '6자 이상 입력하세요',
                      prefixIcon: const Icon(Icons.lock_outlined),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                    ),
                    validator: _validatePassword,
                    onFieldSubmitted: (_) {
                      if (!_isLoading) {
                        _handleLogin();
                      }
                    },
                  ),
                  const SizedBox(height: 8),

                  // 비밀번호 찾기 텍스트 버튼
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: _isLoading
                          ? null
                          : () {
                              // 비밀번호 찾기 기능 구현 예정
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('비밀번호 찾기 기능은 준비 중입니다'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                      child: const Text('비밀번호를 잊으셨나요?'),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 로그인 버튼
                  FilledButton(
                    onPressed: _isLoading ? null : _handleLogin,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            '로그인',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  const SizedBox(height: 16),

                  // 회원가입 안내
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '계정이 없으신가요?',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                      ),
                      TextButton(
                        onPressed: _isLoading
                            ? null
                            : () {
                                // 회원가입 기능 구현 예정
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('회원가입 기능은 준비 중입니다'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                        child: const Text(
                          '회원가입',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
