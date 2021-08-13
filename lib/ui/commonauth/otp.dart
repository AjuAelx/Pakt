import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pakt/bloc/authbloc/loginbloc.dart';
import 'package:pakt/bloc/authbloc/loginevent.dart';
import 'package:pakt/bloc/authbloc/loginstate.dart';
import 'package:pakt/bloc/getotpbloc/getotpbloc.dart';
import 'package:pakt/bloc/getotpbloc/getotpevent.dart';
import 'package:pakt/bloc/getotpbloc/getotpstate.dart';

import 'package:pakt/ui/customerui/completeprofilecustomer.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pakt/ui/customerui/homepage.dart';

import 'package:pakt/ui/sellerui/profilelevel1.dart';
import 'package:pakt/ui/sellerui/profilelevel2.dart';
import 'package:pakt/ui/sellerui/profilelevel3.dart';
import 'package:pakt/ui/sellerui/profilelevel4.dart';
import 'package:pakt/ui/sellerui/sellerhomepage.dart';

class Otp extends StatefulWidget {
  final number;
  final bool? isFromLogin;
  final String? role;

  const Otp({Key? key, required this.number, this.isFromLogin, this.role})
      : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final otp = TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  height: 20,
                ),
                Text(
                  "OTP Verificaition",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Enter the 4 digit OTP sent on\n +91 " +
                            widget.number +
                            " to continue",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      OTPTextField(
                        keyboardType: TextInputType.number,
                        length: 4,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 20,
                        style: TextStyle(fontSize: 17),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.underline,
                        onCompleted: (pin) {
                          otp.text = pin;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("OTP not received yet?"),
                            SizedBox(
                              width: 7,
                            ),
                            InkWell(
                              child: Text(
                                "RESEND",
                                style: TextStyle(
                                    color: Color(0xff3D72DE),
                                    decoration: TextDecoration.underline),
                              ),
                              onTap: () {
                                BlocProvider.of<GetOtpBloc>(context).add(GetOtp(
                                    number: widget.number,
                                    accessType: widget.isFromLogin!
                                        ? "signin"
                                        : "signup"));
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
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
                          print(widget.role);
                          BlocProvider.of<GetOtpBloc>(context).add(Verify(
                              number: widget.number,
                              otp: otp.text,
                              role: widget.role != null
                                  ? widget.role.toString()
                                  : "",
                              accessType:
                                  widget.isFromLogin! ? "signin" : "signup"));
                        },
                        color: Colors.black,
                        child: BlocConsumer<GetOtpBloc, GetOtpState>(
                            builder: (context, state) {
                              if (state is StartLoading) {
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
                              if (state is LoginSuccess) {
                                SchedulerBinding.instance!
                                    .addPostFrameCallback((_) {
                                  if (state.currentRole == "Customer") {
                                    if (state.profileStatus == "Incomplete") {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CompleteProfile()));
                                    } else {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    }
                                  } else {
                                    if (state.profileStatus == "Incomplete") {
                                      if (state.level == 0) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileLevel1()));
                                      } else if (state.level == 1) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileLevel2()));
                                      } else if (state.level == 2) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileLevel3()));
                                      } else {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileLevel4()));
                                      }
                                    } else {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SellerHomePage()));
                                    }
                                  }
                                });
                              } else if (state is LoginError) {
                                errortoast(state.error);
                                return Text(
                                  "Verify & Proceed",
                                  style: TextStyle(
                                      color: Color(0xffFFCC00),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                );
                              }
                              return Text(
                                "Verify & Proceed",
                                style: TextStyle(
                                    color: Color(0xffFFCC00),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              );
                            },
                            listener: (context, state) {}),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
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
// void _showToast(String mssg) {
//   Fluttertoast.showToast(
//     msg: mssg,
//     gravity: ToastGravity.CENTER,
//     backgroundColor: Colors.black,
//     textColor: Colors.white,
//     fontSize: 12.0,
//   );
// }
}
