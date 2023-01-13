import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepository {
  String baseurl = 'https://community.nodebb.org';
  String path = '/api/v3/utilities/login';

  Future getAuthenticationDetails() async {
    Map<String, String> user = {"username": "krishnakumar72480@gmail.com", "password": "krishnakumar939472480"};
    Uri uri = Uri.https(baseurl, path, user);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      print("yes achieved");
      String data = jsonDecode(response.body);
      return data;
    } else {
      print(response.statusCode);
    }
  }
}
