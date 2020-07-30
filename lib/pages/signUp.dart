import 'package:flutter/material.dart';
import 'package:Bookeyy/pages/HomePage.dart';
import 'package:Bookeyy/pages/signIn.dart';
import 'package:wp_json_api/models/responses/wp_user_register_response.dart';
import 'package:wp_json_api/wp_json_api.dart';
import 'package:Bookeyy/routing.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
    WPJsonAPI.instance.initWith(baseUrl: "https://bookeyy.com/");
    emailControl = new TextEditingController();

    passwordControl = new TextEditingController();

    password2Control = new TextEditingController();

    usernameControl = new TextEditingController();
    isLoading = false;
  }

  bool isLoading;

  TextEditingController emailControl;
  TextEditingController passwordControl;
  TextEditingController password2Control;
  TextEditingController usernameControl;
  String errorMSG = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 30,
            ),
            child: SafeArea(
              child: Column(children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        child: Text(
                          "Not Now >>",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.orange,
                          ),
                        ),
                        onTap: () => Navigator.pushReplacement(
                          context,
                          routeTo(
                            HomePage(),
                          ),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: Center(
                    child: Hero(
                      tag: "logo",
                      child: Image.asset(
                        "assets/images/sub2.png",
                        height: 150,
                        width: 150,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: usernameControl,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "UserName",
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: emailControl,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: passwordControl,
                  obscureText: true,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: password2Control,
                  obscureText: true,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "confirm Password",
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "By signing up, you agree to our\nterms of service and privacy policy. ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: isLoading
                          ? CircularProgressIndicator(strokeWidth: 4.0)
                          : Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                      onPressed: () async {
                         String email = emailControl.text;
                         String username = usernameControl.text;
                         String password = passwordControl.text;
                         String password2 = password2Control.text;
                         WPUserRegisterResponse response;
                         String token = "";
                         String error;
                         if (password == password2) {
                           if (password.isNotEmpty &&
                               password2.isNotEmpty &&
                               email.isNotEmpty &&
                               username.isNotEmpty) {
                             setState(() {
                               isLoading = true;
                             });
                             try {
                               response = await WPJsonAPI.instance.api(
                                 (request) => request.wpRegister(
                                   email: email,
                                   password: password,
                                   username: username,
                                 ),
                               );
                               token = response.data.userToken;
                               Navigator.of(context).pushReplacement(
                                 routeTo(
                                   HomePage(
                                     token: token,
                                   ),
                                 ),
                               );
                             } catch (e) {}
                           } else {
                             setState(() {
                               errorMSG =
                                   "Please make sure you fill all the fields and correctly";
                             });
                           }
                         } else {
                           setState(() {
                             errorMSG = "passswords does not match";
                           });
                         }
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        " Sign In",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.orange,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          routeTo(
                            SigninPage(),
                          ),
                        );
                      },
                    )
                  ],
                )
              ]),
            )));
  }
}
