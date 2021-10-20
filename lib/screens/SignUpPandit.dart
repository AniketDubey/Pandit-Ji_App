// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUpPandit extends StatefulWidget {
  //const LoginUser({Key? key}) : super(key: key);

  @override
  State<SignUpPandit> createState() => _SignUpPanditState();
}

class _SignUpPanditState extends State<SignUpPandit> {
  final _loginUser = GlobalKey<FormState>();

  String passValidator(String password) {
    if (password.length < 8) return "Password is Too Short !";
    return "OK";
  }

  List<dynamic> filData = [{}];

  @override
  void initState() {
    // TODO: implement initState
    /* FirebaseFirestore.instance
        .collection('BusQR')
        .where("Station", arrayContainsAny: ["P"])
        .get()
        .then((value) {
          value.docs.forEach((element) {
            //print(element.data());
            filData.add(element.data());
          });
        }); */

    var data = FirebaseFirestore.instance
        .collection('BusQR')
        .where("Station", arrayContainsAny: ["P"])
        .where("PasLog", isEqualTo: 26)
        .get();

    data.then((value) {
      value.docs.forEach((element) {
        print(element.data());
        filData.add(element.data());
      });
    });
    //print(filData.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(filData.length);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text("Please SignUp Yourself"),
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
        child: FloatingActionButton.extended(
          onPressed: () {
            //print(filData.length);
            filData.forEach((element) {
              print(element);
            });
          },
          label: Text("Press"),
        ),
      ),
    );
  }
}
