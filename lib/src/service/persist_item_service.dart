import 'dart:convert';

import 'package:flutter_spring_login/src/constrainst/api_constraints.dart';
import 'package:flutter_spring_login/src/json_request/json_req.dart';
import 'package:http/http.dart' as http;

import 'login_service.dart';

class PersisItemService {
  Future saveItem(
      String itemName,
      double weight,
      String itemSize,
      int qty,
      double meltPer,
      String stamp,
      String hook,
      String designSample,
      String sizeSample,
      String refNo,
      String remark,
      int days,
      String dueDate) async {
    print(itemName);
    Object val;
    print('$baseUrl${LoginService.loginval.userCode.toString()}');
    final response = await http.post(
        Uri.parse('$baseUrl${LoginService.loginval.userCode.toString()}'),

        headers: <String, String>{"Content-type": "application/json"},
        body: JsonReq().saveItem(
            itemName,
            weight,
            itemSize,
            qty,
            meltPer,
            stamp,
            hook,
            designSample,
            sizeSample,
            refNo,
            remark,
            days,
            dueDate));


    final json =jsonDecode(response.body);
    print('$json========>saveItem');
    final resultBody=json['result'];
print('$resultBody====>saveItem');
    if(resultBody['errNo']==200){
      val=resultBody['errMsg'].toString();
      print(val);
    }else{
      val=resultBody['errMsg'].toString();
    }
return val;
  }
}
