import 'dart:convert';

import 'package:getuser_info/models/usermodel.dart';
import 'package:http/http.dart';

class Networks {
  static final String baseUrl = "api.github.com";
  static final String url1 = "/users/githubsobir";
  static final Map<String, String> header = {
    'Content-type': 'application/json; charset=UTF-8'
  };

  static Future<UserModel> getData() async {
    try {
      var url = Uri.https(baseUrl, url1);
      var response = await get(url, headers: header);
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        return UserModel.fromJson(jsonDecode(response.body));
      }
      return UserModel();
    } catch (e) {
      print(e);
      return UserModel();
    }
  }


}
