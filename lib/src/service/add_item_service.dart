
import 'dart:convert';

import 'package:flutter_spring_login/src/model/ItemName.dart';

class AddItemService{

  List<ItemName> addItemNameLoad(){
    final response='{ "result": { "errNo": 200, "errMsg": "Success" }, "data": { "item Name List": [ { "description": null, "disabled": false, "label": "Nabawi Chain", "value": "NCH", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "Battani Chain", "value": "BC", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "Nawabi Chain", "value": "NWB", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "Kartiayet Breslet", "value": "CRT", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "gold", "value": "testing", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "NoseTops", "value": "NR", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "12", "value": "11", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "gold", "value": "17", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "sum", "value": "12", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "NeckLace", "value": "NCKLCE", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "FingerRing", "value": "RNG", "escape": true, "noSelectionOption": false }, { "description": null, "disabled": false, "label": "payal", "value": "PYL", "escape": true, "noSelectionOption": false } ] } }';
    final json =jsonDecode(response);

    final data=json['data'];
    final itemNameList =data['item Name List'];

    final itemNameDtl = itemNameList.map<ItemName>((e) => ItemName.fromJson(e)).toList()  as List<ItemName>;
    return itemNameDtl;


  }
}