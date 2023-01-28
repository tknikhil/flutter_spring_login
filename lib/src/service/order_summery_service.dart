
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_spring_login/src/model/order_summery.dart';

class OrderSummeryService{
  getOrderDetail(refNo) async{
    //  response =await http.post(
    //     Uri.parse('$testBaseUrl$loginPosts'),
    //     headers:<String, String>{
    //       "Content-type":"application/json"
    //     },
    //     body: JsonReq().orderDetailEncode(refNo)
    // );
    try{
    final response='{ "result": { "errNo": 200, "errMsg": "Success" }, "data": { "customerOrdrDtls": [ { "itemCode": "BC", "itemUnit": "grm", "refNo": "41", "rcvSample": false, "returnSample": false, "fixRate": "R0", "orderStatus": 2, "orderTyp": 1, "rowStatus": "Original", "itemPrice": 0.0, "orderDate": "2023-01-22", "custCode": "rajeev" } ] } }';
// final json=jsonDecode(response.body);
    final json=jsonDecode(response);
    print(json);
    final resultbody=json['result'];
    if(resultbody['errNo']==200){
      final json=jsonDecode(response);
      final getData = json['data'];
      final listResponse=getData['customerOrdrDtls'];
      print('$listResponse listResponse');
      // final orderval = OrderDetail.fromJson(listResponse);
      // print('$orderval orderval');
      final orderSummery= listResponse.map<OrderSummery>((e) => OrderSummery.fromJson(e)).toList()  as List<OrderSummery>;
      print('$orderSummery ===========ordersummery');
      return orderSummery;
    }else{
      // throw Exception('Unable to load data ${response.body}');
      throw Exception('Unable to load data ${response}');
    }
  }catch(err){
  if (kDebugMode) {
  print("Error :$err");
  }
  rethrow; //other wise it say's method has potential of returning null
  }

  }
}