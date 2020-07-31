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
    WPJsonAPI.instance.initWith(baseUrl: "https://bookeyy.com");
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
      backgroundColor: Colors.white,
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
                          color: Colors.orange,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
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
                  color: Colors.blue,
                ),
              )),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              "Sign In",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25.0,
                color: Colors.orange,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: _emailController,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
                hintStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              obscureText: true,
              controller: _passwordController,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
                hintText: "Password",
              ),
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 0, top: 15.0),
                child: Text(
                  " Recover password.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.orange,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              onTap: () {},
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
                  print(
                      "tryine o login with email: $email and password $password");
                  try {
                    response = await WPJsonAPI.instance.api((request) {
                      return request.wpLogin(
                        email: email,
                        password: password,
                        authType: WPAuthType.WpEmail,
                      );
                    });

                    token = response.data.userToken;
                    print("User Token: $token");
                    Navigator.of(context).pushReplacement(
                      routeTo(
                        HomePage(
                          token: token,
                        ),
                      ),
                    );
                  } catch (e) {
                    setState(() {
                      isLoading = false;
                    });
                    print(e.toString());
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Error"),
                        content: Text(
                          "Sorry, an error has occured, check your internet connection and try again",
                        ),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Okay"),
                          )
                        ],
                      ),
                      barrierDismissible: true,
                    );
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Error"),
                      content: Text("Please fill in all the fields"),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Okay"),
                        )
                      ],
                    ),
                    barrierDismissible: true,
                  );
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              child: isLoading
                  ? SizedBox(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                      height: 14.0,
                      width: 14.0,
                    )
                  : Text(
                      "Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22.0,
                      ),
                    ),
              color: Colors.blue,
              splashColor: Colors.white,
              textColor: Colors.white,
              minWidth: 220.0,
              height: 40.0,
            ),
            SizedBox(
              height: 25.0,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Don't have an account yet?",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    " Sign Up",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange,
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
