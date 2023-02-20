import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepository {
  String baseurl = 'https://krishna72480.nodebb.com/api/v3/';
  String token = "77e61d8b-1055-43bb-a76f-4885a33a12b0";
  var client = http.Client();

  Future getLoginResponse(String username, String password) async {
    String path = "utilities/login";
    // dio
    Uri uri = Uri.parse(baseurl + path);
    Map<String, String> credentials = {"username": username, "password": password};
    var body = jsonEncode(credentials);
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    http.Response response = await client.post(uri, body: body, headers: headers);
    var data = response.body;
    int statusCode = response.statusCode;
    print(statusCode);
    return [data, statusCode];
  }

  Future getSignUpResponse(String username, String password, String email) async {
    String path = "users";
    Uri uri = Uri.parse(baseurl + path);
    Map<String, String> credentials = {"username": username, "password": password, "email": email, "_uid": "1"};
    var body = jsonEncode(credentials);
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    http.Response response = await client.post(uri, body: body, headers: headers);
    var data = response.body;
    int statusCode = response.statusCode;
    return [data, response.statusCode];
  }
}
