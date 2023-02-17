import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepository {
  // https://community.nodebb.org/api/v3/utilities/login
  // http:///
  String baseurl = 'https://krishna72480.nodebb.com/api/v3/';
  var client = http.Client();

  Future createUser() async {
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

  Future getLoginResponse(String username, String password) async {
    String path = "utilities/login";
    Uri uri = Uri.parse(baseurl + path);
    Map<String, String> credentials = {"username": username, "password": password};
    var body = jsonEncode(credentials);
    http.Response response = await client.post(uri, body: body);
    print(response.statusCode);
  }

  Future getSignUpResponse(String username, String password, String email) async {
    // http.Response response = await client.post(uri, body: payload);
    // data = {
    //   "cid": int(cid),
    //   "title": entry.title,
    //   "content": '\n'.join(description),
    //   "tags": tags
    // }
    // headers = {'Authorization': 'Bearer {token}'.format(token=os.environ.get('NODEBB_TOKEN'))}
    // url = '{host}/api/v3/topics/'.format(host=os.environ.get('NODEBB_URL'))
    //
    // response = requests.post(
    //     url=url,
    //     headers=headers,
    //     json=data
    // )
  }
}
