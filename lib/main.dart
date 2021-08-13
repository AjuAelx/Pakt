import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pakt/bloc/authbloc/loginbloc.dart';
import 'package:pakt/bloc/getotpbloc/getotpbloc.dart';
import 'package:pakt/bloc/sellerprofilebloc/sellerprofilebloc.dart';
import 'package:pakt/bloc/updateprofilebloc/updateprofilebloc.dart';
import 'package:pakt/bloc/userbloc/userbloc.dart';
import 'package:pakt/ui/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetOtpBloc>(
            create: (BuildContext context) => GetOtpBloc()),
        BlocProvider<AuthBloc>(create: (BuildContext context) => AuthBloc()),
        BlocProvider<UserBloc>(create: (BuildContext context) => UserBloc()),
        BlocProvider<UpdateProfileBloc>(
            create: (BuildContext context) => UpdateProfileBloc()),
        BlocProvider<SellerProfileBloc>(
            create: (BuildContext context) => SellerProfileBloc()),
      ],
      child: MaterialApp(
          theme: ThemeData(
              hoverColor: Colors.transparent,
              accentColor: new Color(0xffFFCC00),
              textTheme: const TextTheme(
                headline1: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    color: Color(
                      0xffFFCC00,
                    ),
                    fontFamily: 'Pfd'),
                headline2: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoM',
                    color: Colors.black),
                headline3: TextStyle(
                    fontSize: 93,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Pfd'),
                headline4: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Roboto'),
                bodyText2: TextStyle(
                  fontSize: 14.0,
                ),
              )),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),),
    );
  }
}
