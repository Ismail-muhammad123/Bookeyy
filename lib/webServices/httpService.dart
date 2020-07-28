import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class WebServices {
  static const String baseUrl = "https://bookeyy.com";

  loadWebPage(String path) async {
    Response response;
    String token;

    if (token.isEmpty) {
      response = await http.get(baseUrl + path);
    } else {
      response = await http.get(baseUrl + path, headers: {
        "Authorization": "Bearer " + token,
      });
    }

    return response.body;
  }
}
