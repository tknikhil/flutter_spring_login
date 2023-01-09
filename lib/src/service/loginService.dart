import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginService {
  var url = "http://10.0.2.2:9090/register";
  Future save(String email,String password) async {
    print("save()");
    var res = await http.post(
        Uri.parse(url),
        headers:<String, String>{"Content-type":"application/json"},
        body: json.encode({
          'email': email,
          'password': password
        })
    );
    print(res.body);
  }


}
