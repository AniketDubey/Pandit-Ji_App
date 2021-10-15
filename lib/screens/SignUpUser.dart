// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpUser extends StatelessWidget {
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
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Name*",
                ),
                validator: (nval) {},
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 25,
                  bottom: 25,
                ),
                child: TextFormField(
                  //obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Password*",
                  ),
                  validator: (password) {
                    final String rVal = passValidator(password!);
                    if (rVal == "OK") {}
                  },
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Confirm Password*"),
                validator: (nval) {},
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 25,
                  bottom: 25,
                ),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: "Aadhar Number*"),
                        validator: (nval) {},
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: "Mobile Number*"),
                        validator: (nval) {},
                      ),
                    ),
                  ],
                ),
              ),
              TextFormField(
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: "Address*",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 25,
                ),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                  },
                  label: Text("SignUp !"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
