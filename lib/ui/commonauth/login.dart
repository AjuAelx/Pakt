import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pakt/bloc/getotpbloc/getotpbloc.dart';
import 'package:pakt/bloc/getotpbloc/getotpevent.dart';
import 'package:pakt/bloc/getotpbloc/getotpstate.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pakt/ui/commonauth/otp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    number.text = "9567840846";
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Stack(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/welcome.jpg"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Pak’t",
                        style: Theme.of(context).textTheme.headline1,
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
                            child: Row(
                              children: [
                                Text(
                                  "Login",
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 45,
                          child: TextFormField(
                            controller: number,
                            cursorColor: Colors.yellow,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Mobile Number',
                              hintStyle: TextStyle(color: Color(0xffA3A3A3)),
                              contentPadding: const EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: new Color(0xffE6E6E6)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: new Color(0xffE6E6E6)),
                              ),
                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: new Color(0xff4E5360))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width - 17,
                          height: 45,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7.0),
                            ),
                          ),
                          onPressed: () {
                            print(number.text);
                            BlocProvider.of<GetOtpBloc>(context).add(GetOtp(
                                number: number.text, accessType: "signin"));
                          },
                          color: Colors.black,
                          child: BlocConsumer<GetOtpBloc, GetOtpState>(
                            builder: (context, state) {
                              if (state is SendingOtp) {
                                return SizedBox(
                                  height: 22.0,
                                  width: 22.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                    strokeWidth: 2,
                                  ),
                                );
                              }
                              if (state is PhoneSuccess) {
                                SchedulerBinding.instance!
                                    .addPostFrameCallback((_) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Otp(
                                                number: number.text,
                                                isFromLogin: true,
                                              )));
                                });
                              }
                              if (state is OtpsendError) {
                                _showToast(state.error);
                              }
                              return new Text(
                                "Next",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              );
                            },
                            listener: (context, state) {},
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "By continuing you may receive an SMS for verification.",
                          style: TextStyle(color: Color(0xffA3A3A3)),
                        ),
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
                      ])
                ],
              )),
        ),
      ),
    );
  }

  void _showToast(String mssg) {
    Fluttertoast.showToast(
      msg: mssg,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 12.0,
    );
  }
}
