import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoryRepo {
  String baseurl = 'https://community.nodebb.org/api/';
  var client = http.Client();

  Future getCategories(int id) async {
    String path = "categories";
    Uri uri = Uri.parse(baseurl + path);
    http.Response response = await client.get(uri);
    if (response.statusCode == 200) {
      var data = response.body;
      Map<String, dynamic> map = jsonDecode(data);
      print("${map["categories"][id + 2]["name"]}");
    } else {
      print(response.statusCode);
    }
  }
}
