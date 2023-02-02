import 'dart:convert';

import 'package:http/http.dart' as http;

class TopicRepo {
  // https://community.nodebb.org/api/category/{category_id}/{slug
  String baseurl = 'https://community.nodebb.org/api/';
  var client = http.Client();

  Future getTopics(int cid) async {
    String path = "category/$cid";
    Uri uri = Uri.parse(baseurl + path);
    http.Response response = await client.get(uri);
    if (response.statusCode == 200) {
      var data = response.body;
      Map<String, dynamic> map = jsonDecode(data);
      return map["topics"];
    } else {
      print(response.statusCode);
      Map<String, dynamic> map = [] as Map<String, dynamic>;
      return map;
    }
  }
}
