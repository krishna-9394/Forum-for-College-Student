import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepository {
  String baseurl = 'https://community.nodebb.org/api/v3/';
  var client = http.Client();

  Future createUser() async {
    print("reached here 10");
    String path = "users/";
    Map<String, String> auth = {
      "username": "krishn9345",
      "password": "krishnakumar939472480",
      "email": "krishnakumar72480@gmail.com"
    };
    Uri uri = Uri.parse(baseurl + path);
    var payload = jsonEncode(auth);
    http.Response response = await client.post(uri, body: payload);
    print("reached here 4");
    if (response.statusCode == 200) {
      print("reached here 5");
    } else {
      print(response.statusCode);
    }
  }

  Future getAuthenticationDetails() async {
    String path = "login/";
    Map<String, String> auth = {"username": "Krishna Kumar K", "password": "krishnakumar939472480"};
    Uri uri = Uri.parse(baseurl + path);
    var payload = jsonEncode(auth);
    http.Response response = await client.post(uri, body: payload);
    print("reached here 4");
    if (response.statusCode == 200) {
      print("reached here 5");
      print("yes achieved");
      String data = jsonDecode(response.body);
      return data;
    } else {
      print(response.statusCode);
    }
  }
}
