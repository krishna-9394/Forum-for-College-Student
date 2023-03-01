import 'dart:convert';

import 'package:http/http.dart' as http;

class UserRepo {
  // https://community.nodebb.org/api/category/{category_id}/{slug
  String baseurl = 'https://community.nodebb.org/api/';
  var client = http.Client();

  Future getUsers(int pageIndex) async {
    String path = "users?lang=en-GB&page=$pageIndex";
    Uri uri = Uri.parse(baseurl + path);
    http.Response response = await client.get(uri);
    if (response.statusCode == 200) {
      var data = response.body;
      Map<String, dynamic> users = jsonDecode(data);
      List<dynamic> pagination = (jsonDecode(data))["pagination"]["rel"];
      int n = pagination.length;
      bool hasNextPage = false, hasPrevPage = false;
      if (n == 0) {
        // if no of element in rel is 0 then  only 1 page
      } else if (n == 2) {
        // if no of element in rel is 2 then both prev and next page exist
        hasNextPage = true;
        hasPrevPage = true;
      } else {
        // if no of element in rel is 1 and then either prev or next page exist
        int temp = pagination[0]["rel"].compareTo("next");
        if (temp == 0) {
          hasNextPage = true;
        } else {
          hasPrevPage = true;
        }
      }
      return [users["users"], hasNextPage, hasPrevPage];
    } else {
      print(response.statusCode);
      Map<String, dynamic> users = [] as Map<String, dynamic>;
      return [users, false, false];
    }
  }

  Future getSingleUser(int uid) async {
    String path = "user/uid/$uid";
    Uri uri = Uri.parse(baseurl + path);
    http.Response response = await client.get(uri);
    if (response.statusCode == 200) {
      var data = response.body;
      dynamic object = jsonDecode(data);
      return object;
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
