import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_sample_app/providers/auth_provider.dart';
import 'package:flutter_sample_app/screens/list_screen.dart';
import 'package:flutter_sample_app/screens/login_screen.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }


void main() async {
  // main()이 비동기일 때, runApp() 시점에서 Flutter 엔진과 위젯의 바인딩이 미리 완료되도록 함
  WidgetsFlutterBinding.ensureInitialized();
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
      // home: context.watch<AuthState>().token != null? const ListScreen()
      //     : const LoginScreen(),
    );
  }
}