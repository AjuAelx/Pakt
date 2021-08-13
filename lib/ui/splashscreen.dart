import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pakt/bloc/authbloc/loginbloc.dart';
import 'package:pakt/bloc/authbloc/loginevent.dart';
import 'package:pakt/bloc/authbloc/loginstate.dart';
import 'package:pakt/ui/customerui/completeprofilecustomer.dart';
import 'package:pakt/ui/sellerui/profilelevel1.dart';
import 'package:pakt/ui/sellerui/profilelevel2.dart';
import 'package:pakt/ui/sellerui/profilelevel3.dart';
import 'package:pakt/ui/sellerui/profilelevel4.dart';
import 'package:pakt/ui/sellerui/sellerhomepage.dart';
import 'customerui/homepage.dart';
import 'commonauth/loginorsignup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NewHome())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/splashscreen/splash.png"))),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/splashscreen/shadow.png"))),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 310,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/splashscreen/path.png"))),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Pak’t",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    "Where ever you are, We serve there",
                    style: TextStyle(color: Colors.black, fontFamily: 'Pfd'),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewHome extends StatefulWidget {
  _NewHome createState() => _NewHome();
}

class _NewHome extends State<NewHome> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    BlocProvider.of<AuthBloc>(context).add(AuthCheck());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new BlocListener<AuthBloc, LoginState>(
        listener: (context, state) {
          if (state is AuthConfirmed) {
            print("authconfirmed");
            if (state.crole == "Seller") {
              print("role seller");
              if (state.pstatus == "Incomplete") {
                print("status incomplete");
                if (state.clevel == 0) {
                  print("going to pro 1");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileLevel1()));
                } else if (state.clevel == 1) {
                  print("going to pro 2");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileLevel2()));
                } else if (state.clevel == 2) {
                  print("going to pro 3");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileLevel3()));
                } else {
                  print("going to pro 4");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileLevel4()));
                }
              } else {
                print("status complete");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SellerHomePage()));
              }
            } else {
              if (state.pstatus == "Incomplete") {
                print(
                    "role not seller and status incomplete, going to complete profile");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompleteProfile()));
              } else {
                print(
                    "role not seller and status was complete going to homepage");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }
            }
          } else {
            print("no user found, do login");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginOrSignup(),
              ),
            );
          }
        },
        child: Container(),
      ),
    );
  }
}
