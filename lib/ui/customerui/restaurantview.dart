import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'search.dart';

class Restaurantview extends StatefulWidget {
  const Restaurantview({Key? key}) : super(key: key);

  @override
  _RestaurantviewState createState() => _RestaurantviewState();
}

class _RestaurantviewState extends State<Restaurantview> {
  bool? isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.black, actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Color(0xffFFCF30),
                  size: 20,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 10, bottom: 10),
                child: Container(
                  width: 130,
                  height: 33,
                  child: InkWell(
                    child: IgnorePointer(
                      child: TextFormField(
                        showCursor: false,
                        cursorColor: Colors.yellow,
                        textInputAction: TextInputAction.next,
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
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Search()));
                    },
                  ),
                ),
              ),
            ],
          ),
        ]),
        body: Stack(children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _info(context),
                  // _offers(context),
                  _choosebycategory(context),
                  _mostpopular(context),
                  _restaurantsnear(context),
                ],
              ),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            SizedBox(
              height: 80,
            )
          ]),
        ]));
  }

  Widget _info(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text("Arabian Inn",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'RobotoM',
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.start),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "20% Off",
                        style: TextStyle(
                          color: Color(0xff6F6F6F),
                          fontSize: 17,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.bookmark,
                            size: 17, color: Color(0xff6F6F6F)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Icon(Icons.share,
                            size: 17, color: Color(0xff6F6F6F)),
                      ),
                    ],
                  ),
                  Text(
                    "Fried Rice, Biriyani, Shawarma",
                    style: TextStyle(color: Color(0xff6F6F6F), fontSize: 15),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 8, 8, 8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff747474),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.5))),
                            height: 10,
                            width: 60,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "08:00 - 21:30",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                      fontFamily: 'RobotoM'),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 8, 8, 8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffFFC400),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.5))),
                            height: 13,
                            width: 28,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "5.0",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontFamily: 'RobotoM'),
                                ),
                                Spacer(),
                                Icon(Icons.star, size: 9, color: Colors.white)
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
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1.0),
                    child: Row(
                      children: [
                        Text(
                          "3.2 Km Away",
                          style: TextStyle(
                              color: Color(0xff6F6F6F),
                              fontSize: 12,
                              fontFamily: 'RobotoM'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Estimated Delivery in 30 min",
                          style: TextStyle(
                              color: Color(0xff6F6F6F),
                              fontSize: 12,
                              fontFamily: 'RobotoM'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1.0),
                    child: Text(
                      "Kalloor, Ernakulam, Kerala",
                      style: TextStyle(
                        color: Color(0xff6F6F6F),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _choosebycategory(BuildContext context) {
    return Container(
      height: 156,
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
                                image: AssetImage("assets/rice.png"),
                                height: 60,
                                width: 60,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "Rice",
                                style: TextStyle(
                                    color: Color(0xff8E8080), fontSize: 10),
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
    );
  }

  Widget _mostpopular(BuildContext context) {
    return Container(
      height: 330,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "Most Recommended",
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
            height: 270,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: false,
                  itemCount: 18,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: new Container(
                        color: Colors.white70,
                        height: 210,
                        width: 160,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Image(
                                image: AssetImage("assets/biriyani.png"),
                                height: 135,
                                width: 135,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "Chicken Biriyani",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'RobotoM',
                                    fontSize: 15),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xffFFC400),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2.5))),
                                        height: 12,
                                        width: 30,
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
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Color(0xffEAEAEA)),
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
                                              "223",
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Rs. 160",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'RobotoM'),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: InkWell(
                                    child: Container(
                                        height: 24,
                                        width: 70,
                                        padding: const EdgeInsets.all(3.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffFFC917)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ADD +',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontFamily: 'RobotoM'),
                                          ),
                                        )),
                                    onTap: () {
                                      _details(context);
                                      // final snackBar = SnackBar(
                                      //   backgroundColor: Colors.white,
                                      // content: _details(context),
                                      //   duration: Duration(days: 365),
                                      // );
                                      //
                                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    }),
                              )
                            ],
                          ),
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

  _details(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  "Rs. 780",
                  style: TextStyle(
                      color: Color(0xffFFCF30),
                      fontFamily: 'RobotoM',
                      fontSize: 14),
                ),
                Text("4 ITEMS TOTAL",
                    style: TextStyle(color: Color(0xffFFCF30), fontSize: 10))
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Row(
                children: [
                  Text(
                    "View Cart",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Color(0xffFFCF30),
                    size: 20,
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
            ),
          )
        ],
      ),
    );
  }
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
            "Full Menu",
            style: TextStyle(
                color: Colors.black, fontFamily: 'RobotoB', fontSize: 16),
          ),
          Spacer(),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 24,
                  width: 70,
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'MENU',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'RobotoM'),
                    ),
                  )),
            ),
            onTap: () {},
          ),
        ],
      ),
      Column(
        children: List.generate(7, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Image(
                      image: AssetImage("assets/shawarma.png"),
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
                      Text("Shawarma",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'RobotoM',
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.start),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(2, 8, 8, 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffFFC400),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2.5))),
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
                                          color: Colors.white, fontSize: 10),
                                    ),
                                    Spacer(),
                                    Icon(Icons.star,
                                        size: 9, color: Colors.white)
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Color(0xffEAEAEA)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2.5))),
                                height: 12,
                                width: 25,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      "223",
                                      style: TextStyle(
                                          color: Colors.black45, fontSize: 12),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          "Rs. 150",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'RobotoM'),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 24,
                          width: 70,
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffFFC917)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'ADD +',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontFamily: 'RobotoM'),
                            ),
                          )),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          );
        }),
      ),
      SizedBox(
        height: 80,
      )
    ],
  );
}

//
// _details(BuildContext context){
//   showModalBottomSheet(
//       isDismissible: false,
//       context: context,
//       builder: (context) {
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Container(
//               height: 30,
//               child: ListTile(
//
//                 title: new Text ("Chicken Biriyani",style: TextStyle(color:Colors.black,fontFamily:'RobotoB',fontSize: 25),),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//             ListTile(
//               title: new Text('Quantity'),
//               trailing:  Text(' REQUIRED',style: TextStyle(color:Colors.black,fontSize: 10,fontFamily: 'RobotoM')),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             RadioListTile(
//               title: new Text('Half'),
//               value: 1, onChanged: (int? value) {
//
//             },
//               groupValue: 1,
//
//
//             ),
//             RadioListTile(
//               title: new Text('Full'),
//               value: 2, onChanged: (int? value) {
//
//             },
//               groupValue: 2,
//
//
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: MaterialButton(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(7.0),
//                   ),
//                 ),
//                 minWidth: MediaQuery.of(context).size.width-40,
//                 height: 45,
//                 onPressed: () {
//                   //  Navigator.push(context, MaterialPageRoute(builder: (context) => SelectLocation()));
//                 },
//                 color: Colors.black,
//
//
//                 child: Text(
//                   "Next",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 18),
//                 ),
//               ),
//             ),
//           ],
//         );
//       });
// }
