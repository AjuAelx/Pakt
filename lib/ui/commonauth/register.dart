import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pakt/bloc/getotpbloc/getotpbloc.dart';
import 'package:pakt/bloc/getotpbloc/getotpevent.dart';
import 'package:pakt/bloc/getotpbloc/getotpstate.dart';
import 'otp.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final number = TextEditingController();
  bool? isSelectedC = true;


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
                            "Register",
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline2,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Select your account type.",
                          style: TextStyle(color: Color(0xff505050)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                                minWidth: 144,
                                height: 45,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7.0),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isSelectedC = true;
                                  });
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                                },
                                color: isSelectedC!
                                    ? Color(0xffFFCC00)
                                    : Colors.white,
                                child: new Text(
                                  "Customer",
                                  style: TextStyle(
                                      color: isSelectedC!
                                          ? Colors.black
                                          : Color(0xff6A6A6A),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                      fontFamily: 'RobotoM'),
                                )),
                            MaterialButton(
                                minWidth: 144,
                                height: 45,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7.0),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isSelectedC = false;
                                  });
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                                },
                                color: !isSelectedC!
                                    ? Color(0xffFFCC00)
                                    : Colors.white,
                                child: new Text(
                                  "Seller",
                                  style: TextStyle(
                                      color: !isSelectedC!
                                          ? Colors.black
                                          : Color(0xff6A6A6A),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                      fontFamily: 'RobotoM'),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter your mobile number, we will sent \nyou OTP to verify later.",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 20,
                    height: 45,
                    child: TextFormField(
                      controller: number,
                      cursorColor: Colors.yellow,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        // prefixText: '+91 ',
                        // prefixStyle: TextStyle(color:Colors.black),
                        fillColor: Colors.orange,
                        filled: false,
                        hintText: 'Mobile Number',
                        hintStyle: TextStyle(color: Color(0xffA3A3A3)),
                        contentPadding: const EdgeInsets.all(10),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          new BorderSide(color: new Color(0xffE6E6E6)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          new BorderSide(color: new Color(0xffE6E6E6)),
                        ),
                        border: new OutlineInputBorder(
                            borderSide:
                            new BorderSide(color: new Color(0xff4E5360))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BlocListener<GetOtpBloc, GetOtpState>(
                        listener: (context, state) {
                          print(state);
                          if (state is PhoneSuccess) {
                            Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) =>
                                    Otp(number: number.text,
                                        isFromLogin: false,
                                        role: isSelectedC!
                                            ? "Customer"
                                            : "Seller")));
                          }

                          else if (state is OtpsendError) {
                            errortoast(state.error);
                          }
                        },
                        child: MaterialButton(
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
                              BlocProvider.of<GetOtpBloc>(context).add(GetOtp(
                                  number: number.text, accessType: "signup"));
                            },
                            color: Colors.black,
                            child: new Text(
                              "Next",
                              style: TextStyle(
                                  color: Color(0xffFFCC00),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  fontFamily: 'RobotoM'),
                            )),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void errortoast(String mssg) {
    Fluttertoast.showToast(
      msg: mssg,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 12.0,
    );
  }
}
