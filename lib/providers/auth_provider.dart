import 'package:flutter/material.dart';

// AuthState(개별 상태 클래스)
// - 상태값 (_로 시작하는 private 프로퍼티)
// - 상태값 getter (변수명 앞에 get 붙음)
// - 상태 변경 함수 (반드시 notifyListeners()를 호출)
class AuthState with ChangeNotifier {
  String? _token;
  String? get token => _token;

  void setToken(String newToken){
    _token = newToken;
    notifyListeners();
  }

  void clearToken(){
    _token = null;
    notifyListeners();
  }
}