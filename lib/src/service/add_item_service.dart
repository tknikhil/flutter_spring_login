
import 'dart:convert';

import 'package:flutter_spring_login/src/model/item_name.dart';
import 'package:flutter_spring_login/src/service/login_service.dart';
import 'package:http/http.dart' as http;

import '../constrainst/api_constraints.dart';

class AddItemService{

  Future<List<ItemName>> addItemNameLoad()async{
    final uri= Uri.parse('$baseUrl$scrOnLoad');
    // final response='{ "result": { "errNo": 200, "errMsg": "Success" }, "data": { "itemNameList": [ { "description": null, "disabled": false, "label": "Nabawi Chain", "value": "NCH", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "Battani Chain", "value": "BC", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "Nawabi Chain", "value": "NWB", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "Kartiayet Breslet", "value": "CRT", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "gold", "value": "testing", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "NoseTops", "value": "NR", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "12", "value": "11", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "gold", "value": "17", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "sum", "value": "12", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "NeckLace", "value": "NCKLCE", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "FingerRing", "value": "RNG", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "payal", "value": "PYL", "escape": true, "noSelectionOption": false } ] } }';
    final response=await http.get(uri);
    final json =jsonDecode(response.body);
    // final json =jsonDecode(response);

    final data=json['data'];
    final itemNameList =data['itemNameList'];

    final itemNameDtl = itemNameList.map<ItemName>((e) => ItemName.fromJson(e)).toList()  as List<ItemName>;
    return itemNameDtl;

  }
   Future<String> getStamp(String meltval)async{
    print("$meltval=======>getStamp");
    final uri= Uri.parse('$baseUrl$meltPer/$meltval/${LoginService.loginval.userCode.toString()}');
    print(uri);
    // final response='{ "result": { "errNo": 200, "errMsg": "Success" }, "data": { "meltingStamp": { "stamp": "PKL909"} } }';
    final response=await http.get(uri);
    final json =jsonDecode(response.body);
    // final json =jsonDecode(response);

    final data=json['data'];
    print('$data=====>getStamp Data');
    print(data['meltingStamp']['stamp']);

     return data['meltingStamp']['stamp'];

  }
  Future<String> getDueDate(String days)async{
    print("$days=======>getDueDate");
    final uri= Uri.parse('$baseUrl$dueDate/$days');
    // final response='{ "result": { "errNo": 200, "errMsg": "Success" }, "data": { "meltingStamp": { "stamp": "PKL909"} } }';
    final response=await http.get(uri);
    final json =jsonDecode(response.body);
    // final json =jsonDecode(response);

    final data=json['data'];
    print('$data=====>getDueDate Data');
    print(data['dueDate']);

    return data['dueDate'];

  }
}