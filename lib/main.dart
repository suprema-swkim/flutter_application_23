// Flutter의 핵심 Material 디자인 위젯을 사용하기 위한 패키지 임포트
import 'package:flutter/material.dart';
// 로그인 페이지를 사용하기 위한 임포트
import 'pages/login_page.dart';

// 앱의 진입점 (Entry Point)
// Flutter 앱이 시작될 때 가장 먼저 실행되는 함수
void main() {
  runApp(const MyApp());
}

// 앱의 루트 위젯
// StatelessWidget: 상태가 변하지 않는 위젯
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp: Material 디자인을 사용하는 앱의 최상위 위젯
    return MaterialApp(
      title: 'Flutter Demo', // 앱의 제목
      debugShowCheckedModeBanner: false, // 디버그 모드 배너 숨김
      // 앱의 테마 설정
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // 보라색 기반 색상 테마
        useMaterial3: true, // Material 3 디자인 사용
      ),
      initialRoute: '/', // 앱이 시작될 때 표시할 초기 라우트
      // 앱에서 사용할 라우트(화면) 정의
      routes: {
        '/': (context) => const LoginPage(), // 루트 경로: 로그인 페이지
        '/home': (context) => const MyHomePage(title: '홈'), // 홈 경로: 메인 홈 페이지
      },
    );
  }
}

// 홈 페이지 위젯
// 로그인 성공 후 표시되는 메인 화면
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title; // 앱바에 표시될 제목

  @override
  Widget build(BuildContext context) {
    // Scaffold: Material 디자인의 기본 레이아웃 구조를 제공하는 위젯
    return Scaffold(
      // 상단 앱바 설정
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // 테마의 inversePrimary 색상 사용
        title: Text(title), // 앱바 제목
        // 앱바 우측에 표시될 액션 버튼들
        actions: [
          // 로그아웃 버튼
          IconButton(
            icon: const Icon(Icons.logout), // 로그아웃 아이콘
            tooltip: '로그아웃', // 툴팁 메시지
            onPressed: () {
              // 로그아웃 버튼 클릭 시 로그인 페이지로 이동 (뒤로가기 불가)
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      // 본문 영역
      body: Center(
        // 세로 방향으로 위젯을 배치하는 Column
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
          children: [
            // 성공 체크 아이콘
            Icon(
              Icons.check_circle_outline, // 체크 원형 아이콘
              size: 80, // 아이콘 크기
              color: Theme.of(context).colorScheme.primary, // 테마의 주요 색상 사용
            ),
            const SizedBox(height: 24), // 수직 간격 24픽셀
            // 메인 텍스트: 로그인 성공 메시지
            Text(
              '로그인 성공!',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold, // 굵은 글씨
                  ),
            ),
            const SizedBox(height: 8), // 수직 간격 8픽셀
            // 보조 텍스트: 환영 메시지
            Text(
              '환영합니다.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600], // 회색 톤의 색상
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
