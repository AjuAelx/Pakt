import 'package:flutter/material.dart';

//import 'package:progress_indicators/progress_indicators.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
                      Stack(children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/loading.png"))),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill, image: AssetImage("assets/vig.png"))),
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
                          height: 40,
                        ),
                        Column(
                          children: [
                            Text("All your favourite \n Restaurants near you",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "Food is any substance consumed to provide nutritional\n support for an organism.",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xffA3A3A3))),
                            SizedBox(
                              height: 30,
                            ),
                            Text("Please Wait...",
                                style: TextStyle(color: Color(0xffA3A3A3))),
                            SizedBox(
                              height: 10,
                            ),
                            // Container(
                            //    child: JumpingDotsProgressIndicator(
                            //       color: Color(0xffA3A3A3),
                            //      fontSize: 500,
                            //
                            //     ),
                            // )
            ],
          )
        ]))));
  }
}
