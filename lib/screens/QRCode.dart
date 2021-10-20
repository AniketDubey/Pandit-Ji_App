// ignore_for_file: file_names, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatefulWidget {
  //const QRCode({Key? key}) : super(key: key);

  @override
  State<QRCode> createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  final controller = TextEditingController();

  Map<String, String> ani = {
    "Name": "Aniket",
    "Age": "25",
    "Salary": "100",
  };

  //var data = JsonCodec(toEncodable: );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QRCODE"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: json.encode(ani),
                size: 200,
                backgroundColor: Colors.white,
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "Enter data",
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.done,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
