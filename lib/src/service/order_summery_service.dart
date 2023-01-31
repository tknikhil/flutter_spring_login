
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_spring_login/src/constrainst/api_constraints.dart';
import 'package:flutter_spring_login/src/model/order_summery.dart';
import 'package:http/http.dart' as http;

class OrderSummeryService{
  static var orderSummery;
 Future<dynamic> getOrderDetail(refNo) async{
    //  response =await http.post(
    //     Uri.parse('$testBaseUrl$loginPosts'),
    //     headers:<String, String>{
    //       "Content-type":"application/json"
    //     },
    //     body: JsonReq().orderDetailEncode(refNo)
    // );
    try{
    final response='{"result": {"errNo": 200,"errMsg": "Success"},"data": {"custOrdrDtlsByRefNo": {"itemCode": "BC","itemUnit": "grm","weight": 23.0,"qty": 1,"itemSize": "ss","meltPer": 92.0,"hook": "U","stamp": "NK916","refNo": "41","designSample": "payal","sizeSample": "payal","days": 4,"dueDate": "2023-01-26","workshop": "jamil","rcvSample": false,"returnSample": false,"fixRate": "R0","status": "Assigned","orderTyp": 1,"orderNo": 4,"rowStatus": "Original","itemPrice": 0.0,"orderDate": "2023-01-22","custName": "rajeev","type": "Order"}}}';
    //   final uri= Uri.parse('$baseUrl$dsplyOrdrDtl/$refNo');
    //   print(uri);
    //   final response= await http.get(uri);
    //   final json=jsonDecode(response.body);

    final json=jsonDecode(response);
    print(json);
    final resultbody=json['result'];
    if(resultbody['errNo']==200){
      // final json=jsonDecode(response.body);
      final json=jsonDecode(response);
      final getData = json['data'];
      final listResponse=getData['custOrdrDtlsByRefNo'];
      print('$listResponse listResponse');
      // final orderval = OrderDetail.fromJson(listResponse);
      // print('$orderval orderval');
      // final orderSummery= listResponse.map<OrderSummery>((e) => OrderSummery.fromJson(e)).toList as List<OrderSummery>;
      print("====>${OrderSummery.fromJson(listResponse).itemUnit.toString()}  Order Summery ItemUnit");
       orderSummery=OrderSummery.fromJson(listResponse);
      print('${orderSummery.itemUnit} ===========ordersummery');
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