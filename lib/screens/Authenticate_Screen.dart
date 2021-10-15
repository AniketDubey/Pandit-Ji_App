// ignore_for_file: camel_case_types, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:panditjiapp/screens/LoginUser.dart';
import 'package:panditjiapp/screens/SignUpPandit.dart';
import 'package:panditjiapp/screens/SignUpUser.dart';

class Authenticate_Screen extends StatefulWidget {
  //const Authenticate_Screen({Key? key}) : super(key: key);

  @override
  _Authenticate_ScreenState createState() => _Authenticate_ScreenState();
}

class _Authenticate_ScreenState extends State<Authenticate_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(
                  "assets/images/logo.jpg",
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            color: Colors.orange,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    FloatingActionButton.extended(
                      heroTag: "h1",
                      icon: Icon(Icons.login),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return LoginUser();
                            },
                          ),
                        );
                      },
                      label: Text("Login As User"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 125,
                    ),
                    FloatingActionButton.extended(
                      heroTag: "h2",
                      icon: Icon(Icons.login),
                      onPressed: () {},
                      label: Text("Login As PanditJi"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    FloatingActionButton.extended(
                      heroTag: "h3",
                      icon: Icon(Icons.login),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return SignUpUser();
                            },
                          ),
                        );
                      },
                      label: Text("SignUp As User"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 125,
                    ),
                    FloatingActionButton.extended(
                      heroTag: "h4",
                      icon: Icon(Icons.login),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return SignUpPandit();
                            },
                          ),
                        );
                      },
                      label: Text("SignUp As PanditJi"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    FloatingActionButton.extended(
                      heroTag: "h5",
                      icon: Icon(Icons.login),
                      onPressed: () {},
                      label: Text("Help"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
