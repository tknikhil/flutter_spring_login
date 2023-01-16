import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginService {
  final _baseUrl = "http://192.168.0.233:8081/";
  Future login(String username,String password) async {
    var val;

    await http.post(
        Uri.parse('${_baseUrl}salesorder/login'),
        headers:<String, String>{
          "Content-type":"application/json"
        },
        body: json.encode({
        "data": {
        "loginData": {
          'username': username!,
          'password': password!
        }}})
    ).then((value) =>{
    print (value),
      if(value.statusCode==200){
        val= "Success",

      }else{
       val="Error",
        print(value.body)
      }
    }
    ).onError((error, stackTrace) => {
      val=error
    }).timeout(const Duration(seconds: 10),onTimeout: ()=>{
      val="Error,TimeOut"
    });

return val;
    // print(res.body);
  }


}
