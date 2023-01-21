import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spring_login/src/constrainst/api_constraints.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '../json_request/json_req.dart';

// @lazySingleton
class LoginService {
  Future login(String username,String password) async {
    var val;

    await http.post(
        Uri.parse('$baseUrl$login_posts'),
        headers:<String, String>{
          "Content-type":"application/json"
        },
        body: JsonReq().loginEncode(username, password)
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
