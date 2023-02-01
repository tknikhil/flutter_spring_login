import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_spring_login/src/constrainst/constraints.dart';
import 'package:flutter_spring_login/src/model/model.dart';
import 'package:http/http.dart' as http;

import 'login_service.dart';
class OrderService{
//
//   // // String? stringResponce;
//   // Map? mapResponse;
//   // Map? dataResponse;
//   // List? listResponse;
//   // List? orderDetails;
//   //
//   // List? screenOnLoad() {
//   //   var val;
//   //   http.Response response;
//   //   // response= await http.get(Uri.parse('${_baseUrl}orderdetails/srcOnLoadOrderDtl'));
//   //   response=  http.get(Uri.parse('$testBaseUrl')) as http.Response;
//   //   if(response.statusCode==200){
//   //       // stringResponce=response.body;
//   //       mapResponse=json.decode(response.body);
//   //       listResponse=mapResponse?['data'];
//   //       orderDetails= listResponse?.map((e) => OrderDetail.fromJson(e)).toList();
//   //
//   //       print(listResponse.toString()+"screenOnLoad()");
//   //
//   //     return orderDetails;
//   //   }
//   //   return orderDetails;
//   // }
//
//   final Dio _dio=Dio();
   getScreenOnLoad() async{
     //  response =await http.post(
     //     Uri.parse('$testBaseUrl$loginPosts'),
     //     headers:<String, String>{
     //       "Content-type":"application/json"
     //     },
     //     body: JsonReq().customerOrderEncode(usercode, groupno)
     // );
    try{
       // final uri= Uri.parse('$baseUrl$custOrdrDsplyUrl/${LoginService.loginval.userCode.toString()}');
      // final uri= Uri.parse(testBaseUrl);
      // if (kDebugMode) {
      //   print(uri);
      // }
      //  final response= await http.get(uri);
      final response ='{ "result": { "errNo": 200, "errMsg": "Success" }, "data": { "customerOrdrDtls": [ { "itemCode": "BC", "itemUnit": "grm", "refNo": "41", "rcvSample": false, "returnSample": false, "fixRate": "R0", "orderStatus": 2, "orderTyp": 1, "rowStatus": "Original", "itemPrice": 0.0, "orderDate": "2023-01-22", "custCode": "rajeev" }, { "itemCode": "CRT", "itemUnit": "grm", "refNo": "42", "rcvSample": false, "returnSample": false, "fixRate": "R0", "orderStatus": 2, "orderTyp": 1, "rowStatus": "Original", "itemPrice": 0.0, "orderDate": "2023-01-22", "custCode": "rajeev" }, { "itemCode": "NWB", "itemUnit": "grm", "refNo": "43", "rcvSample": false, "returnSample": false, "fixRate": "R0", "orderStatus": 2, "orderTyp": 1, "rowStatus": "Original", "itemPrice": 0.0, "orderDate": "2023-01-22", "custCode": "rajeev" }, { "itemCode": "BC", "itemUnit": "grm", "refNo": "25", "rcvSample": false, "returnSample": false, "fixRate": "R0", "orderStatus": 2, "orderTyp": 1, "rowStatus": "Original", "itemPrice": 0.0, "orderDate": "2023-01-21", "custCode": "rajeev" }, { "itemCode": "NWB", "itemUnit": "grm", "refNo": "24", "rcvSample": false, "returnSample": false, "fixRate": "R0", "orderStatus": 3, "orderTyp": 1, "rowStatus": "Original", "itemPrice": 0.0, "orderDate": "2023-01-21", "custCode": "rajeev" }, { "itemCode": "NWB", "itemUnit": "grm", "refNo": "24", "rcvSample": false, "returnSample": false, "fixRate": "R0", "orderStatus": 3, "orderTyp": 1, "rowStatus": "Original", "itemPrice": 0.0, "orderDate": "2023-01-21", "custCode": "rajeev" }, { "itemCode": "NWB", "itemUnit": "grm", "refNo": "24", "rcvSample": false, "returnSample": false, "fixRate": "R0", "orderStatus": 3, "orderTyp": 1, "rowStatus": "Original", "itemPrice": 0.0, "orderDate": "2023-01-21", "custCode": "rajeev" } ] } }';
      // final json=jsonDecode(response.body);
      final json=jsonDecode(response);
      print(json);
      final resultbody=json['result'];
      if(resultbody['errNo']==200){
        // final json=jsonDecode(response);
        // final json=jsonDecode(response.body);
        final getData = json['data'];
        final listResponse=getData['customerOrdrDtls'];
        print('$listResponse listResponse');
        // final orderval = OrderDetail.fromJson(listResponse);
        // print('$orderval orderval');
        final orderDetails = listResponse.map<OrderDetail>((e) => OrderDetail.fromJson(e)).toList()  as List<OrderDetail>;
        // final results=listResponse.map<OrderDetail>((e) => OrderDetail.fromJson(e)).toList()  as List<OrderDetail>;
        print('${orderDetails} orderDetails');
        return orderDetails;
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