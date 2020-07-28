import 'package:wp_json_api/enums/wp_auth_type.dart';
import 'package:wp_json_api/models/responses/wp_nonce_response.dart';
import 'package:wp_json_api/models/responses/wp_user_login_response.dart';
import 'package:wp_json_api/models/responses/wp_user_register_response.dart';
import 'package:wp_json_api/wp_json_api.dart';

login(String email, String password) async {
  try{
    WPUserLoginResponse response = await WPJsonAPI.instance.api((request) {
      return request.wpLogin(
        email: email,
        password: password,
        authType: WPAuthType.WpEmail,
      );
    });

    String token = response.data.userToken;



  } catch (e) {
    print(e.toString());
  }
}

register(String username, String email, String password) async {
  WPUserRegisterResponse response = await WPJsonAPI.instance.api((request) {
    return request.wpRegister(
      email: email,
      password: password,
      username: username,
    );
  });
}
