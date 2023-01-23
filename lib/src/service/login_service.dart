import 'dart:async';

import 'package:flutter_spring_login/src/constrainst/api_constraints.dart';
import 'package:http/http.dart' as http;

import '../json_request/json_req.dart';

// @lazySingleton
class LoginService {
  Future login(String username,String password) async {
    Object? val;

    await http.post(
        Uri.parse('$baseUrl$loginPosts'),
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
