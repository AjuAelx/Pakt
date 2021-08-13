import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            autofocus: true,
            showCursor: false,
            cursorColor: Colors.yellow,
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
                borderSide: new BorderSide(color: new Color(0xffE6E6E6)),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: new Color(0xffE6E6E6)),
                borderRadius: BorderRadius.circular(8.0),
              ),
              border: new OutlineInputBorder(
                borderSide: new BorderSide(color: new Color(0xff4E5360)),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
