import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

Future loginUser(String username, String password) async {
  final String url = "http://zealenergyindustries.com/new/api/user/login";
  Map<String, dynamic> map = new Map<String, dynamic>();
  map["email"] = username;
  map["password"] = password;

  var dio = Dio();
  dio.options.headers[HttpHeaders.acceptHeader] = "application/json";
  dio.options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
  var formData = FormData.fromMap(map);
  print("vatsalsh " + formData.toString());
  var response = await dio.post(url, data: formData);
  print(json.decode(response.toString())['status']);
  if (json.decode(response.toString())['status']) {
  } else {
    // print(CustomTrace(StackTrace.current, message: response.toString())
    //     .toString());

    throw new Exception(response.toString());
  }

  return json.decode(response.toString())['success'];
}
