

import 'dart:convert';

class JsonReq{
  String loginEncode(String username, String password) {
    return json.encode({
      "data": {
        "loginData": {
          'userName': username,
          'password': password
        }}
    });
  }
}