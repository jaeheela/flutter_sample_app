import 'package:flutter/material.dart';
/**
 * 상태 넘기기의 단점
 * => 단방향적, 부모 위젯에서 자식 위젯 방향으로만 상태 넘기기 가능하며 그 반대는 불가능
 * => 위젯 트리가 복잡해지면 같은 상태를 조부모 위젯에서 손자 위젯 방향으로 여러번 넘겨 주어야 하므로, 불편
 * */
void main() => runApp(WidgetApp());

class WidgetApp extends StatelessWidget {
  const WidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WidgetApp Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String color="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 상태 변경
    // 주의: setState()를 호출할 수 있는 타이밍 아님,
    // 하지만 UI가 아직 생성 전이므로 여기서 수정한 값들은 UI에 반영됨
    color="블루";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("잠깐!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "내가 좋아하는 색깔은 $color"
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          color: color,
                        ),
                    ),
                  );
                },
                child: Text("내가 좋아하는 색깔은?"),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.color});
  final String color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("정답!"),
      ),
      body: Center(
        child: Text(
          color,
        ),
      ),
    );
  }
}


