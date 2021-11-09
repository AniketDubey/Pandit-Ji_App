// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:panditjiapp/screens/FutureCheck.dart';
import 'BusDetailScreen.dart';
import 'package:panditjiapp/screens/HomePage.dart';

class HomePageScreen extends StatelessWidget {
  //const HomePageScreen({ Key? key }) : super(key: key);

  Map<String, String> details = {"Source": "", "Destination": ""};

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
              HomePage("Source Station", details),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: HomePage("Destination Station", details),
              ),
              ElevatedButton(
                onPressed: () {
                  print("frome here ${details["Source"]}");
                  print(details["Destination"]);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => BusDetailScreen(),
                    ),
                  );
                },
                child: Text("OK"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
