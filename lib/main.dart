import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/firebase_options.dart';
import 'package:flutter_sample_app/providers/auth_provider.dart';
import 'package:flutter_sample_app/screens/firebaseTest_screen.dart';
import 'package:flutter_sample_app/screens/list_screen.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  // main()이 비동기일 때, runApp() 시점에서 Flutter 엔진과 위젯의 바인딩이 미리 완료되도록 함
  WidgetsFlutterBinding.ensureInitialized();

  /// 파이어베이스 초기화 코드 추가
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthState>(create: (_) => AuthState()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const ListScreen(),
      
      /// 2, 개별 상태 클래스인 AuthState 이용
      // home: context.watch<AuthState>().token != null? const ListScreen()
      //     : const LoginScreen(),

      /// 3. 파이어베이스를 활용한 게시글 목록 출력
      // home: const FirebaseTestScreen(),
    );
  }
}