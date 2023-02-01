import 'dart:async';
import 'dart:convert';

import 'package:flutter_spring_login/src/constrainst/api_constraints.dart';
import 'package:flutter_spring_login/src/model/login.dart';
import 'package:flutter_spring_login/src/model/result_body.dart';
import 'package:http/http.dart' as http;

import '../json_request/json_req.dart';

// @lazySingleton
class LoginService {
  late final response;
  static var  loginval;
  Future login(String username,String password) async {
    Object val;

    //  response =await http.post(
    //      Uri.parse('$baseUrl$loginPosts'),
    //     headers:<String, String>{
    //       "Content-type":"application/json"
    //     },
    //     body: JsonReq().loginEncode(username, password)
    // );
    response = '{"result":{"errNo":200,"errMsg":"Login Success"},"data":{"userDetails":{"userName":"Test User1","groupNo":3,"userCode":"TestUSer"}}}';
    final json=jsonDecode(response);
    // final json=jsonDecode(response.body);
    print(json);
    final resultbody = json['result'];
print(resultbody);
print(resultbody['errNo']);
print(resultbody['errNo']==200);
     if(resultbody['errNo']==200){

       print('login success');
       val='Success';
       loginResponse();
     }else{
       print('login failed');
       val='Error';
     }
     return val;

    // print ("${response} Post Login response");
    // print ("${response.body} Post Login");
    // final json=jsonDecode(response.body);
    // // final customer=jsonDecode(response.);
    // final resultbody = json['result'];
    // final loginData=json['data'];
    // print('$loginData Login Data');
    // final customerDate = loginData['userDtls'];
    // print('$customerDate customer Data');
    // print('$resultbody login result');
    // final customerVal=customerDate.map<Login>((e)=>Login.fromJson(e)).toList() as List<Login>;
    // return customerVal;
    // if(resultbody['errNo']==200){
    //   val= "Success";
    // }else{
    //   val="Error";
    // }

    // ).then((value) =>{
    // print (value),
    //   if(value.statusCode==200){
    //     val= "Success",
    //
    //   }else{
    //    val="Error",
    //   }
    //  }
    // ).onError((error, stackTrace) => {
    //   val=error
    // }).timeout(const Duration(seconds: 10),onTimeout: ()=>{
    //   val="Error,TimeOut"
    // });

// return val;
    // print(res.body);
  }

  loginResponse() {
    // print ("${response} Post Login response");
    // print ("${response} Post Login");
    final json=jsonDecode(response);
    // final json=jsonDecode(response.body);
    // final customer=jsonDecode(response);
    final resultbody = json['result'];
    final loginData=json['data'];
    // print('$loginData Login Data');
    final customerDate = loginData['userDetails'];
     print('$customerDate customer Data');
    // print('$resultbody login result');
    print('${Login.fromJson(customerDate).userName.toString()} Customer Name');
    loginval = Login.fromJson(customerDate);
    // final loginval = Login(Login.fromJson(customerDate).userCode.toString(), Login.fromJson(customerDate).groupNo?.toInt(), Login.fromJson(customerDate).userName.toString());
    // loginval.userName=Login.fromJson(customerDate).userName.toString();
    // loginval.userCode=Login.fromJson(customerDate).userCode.toString();
    // loginval.groupNo=Login.fromJson(customerDate).groupNo?.toInt();
     print('${loginval.userName} username');
     return loginval;
  }







}
