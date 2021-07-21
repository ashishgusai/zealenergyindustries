import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final String gloabalUrl = "http://zealenergyindustries.com/new/api/";
final adminProfile = "user/getmyprofile";
final userLogin = "user/login";
final employeeDetails = "Employee/employeelist";

dynamic postApiCall(String method, Map<String, String> params) async {
  return await http
      .post(
    Uri.parse(gloabalUrl + method),
    body: params,
  )
      .then((http.Response response) {
    print(response.body);
    return json.decode(response.body);
  });
}

dynamic postApiCallProfile(String method) async {
  final prefs = await SharedPreferences.getInstance();
  //var xtoken = prefs.getString("token");
  String xToken = "";
  if (prefs.containsKey("token") && prefs.getString("token") != null) {
    xToken = prefs.getString("token")!;
  }
  return await http.post(
    Uri.parse(gloabalUrl + method),
    headers: {'xtoken': xToken},
  ).then((http.Response response) {
    print(response.body);
    return json.decode(response.body);
  });
}
