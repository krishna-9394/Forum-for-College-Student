import 'dart:convert';

import 'package:http/http.dart' as http;

class ProfileRepo {
  String baseurl = 'https://community.nodebb.org/api/';
  var client = http.Client();

  Future getUserByUid(int uid) async {
    String path = "user/uid/$uid";
    Uri uri = Uri.parse(baseurl + path);
    http.Response response = await client.get(uri);
    var data = response.body;
    return [data, response.statusCode];
  }
}
