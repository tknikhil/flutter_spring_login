import 'dart:async';
import 'dart:convert';

import 'package:flutter_spring_login/src/constrainst/api_constraints.dart';
import 'package:flutter_spring_login/src/model/order_detail.dart';
import 'package:http/http.dart' as http;

 import 'package:dio/dio.dart ';
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
  Future<List<OrderDetail>> getscreenOnLoad() async{
    try{
      final uri= Uri.parse(testBaseUrl);
      final response= await http.get(uri);
      if(response.statusCode==200){
        final json=jsonDecode(response.body);
        final orderDetails = json.map((e) => OrderDetail.fromJson(e)).toList();
        return orderDetails;
      }else{
        throw Exception('Unable to load data');
      }
    }catch(err){
      print("Error :$err");
      rethrow; //other wise it say's method has potential of returning null
    }
  }

}