import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/main.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'provider Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const ListScreen(),
      // home: context.watch<AuthState>().token != null? const ListScreen()
      //     : const LoginScreen(),
    );
  }
}
// CartModel(개별 상태 클래스)
// => 상태값 (_로 시작하는 private 프로퍼티)
// => 상태값 getter (변수명 앞에 get 붙음)
// => 상태 변경 함수 (반드시 notifyListeners()를 호출)

//ChangeNotifier 클래스
// => 구독자에게 변경 알림을 제공( 무언가가 ChangeNotifier에 속하면 변경사항 알릴 수 있음)
// => ChangeNotifier에서 카트의 상태 관리를 담당
// => 앱의 UI의 변경과 관련된 모델 변경이 일어날 때 : notifyListeners() 호출
// => CartModel 클래스 내의 다른 코드들은 모델 그 자체와 비지니스 로직임

class Item {
}

class CartModel extends ChangeNotifier{

  //카트의 내부, 프라이빗 상태
  final List<Item> _items =[];
  //카드 내부 항목에 대한 변경 불가능한 뷰(UnmodifiableListView)
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  //현재 카트에 있는 모든 항목들의 가격 합계(모든 항목의 가격이 $42라고 가정)
  int get totalPrice => _items.length = 42;

  //카트에 [items] 추가
  // add()와 removeAll()만이 바깥에서 카트를 수정할 수 있음
  void add(Item item){
    _items.add(item);
    notifyListeners(); //이 모델을 Listen 중인 Widget이 리빌드하도록 함
  }

  void removeAll(){
    _items.clear();
    notifyListeners();//이 모델을 Listen 중인 Widget이 리빌드하도록 함
  }

}

