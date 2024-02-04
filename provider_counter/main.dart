import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

/// ChangeNotifierProvider
/// => 하위 위젯들에게 ChangeNotifier 인스턴스를 제공해주는 위젯
void main() {
  setupWindow();
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: const MyApp(),
    ),
  );
}

const double windowWidth = 360;
const double windowHeight = 640;

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Provider Counter');
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: windowWidth,
        height: windowHeight,
      ));
    });
  }
}
/// ChangeNotifier
/// => 구독자에게 변경 알림을 제공( 무언가가 ChangeNotifier에 속하면 변경사항 알릴 수 있음)
/// => ChangeNotifier에서 Counter의 상태 관리를 담당
/// => 앱의 UI의 변경과 관련된 모델 변경이 일어날 때 : notifyListeners() 호출
/// => Counter 클래스 내의 다른 코드들은 모델 그 자체와 비지니스 로직임

/// 개별 상태 클래스
class Counter with ChangeNotifier {
  int value = 0;
  /// 상태변경함수
  void increment() {
    value += 1;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),

            /// Consumer (최대한 깊숙한 안쪽에 위치하기 - 리빌드 자주 사용 x)
            /// => Counter 모델은 맨 위 ChangeNotifierProvider 선언을 통해 앱 내의 위젯에 공급됨
            /// => 그러므로 바로 사용 가능, 사용 시 Consumer 위젯 이용
            /// => Consumer.builder() : ChangeNotifier 가 변경 시 호출되는 함수
            /// => 즉, 모델에서 notifyListeners() 메소드를 호출하면 이에 대응하는 Consumer 위젯들의 모든 builder가 호출됨
            /// => context : 모든 빌드 메서드에서 볼 수 있는 Buildcontext
            /// => counter : ChangeNotifier의 인스턴스, 우리가 필요했던 것, 해당 데이터로 UI가 어떻게 보일지 선언형으로 작성 가능
            /// => child : 최적화에 사용
            Consumer<Counter>(
              builder: (context, counter, child) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// context.watch<State>
          /// => Provider.of<State>(context)와 동일
          /// => 빌드 메서드 내부에서만 사용 가능, notifyListeners()가 호출되면 위젯 리빌드됨
          /// => 해당 상태가 변경될 때마다 UI가 업데이트 되어야 하는 경우에 사용
          /// context.read<State>
          /// => Provider.of<State>(context, listen:false)와 동일
          /// => notifyListeners()가 호출되더라도 위젯 리빌드되지 않음
          /// => 해당 상태가 변경될 때마다 UI가 업데이트 필요 없는 경우, 상태를 변경하기 위한 메서드를 호출하는 경우에 사용
          var counter = context.read<Counter>();
          counter.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
