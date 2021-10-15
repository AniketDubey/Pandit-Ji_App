// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpPandit extends StatelessWidget {
  //const LoginUser({Key? key}) : super(key: key);

  final _loginUser = GlobalKey<FormState>();

  String passValidator(String password) {
    if (password.length < 8) return "Password is Too Short !";
    return "OK";
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                color: Colors.yellow,
                height: MediaQuery.of(context).size.height * 0.45,
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Image.asset("assets/images/key.jpg"),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Container(
                          width: 20,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Name*",
                            ),
                          ),
                        ),
                        Container(
                          width: 20,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Name*",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
