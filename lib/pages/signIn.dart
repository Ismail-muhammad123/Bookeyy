import 'package:Bookeyy/pages/HomePage.dart';
import 'package:Bookeyy/pages/signUp.dart';
import 'package:Bookeyy/routing.dart';
import 'package:flutter/material.dart';
import 'package:wp_json_api/enums/wp_auth_type.dart';
import 'package:wp_json_api/models/responses/wp_user_login_response.dart';
import 'package:wp_json_api/wp_json_api.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  void initState() {
    WPJsonAPI.instance.initWith(baseUrl: "https://bookeyy.com/");
    super.initState();
    _emailController = new TextEditingController();

    _passwordController = new TextEditingController();
    isLoading = false;
  }

  bool isLoading;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  String errorMSG = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                    child: Text(
                      "Not Now >>",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    onTap: () => Navigator.pushReplacement(
                      context,
                      routeTo(
                        HomePage(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Center(
              child: Container(
                  child: Hero(
                tag: "logo",
                child: Image.asset(
                  "assets/images/sub2.png",
                  height: 150,
                  width: 150,
                  color: Colors.white,
                ),
              )),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              "Sign In",
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: _emailController,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: "email",
                hintStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextField(
              obscureText: true,
              controller: _passwordController,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
                hintText: "Password",
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                errorMSG,
                style: TextStyle(color: Colors.red, fontSize: 20.0),
              ),
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    " Recover password.",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                )
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            MaterialButton(
              onPressed: () async {
                String email = _emailController.text;
                String password = _passwordController.text;
                String token = "";
                WPUserLoginResponse response;

                setState(() {
                  isLoading = true;
                });

                if (email != "" && password != "") {
                  try {
                    response = await WPJsonAPI.instance.api((request) {
                      return request.wpLogin(
                        email: email,
                        password: password,
                        authType: WPAuthType.WpEmail,
                      );
                    });
                    token = response.data.userToken;
                    Navigator.of(context).pushReplacement(
                      routeTo(
                        HomePage(
                          token: token,
                        ),
                      ),
                    );
                  } catch (e) {
                    print(e.toString());
                    setState(() {
                      errorMSG =
                          "Error, check your inputs or Internet connection and try again";
                      isLoading = false;
                    });
                  }
                } else {
                  setState(() {
                    errorMSG = "Please comlete all the fields";
                    isLoading = false;
                  });
                }
              },
              child: isLoading
                  ? SizedBox(
                      child: CircularProgressIndicator(),
                      height: 14.0,
                      width: 14.0,
                    )
                  : Text(
                      "Log In",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
              color: Colors.white,
              splashColor: Colors.lightBlue,
              minWidth: 200.0,
              height: 40.0,
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Don't have an account yet?",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    " Sign Up",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      routeTo(
                        SignUp(),
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
