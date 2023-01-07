import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepository {
  final baseurl = 'https://community.nodebb.org/api/login';
  var client = http.Client();

  Future<void> getAuthenticationDetails() async {
    Uri uri = Uri.https(baseurl);
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json.toString());
    }
  }
}
