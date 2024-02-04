import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      ///AppBar
      appBar: AppBar(
        title: Text('LOGIN', textAlign: TextAlign.center),
        centerTitle: true,
      ),

      ///Body
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: const TextField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "이메일",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
              ),
              Container(
                width: 300,
                child: const TextField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "비밀번호",
                  ),
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                ),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("제출"),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
