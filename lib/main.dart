/// Flutter 애플리케이션의 메인 진입점
/// Material Design 컴포넌트를 사용하기 위한 패키지 import
import 'package:flutter/material.dart';
import 'pages/login_page.dart';

/// 애플리케이션의 진입점 함수
/// Flutter 앱이 시작될 때 가장 먼저 실행됨
void main() {
  // MyApp 위젯을 루트 위젯으로 설정하여 앱 실행
  runApp(const MyApp());
}

/// 애플리케이션의 루트 위젯
/// StatelessWidget을 상속받아 상태를 가지지 않는 위젯으로 구현
/// MaterialApp을 반환하여 앱의 전역 설정을 담당
class MyApp extends StatelessWidget {
  /// 생성자 - key 파라미터를 부모 클래스로 전달
  const MyApp({super.key});

  /// 위젯의 UI를 구성하는 메서드
  /// BuildContext를 통해 위젯 트리의 위치 정보를 받음
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 앱의 제목 (앱 전환 화면 등에서 표시됨)
      title: 'Flutter Demo',
      // 디버그 모드 배너 숨김 (화면 우측 상단의 "DEBUG" 배너)
      debugShowCheckedModeBanner: false,
      // 앱의 전역 테마 설정
      theme: ThemeData(
        // deepPurple을 시드 컬러로 사용하여 조화로운 색상 스킴 생성
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // Material Design 3 사용 (최신 디자인 시스템)
        useMaterial3: true,
      ),
      // 앱이 시작될 때 보여줄 초기 라우트 경로
      initialRoute: '/',
      // Named Routes 설정
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const MyHomePage(title: 'Flutter Demo Home'),
      },
    );
  }
}

/// 홈 페이지 위젯
/// 로그인 성공 후 표시되는 메인 화면
/// StatelessWidget으로 구현되어 상태를 가지지 않음
class MyHomePage extends StatelessWidget {
  /// 생성자 - title은 필수 파라미터로 받음
  const MyHomePage({super.key, required this.title});

  /// 앱바에 표시될 제목
  final String title;

  /// 위젯의 UI를 구성하는 메서드
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 상단 앱바 영역
      appBar: AppBar(
        // 테마의 inversePrimary 색상을 배경색으로 사용
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // 앱바 제목 표시
        title: Text(title),
        // 앱바 우측 액션 버튼들
        actions: [
          IconButton(
            // 로그아웃 아이콘
            icon: const Icon(Icons.logout),
            // 버튼 위에 마우스를 올렸을 때 보여줄 툴팁
            tooltip: '로그아웃',
            // 버튼 클릭 시 실행될 콜백 함수
            onPressed: () {
              // 루트 경로('/')로 이동하면서 현재 화면을 히스토리에서 제거
              // 뒤로가기로 다시 돌아올 수 없도록 함
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      // 메인 컨텐츠 영역
      body: Center(
        // 세로 방향으로 위젯들을 배치하는 Column
        child: Column(
          // 자식 위젯들을 세로 중앙에 정렬
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 체크 마크 아이콘 (로그인 성공 표시)
            Icon(
              Icons.check_circle_outline,
              size: 80,
              // 테마의 primary 색상 사용
              color: Theme.of(context).colorScheme.primary,
            ),
            // 위젯 사이 간격 (높이 24)
            const SizedBox(height: 24),
            // "로그인 성공!" 텍스트
            Text(
              '로그인 성공!',
              // 테마의 headlineMedium 스타일에 굵은 폰트 적용
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            // 위젯 사이 간격 (높이 8)
            const SizedBox(height: 8),
            // "환영합니다." 텍스트
            Text(
              '환영합니다.',
              // 테마의 bodyLarge 스타일에 회색 색상 적용
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
