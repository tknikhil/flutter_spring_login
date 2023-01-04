import 'dart:convert';
import 'dart:async';
import 'package:flutter_spring_login/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginService {
  User user = User("", "");
  var url = "http://10.0.2.2:9090/register";
  //need to work
  Future save(String email,String password) async {
    print("save()");
    var res = await http.post(
        Uri.parse(url),
        headers:<String, String>{"Content-type":"application/json"},
        body: json.encode({
          'email': user.email,
          'password': user.password
        })
    );
    print(res.body);
  }


}
