import 'dart:convert';

class JsonReq {
  String loginEncode(String username, String password) {
    return json.encode({
      "data": {
        "loginData": {'userName': username, 'password': password}
      }
    });
  }

  String saveItem(
      String itemName,
      double weight,
      String itemSize,
      int qty,
      double meltPer,
      String stamp,
      String hook,
      List<String> designSample,
      String sizeSample,
      String refNo,
      String remark,
      int days) {
    return json.encode({
      "data": {
        "ordersDtls":
          {
            "itemName": itemName,
            "weight": weight,
            "qty": qty,
            "itemSize": itemSize,
            "meltPer": meltPer,
            "stamp": stamp,
            "hook": hook,
            "remark": remark,
            "refNo": refNo,
            "designSample": designSample,
            "sizeSample": sizeSample,
            "days": days
          }
      }
    });
  }
}
