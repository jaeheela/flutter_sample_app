import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseTestScreen extends StatefulWidget {
  const FirebaseTestScreen({super.key});

  @override
  State<FirebaseTestScreen> createState() => _FirebaseTestScreenState();
}

class _FirebaseTestScreenState extends State<FirebaseTestScreen> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference rootRef = FirebaseDatabase.instance.ref();
  List<dynamic> boardList = [];
  

  @override
  void initState() {
    super.initState();

    /// 데이터베이스에서 데이터를 가져와서 데이터가 있는지 확인하며,
    /// 데이터가 존재하면 Flutter 위젯의 상태를 검색한 데이터로 업데이트
    rootRef.get().then((snapshot) {
      if(snapshot.exists){
        setState(() {
          boardList = snapshot.value as List ?? [];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("파이어베이스를 활용한 게시글 목록"),
      ),
      body: Column(
        children: boardList.map((e) => Text(e["title"])).toList(),
      ),
    );
  }
}
