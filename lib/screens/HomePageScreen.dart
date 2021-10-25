// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:panditjiapp/screens/HomePage.dart';

class HomePageScreen extends StatelessWidget {
  //const HomePageScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text("Home"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(55),
            bottomRight: Radius.circular(55),
          ),
        ),
        elevation: 20,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomePage("Source Station"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: HomePage("Destination Station"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("OK"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
