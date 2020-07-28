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
        backgroundColor: Colors.blue,
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 30,
            ),
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                  left: 280.0,
                ),
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
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                "Register",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              TextField(
                controller: usernameControl,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "UserName",
                ),
              ),
              TextField(
                controller: emailControl,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              TextField(
                controller: passwordControl,
                obscureText: true,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              TextField(
                controller: password2Control,
                obscureText: true,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "confirm Password",
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Text(errorMSG,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        wordSpacing: 2.0,
                        letterSpacing: 1.0)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "By signing up, you agree to our\nterms of service and privacy policy. ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  RaisedButton(
                    color: Colors.white,
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
                  ),
                  GestureDetector(
                    child: Text(
                      " Sign In",
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
                          SigninPage(),
                        ),
                      );
                    },
                  )
                ],
              )
            ])));
  }
}
