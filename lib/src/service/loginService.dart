import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginService {
  var url = "http://10.0.2.2:9090/login";
  Future login(String email,String password) async {
    var val;
    print("save()");
    await http.post(
        Uri.parse(url),
        headers:<String, String>{"Content-type":"application/json"},
        body: json.encode({
          'email': email,
          'password': password
        })
    ).then((value) =>{
    print (value.statusCode),
      if(value.statusCode==200){
        val= "Success",

      }else{
       val="Error"
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
