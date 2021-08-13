import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
          title: Text(
            "Cart",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontFamily: 'RobotoM'),
          ),
          backgroundColor: Colors.black,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_bag_outlined,
                color: Color(0xffFFCF30),
                size: 20,
              ),
            )
          ]),
      body: Column(
        children: [deliverydetails(context)
          , _items(context),
          _billsummary(context),
          _contact(context)
        ],
      ),
    );
  }

  Widget deliverydetails(BuildContext context) {
    return Column(
      children: [
        Card(
          shadowColor: Colors.white,
          child: ExpansionTile(
            textColor: Colors.black,
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            title: Row(
              children: [
                Icon(Icons.location_on, color: Color(0xffFFCF30)),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery at",
                      style: TextStyle(fontSize: 9, color: Color(0xff6F6F6F)),
                    ),
                    Text("Zolo Spring, Koramangala 4-B Block, Bangalore",
                        style: TextStyle(fontSize: 10, fontFamily: 'RobotoM'))
                  ],
                ),
              ],
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  "Address",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
        Card(
          shadowColor: Colors.white,
          child: ListTile(
            tileColor: Colors.white,
            title: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.fastfood_outlined, color: Color(0xffFFCF30)),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Food Preparation Time",
                            style: TextStyle(
                                fontSize: 9, color: Color(0xff6F6F6F)),
                          ),
                          Text("15 min",
                              style: TextStyle(
                                  fontSize: 10, fontFamily: 'RobotoM'))
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Color(0xffFFCF30),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Estimated Delivery",
                              style: TextStyle(
                                  fontSize: 9, color: Color(0xff6F6F6F)),
                            ),
                            Text("50 mins (Incl. 15 min)",
                                style: TextStyle(
                                    fontSize: 10, fontFamily: 'RobotoM'))
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                            height: 24,
                            width: 114,
                            child: Container(
                                child: Center(
                                    child: Text(
                              "Set Delivery Time",
                              style: TextStyle(
                                  fontSize: 10, fontFamily: 'RobotoB'),
                            )))),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _items(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8,),

          ListTile(

            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Items you picked",style: TextStyle(color: Color(0xff818181),fontSize: 8),),
                SizedBox(height: 8,),
                Text(
                  "Chicken Biriyani",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),

                  SizedBox(height: 6,),
                Text(
                  "Rs. 150 x 2",
                  style: TextStyle(fontSize: 9, color: Color(0xff393939)),
                ),]),


            trailing: Container(
                height: 24,
                width: 70,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffFFC917)),
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffFFF7DE)
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7.0, bottom: 5),
                        child: Text(
                          '-',
                          style: TextStyle(
                              color: Color(0xffE6B000),
                              fontSize: 13,
                              fontFamily: 'RobotoM'),
                        ),
                      ),
                      Text(
                        '2',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'RobotoM'),
                      ),
                      Padding(
                          padding:
                          const EdgeInsets.only(right: 7.0, bottom: 3),
                          child: Text(
                            '+',
                            style: TextStyle(
                                color:Color(0xffE6B000),
                                fontSize: 13,
                                fontFamily: 'RobotoM'),
                          )),
                    ],
                  ),
                )),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
  Widget _billsummary(BuildContext context){
    return Card(
      child: Container(
        height: 175,
        child: ListTile(
          tileColor:Colors.white,


          subtitle: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bill Summary',style: TextStyle(fontFamily: 'RobotoM',fontSize: 8,color: new Color(0xff818181)),),
                      SizedBox(height: 18,),

                      Text('Item total',style: TextStyle(fontSize: 10,color: Color(0xff6F6F6F)),),
                      SizedBox(height: 8,),


                      Text('Delivery Charge',style: TextStyle(fontSize: 10,color: Color(0xff6F6F6F),)),
                      SizedBox(height: 8,),



                      Text('Taxes & Charges ',style: TextStyle(fontSize: 10,color: Color(0xff6F6F6F),)),
                      SizedBox(height: 8,),



                      Text('Offer(-5%)',style: TextStyle(fontSize: 10,color: Color(0xffBF9300),)),
                      SizedBox(height: 8,),



                      Text('Grand Total',style: TextStyle(fontSize: 12,color: Colors.black,fontFamily: 'RobotoM')),

                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 30,),

                      Text("Rs 200",style: TextStyle(fontSize: 10,color: Color(0xff6F6F6F),)),
                      SizedBox(height: 8,),
                      Text("Rs 100",style: TextStyle(fontSize: 10,color: Color(0xff6F6F6F),)),
                      SizedBox(height: 8,),
                      Text("Rs300",style: TextStyle(fontSize: 10,color: Color(0xff6F6F6F),)),
                      SizedBox(height: 8,),
                      Text('Rs-10 ',style: TextStyle(fontSize: 10,color: Color(0xffBF9300),)),
                      SizedBox(height: 8,),
                      Text("Rs. 342.00",style: TextStyle(fontSize: 12,color: Colors.black,fontFamily: 'RobotoM')),

                    ],
                  ),



                ],

              ),

              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Total ",style: TextStyle(fontSize: 18,fontFamily: 'Proxima',color: Colors.white),),
                    ],
                  ),
                  Column(
                    children: [
                      Text("350",style: TextStyle(fontSize: 18,fontFamily: 'Sophia',color: Colors.white),),

                    ],
                  )

                ],
              )


            ],

          ),


        ),
      ),
    );
  }
  Widget _contact(BuildContext context){
    return Card(
      child:Container(
        height: 100,
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Contact Details',style: TextStyle(fontFamily: 'RobotoM',fontSize: 8,color: new Color(0xff818181)),),
                  Spacer(),
                  Text(
                    'Edit',
                    style: TextStyle(color: Color(0xffA3A3A3)),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                      Icon(
                        Icons.person,
                        color: Color(0xffFFCF30),
                        size: 15,
                      ),
                      SizedBox(width: 5,),
                  Text("Thomas Shelby",style: TextStyle(fontFamily: 'RobotoM',fontSize: 10,color: Colors.black),)
                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Icon(Icons.phone,color: Color(0xffFFCF30),size: 15,),
                  SizedBox(width: 5,),
                  Text("+91 3333 222 666",style: TextStyle(fontFamily: 'RobotoM',fontSize: 10,color: Colors.black),)
                ],
              )
            ],
          ),
        )
      )
    );
  }
}
