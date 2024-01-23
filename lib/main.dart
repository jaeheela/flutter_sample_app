import 'package:flutter/material.dart';
import 'package:flutter_sample_app/screens/list_screen.dart';

/***
 * flutter widget 
 * - 코드 관점에서 모든 위젯은 Stateless 혹은 Stateful 위젯 등의 클래스를 상속받은 클래스
 * - 바깥으로부터 입력된 필드값과 상태에 따라 다르게 보임
 * - 개발자가 직접 UI를 변경하지 않음, 단지 UI의 최종 결과에 해당하는 모습을 위젯끼리 결합해 만듦
 * - 선언형 UI : =상태의 함수 ,  f(state) , 변경될 수 있는 특별한 변수와 상태를 사용 - 상태가 변경되면 위젯이 스스로 업데이트함
 * - 위젯 변경 시 최소한의 변경만 수행
 *
 * Stateless 위젯
 * - 상태 미포함 위젯, Provider 등 전역 상태 사용 가능
 * - build(BuildContext context) : 완성된 위젯 타입의 UI 반환
 * Stateful 위젯
 * - 상태 포함 위젯, 위젯 본체와 위젯 상태가 별개의 클래스로 구분됨
 * - 위젯 본체 클래스 (extends StateulWidget) & 위젯 상태 클래스 (extends State<>) : 로직 및 UI 작성
 * - build(BuildContext context) : State 클래스의 인스턴스에 존재, 완성된 위젯 타입의 UI 반환
 * 상태관리
 * - createState() : 위젯 내부에서 상태 생성, 템플릿에서 굳이 수정 필요 없음
 * - initState() : 상태 초기화함
 * - setState((){}) : 상태변경 시, 해당 메서드의 콜백함수 내에 상태 변경 로직을 넣어야 UI에 반영됨, 플러터에게 이 객체의 내부 상태가 변경되었다는 것을 알림
 * - setStae를 호출하다 = 이 객체의 내부 상태가 하위 트리의 UI의 영향을 끼칠 수 있는 방식으로 변경되었다 = 플러터가 해당 State 객체를 위한 새로운 빌드를 스케줄링 하다
 * - 만약 setState 없이 상태를 변경한다면? 플러터는 새로운 빌드를 스케줄링 하지 않으며, 하위 트리가 새로운 상태를 반영하기 위해 업데이트 되지 않음
 * -
 * -
 *
 * flutter 위젯
 * 기본(자식 필요 x) : Text, Icon, Image
 * 레이아웃(자식 필요) : Container, Row, Column, Stack, Padding, Flex, Align, SizedBox, ListView, GridView, SingleChildScrollView, AspectRatio
 * 입력, 폼 : ElevatedButton, Radio, Switch, Checkbox, TextField, TextFormField
 * 머티리얼 구성요소, 제스처, 기타 : MaterialApp, Material, Scaffold, AppBar, BottomNavigationBar, GestureDetector
 * **/
void main() {
  runApp(const MyApp());
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
    );
  }
}