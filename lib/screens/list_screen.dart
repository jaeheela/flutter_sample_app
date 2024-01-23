import 'package:flutter/material.dart';
import 'package:flutter_sample_app/models/cat.dart';
import 'package:flutter_sample_app/screens/login_screen.dart';
import 'package:flutter_sample_app/screens/search_screen.dart';
import 'package:flutter_sample_app/screens/signup_screen.dart';
import 'package:flutter_sample_app/screens/detail_screen.dart';
import 'package:flutter_sample_app/screens/upload_screen.dart';

final List<Cat> cats = [
  Cat(
      id: "0",
      name: "별님이",
      title: "오늘의 귀염둥이",
      link: "assets/images/cat_00.jpg",
      likeCount: 1930,
      replyCount: 11,
      created: DateTime(2022, 11, 13, 22, 14, 53, 982)),
  Cat(
      id: "1",
      name: "별님이",
      title: "오늘의 예쁜이",
      link: "assets/images/cat_01.jpg",
      likeCount: 1930,
      replyCount: 11,
      created: DateTime(2022, 11, 13, 22, 14, 53, 982)),
  Cat(
      id: "2",
      name: "별님이",
      title: "오늘의 기쁨이",
      link: "assets/images/cat_02.jpg",
      likeCount: 1930,
      replyCount: 11,
      created: DateTime(2022, 11, 13, 22, 14, 53, 982)),
  Cat(
      id: "3",
      name: "별님이",
      title: "오늘의 행복이",
      link: "assets/images/cat_03.jpg",
      likeCount: 1930,
      replyCount: 11,
      created: DateTime(2022, 11, 13, 22, 14, 53, 982)),
  Cat(
      id: "4",
      name: "별님이",
      title: "오늘의 슬픔이",
      link: "assets/images/cat_04.jpg",
      likeCount: 1930,
      replyCount: 11,
      created: DateTime(2022, 11, 13, 22, 14, 53, 982)),
];

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  /// Scaffold.of() 대신 Scaffold 위젯이 직접 참조할 수 있는 키(GlobalKey)를 사용
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,

      /// App Bar
      appBar: AppBar(
        title: const Text("Daily Cats"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            //Scaffold.of(context).openDrawer(); //error
            _scaffoldKey.currentState?.openDrawer();

            /*
            /// 메뉴 버튼이 클릭되었을 때 실행될 코드

            */
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),

            /// 카메라 클릭 시 업로드화면으로 이동
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const UploadScreen(),
              );
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Daily cats',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        '라재희님 안녕하세요',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('sign up'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('search'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      ///Body
      body: GridView.builder(
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 10.0,
          right: 10.0,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        itemCount: cats.length,
        itemBuilder: (_, index) => GestureDetector(
          ///고양이 클릭 시 상세화면으로 이동
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(cat: cats[index]),
              ),
            );
          },
          child: Image.asset(
            cats[index].link,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
