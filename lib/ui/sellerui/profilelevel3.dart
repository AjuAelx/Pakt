import 'package:flutter/material.dart';

class ProfileLevel3 extends StatefulWidget {
  const ProfileLevel3({Key? key}) : super(key: key);

  @override
  _ProfileLevel3State createState() => _ProfileLevel3State();
}

class _ProfileLevel3State extends State<ProfileLevel3> {
  final bank = TextEditingController();
  final accountHolder = TextEditingController();
  final accountNo = TextEditingController();
  final ifsc = TextEditingController();
  final branch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Complete Your Profile',
          style: TextStyle(fontSize: 16, fontFamily: 'RobotoM'),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Account Information Progress",
            style: TextStyle(
                color: Colors.black, fontFamily: 'RobotoB', fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: MyCustomContainer(
              progress: 0.75,
              size: MediaQuery.of(context).size.width - 30,
              backgroundColor: Colors.grey,
              progressColor: Color(0xffFFCC00),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("3/4 Steps"),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 3,
                ),
                Text(
                  "Bank Details",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoB'),
                )
              ],
            ),
          ),
          Divider(),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              child: TextFormField(
                controller: bank,
                showCursor: true,
                cursorColor: Colors.yellow,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoB'),
                decoration: InputDecoration(
                  fillColor: Color(0xffF8F8F8),
                  filled: true,
                  labelText: 'Bank',
                  labelStyle: TextStyle(color: Color(0xffA3A3A3)),
                  contentPadding: const EdgeInsets.all(10),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              child: TextFormField(
                controller: accountHolder,
                showCursor: true,
                cursorColor: Colors.yellow,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoB'),
                decoration: InputDecoration(
                  fillColor: Color(0xffF8F8F8),
                  filled: true,
                  labelText: 'Account Holder',
                  labelStyle: TextStyle(color: Color(0xffA3A3A3)),
                  contentPadding: const EdgeInsets.all(10),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              child: TextFormField(
                controller: accountNo,
                showCursor: true,
                cursorColor: Colors.yellow,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoB'),
                decoration: InputDecoration(
                  fillColor: Color(0xffF8F8F8),
                  filled: true,
                  labelText: 'Account Number',
                  labelStyle: TextStyle(color: Color(0xffA3A3A3)),
                  contentPadding: const EdgeInsets.all(10),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              child: TextFormField(
                controller: ifsc,
                showCursor: true,
                cursorColor: Colors.yellow,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoB'),
                decoration: InputDecoration(
                  fillColor: Color(0xffF8F8F8),
                  filled: true,
                  labelText: 'IFSC',
                  labelStyle: TextStyle(color: Color(0xffA3A3A3)),
                  contentPadding: const EdgeInsets.all(10),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              child: TextFormField(
                controller: branch,
                showCursor: true,
                cursorColor: Colors.yellow,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoB'),
                decoration: InputDecoration(
                  fillColor: Color(0xffF8F8F8),
                  filled: true,
                  labelText: 'Branch',
                  labelStyle: TextStyle(color: Color(0xffA3A3A3)),
                  contentPadding: const EdgeInsets.all(10),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          MaterialButton(
              color: Color(0xffFFCC00),
              height: 45,
              minWidth: MediaQuery.of(context).size.width - 30,
              child: Text("Next",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoM',
                      fontSize: 11)),
              onPressed: () {})
        ]),
      )),
    );
  }
}

class MyCustomContainer extends StatelessWidget {
  final Color backgroundColor;
  final Color progressColor;
  final double progress;
  final double size;

  const MyCustomContainer({
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.amber,
    required this.progress,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4,
      width: size,
      child: Stack(
        children: [
          Container(
            color: backgroundColor,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: size * progress,
              color: progressColor,
            ),
          ),
        ],
      ),
    );
  }
}
