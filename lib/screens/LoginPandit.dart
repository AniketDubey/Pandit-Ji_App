// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginUser extends StatelessWidget {
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
        title: Text("Please Login Yourself"),
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
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Pandit ID*",
                ),
                validator: (val) {},
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 25,
                  bottom: 25,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password*",
                  ),
                  validator: (password) {
                    final String rVal = passValidator(password!);
                    if (rVal == "OK") {}
                  },
                ),
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                },
                label: Text("Login !"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
