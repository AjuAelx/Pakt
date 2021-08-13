import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';

import 'register.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({Key? key}) : super(key: key);

  @override
  _LoginOrSignupState createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Column(
                children: <Widget>[
                  Stack(children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/welcome.jpg"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Pak’t",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline1,
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "Welcome",
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline2,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                            minWidth: MediaQuery
                                .of(context)
                                .size
                                .width - 20,
                            height: 45,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(0.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            color: Color(0xffFFCC00),
                            child: new Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  fontFamily: 'RobotoM'),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text("or",
                          style: TextStyle(color: Color(0xffA3A3A3)))),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                        "Continue with",
                        style: TextStyle(color: Colors.black),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 30,
                                  width: 30,
                                  child: Image(
                                      image: AssetImage("assets/google.png"))),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Google")
                            ],
                          ),
                          onTap: () {},
                        ),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 30,
                                  width: 30,
                                  child: Image(
                                      image:
                                      AssetImage("assets/facebook.png"))),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Facebook")
                            ],
                          ),
                          onTap: () {},
                        ),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Don’t have an account?    ",
                            style: TextStyle(color: Color(0xff505050)),
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color(0xff5C5C5C),
                                fontFamily: 'RobotoM',
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                          minWidth: MediaQuery
                              .of(context)
                              .size
                              .width - 20,
                          height: 45,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(0.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          color: Colors.black,
                          child: new Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                fontFamily: 'RobotoM'),
                          )),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
