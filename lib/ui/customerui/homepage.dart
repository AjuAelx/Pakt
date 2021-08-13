import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pakt/bloc/authbloc/loginbloc.dart';
import 'package:pakt/bloc/authbloc/loginevent.dart';
import 'package:pakt/bloc/authbloc/loginstate.dart';
import 'package:pakt/ui/commonauth/login.dart';
import 'restaurantview.dart';
import 'search.dart';
import 'userprofile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0), // here the desired height
          child: AppBar(
              elevation: 1,
              title: Padding(
                padding: const EdgeInsets.fromLTRB(1, 12, 8, 10),
                child: Text(
                  "Pak’t",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pfd'),
                ),
              ),
              backgroundColor: Colors.black,
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 15, 5),
                  child: IconButton(
                    icon: const Icon(
                      Icons.account_circle,
                      size: 25,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfile()));
                    },
                  ),
                ),
              ])),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text('Hello!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Proxima')),
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                BlocProvider.of<AuthBloc>(context).add(
                  DoLogout(),
                );
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          //  height: MediaQuery.of(context).size.height,

          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<AuthBloc, LoginState>(
                listener: (context, state) {
                  if (state is TokensCleared) {
                    print("push replaced");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  }
                },
                builder: (context, state) {
                  return Container();
                },
              ),
              _location(context),
              // _search(context),
              _offers(context),
              _choosebycategory(context),
              _mostpopular(context),
              _restaurantsnear(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _location(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0, color: Colors.black),
        color: Colors.black,
      ),
      height: 122,
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(Icons.location_on_outlined, size: 20, color: Colors.white),
              Text(
                "Kalloor, Ernakulam, Kerala",
                style: TextStyle(color: Colors.white, fontFamily: 'poppinsm'),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(14),
                child: InkWell(
                  child: Text(
                    'Change',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xffA3A3A3)),
                    textAlign: TextAlign.end,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
          InkWell(
            child: IgnorePointer(
              child: Container(
                color: Colors.black,
                height: 60,
                width: MediaQuery.of(context).size.width - 20,
                child: Center(
                  child: TextFormField(
                    showCursor: false,
                    cursorColor: Colors.yellow,
                    enableInteractiveSelection: false,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xffA3A3A3),
                        size: 20,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Color(0xffA3A3A3)),
                      contentPadding: const EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: new Color(0xffE6E6E6)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: new Color(0xffE6E6E6)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      border: new OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: new Color(0xff4E5360)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Search()));
            },
          )
        ],
      ),
    );
  }

  Widget _offers(BuildContext context) {
    return Container(
      height: 190,
      child: Stack(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: AssetImage(
                "assets/grad1.png",
              ),
              fit: BoxFit.cover,
              height: 190,
            )),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView(
              children: [
                CarouselSlider(
                  items: [
                    //1st Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/carousel.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //2nd Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/carousel.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //3rd Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/carousel.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //4th Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/carousel.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //5th Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/carousel.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 170.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    viewportFraction: 0.8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _choosebycategory(BuildContext context) {
    return Container(
      height: 156,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Choose by Category",
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'RobotoB', fontSize: 16),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: InkWell(
                    child: Text(
                      'View All',
                      style: TextStyle(color: Color(0xffA3A3A3)),
                      textAlign: TextAlign.end,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            Container(
              height: 95,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    itemCount: 18,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: new Container(
                          height: 100,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage("assets/burger.png"),
                                  height: 60,
                                  width: 60,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "Arabian",
                                    style: TextStyle(
                                        color: Color(0xff8E8080), fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Restaurantview()));
                        },
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _mostpopular(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "Most Popular Near by",
                style: TextStyle(
                    color: Colors.black, fontFamily: 'RobotoB', fontSize: 16),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(14),
                child: InkWell(
                  child: Text(
                    'View All',
                    style: TextStyle(color: Color(0xffA3A3A3)),
                    textAlign: TextAlign.end,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
          Container(
            height: 200,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: false,
                  itemCount: 18,
                  itemBuilder: (context, index) {
                    return new Container(
                      height: 160,
                      width: 160,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: InkWell(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(children: [
                                Image(
                                  image: AssetImage("assets/food.png"),
                                  height: 135,
                                  width: 135,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffFFC400),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.5))),
                                      height: 12,
                                      width: 25,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            "5.0",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                          Spacer(),
                                          Icon(Icons.star,
                                              size: 9, color: Colors.white)
                                        ],
                                      )),
                                )
                              ]),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "Mc Donalds",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'RobotoM',
                                    fontSize: 15),
                              ),
                              Text(
                                "Burgers, French fries, Cool Drinks",
                                style: TextStyle(
                                    color: Color(0xff8E8080), fontSize: 10),
                              ),
                              Text(
                                "Ravipuram, Street 2nd " + " | 2.5 Km",
                                style: TextStyle(
                                    color: Color(0xff8E8080), fontSize: 10),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Restaurantview()));
                          },
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget _restaurantsnear(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              "Restaurant Near by you",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'RobotoB', fontSize: 16),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(14),
              child: InkWell(
                child: Text(
                  'View All',
                  style: TextStyle(color: Color(0xffA3A3A3)),
                  textAlign: TextAlign.end,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
        Column(
          children: List.generate(18, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: InkWell(
                child: new Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image(
                          image: AssetImage("assets/rest.png"),
                          height: 90,
                          width: 90,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text("Annaporna",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'RobotoM',
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.start),
                          Text(
                            "Dosa, Idli, Vada",
                            style: TextStyle(
                                color: Color(0xff8E8080), fontSize: 10),
                          ),
                          Text(
                            "Ravipuram, Street 2nd " + " | 2.5 Km",
                            style: TextStyle(
                                color: Color(0xff8E8080), fontSize: 10),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(2, 8, 8, 8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xffFFC400),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.5))),
                                    height: 12,
                                    width: 25,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          "5.0",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                        Spacer(),
                                        Icon(Icons.star,
                                            size: 9, color: Colors.white)
                                      ],
                                    )),
                              ),
                              Text("30 min",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'RobotoM',
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.start),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Restaurantview()));
                },
              ),
            );
          }),
        )
      ],
    );
  }
}
