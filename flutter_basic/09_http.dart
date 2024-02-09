import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  getData();
}

/// https://cat-fact.herokuapp.com/facts/random?animal_type=cat
Future<void> getData() async{
  final Uri uri = Uri.https("cat-fact.herokuapp.com","facts/random",{"animal_type":"cat"});
  //print("uri : $uri");

  /// http 요청과 응답이 이루어짐
  /// await 통해 HTTP 응답이 올 때 까지 기다림
  final http.Response response = await http.get(uri);

  final int statusCode = response.statusCode;

  /// => JSON 타입으로 받음
  /// => JSON의 Value로 올 수 있는 타입: int, double, String, true, List, Map
  /// => Map 객체 등 JSON이 될 수 있는 변수 [JSON]으로 변환 - 문자열화, 직렬화라고도 함
  /// => JSON을 대응되는 타입의 [변수]로 변환 - 파싱, 역직렬화라고도 함
  final Map<String, dynamic> body = jsonDecode(response.body);

  //print("Satus Code : $statusCode");
  print("Response body : ${response.body}");
  print("Response body : ${body["text"]}");


}