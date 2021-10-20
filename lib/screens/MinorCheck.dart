// ignore_for_file: file_names, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MinorCheck extends StatefulWidget {
  const MinorCheck({Key? key}) : super(key: key);

  @override
  _MinorCheckState createState() => _MinorCheckState();
}

class _MinorCheckState extends State<MinorCheck> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('BusQR').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aniket"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            final LDoc = snapshot.data!.docs;
            /*
            LDoc.forEach((element) {
              //print(element.data());
              final aniMap = element.data() as Map<String, dynamic>;
              print(aniMap["BusNum"]);
            }); */

            return ListView.builder(
              itemBuilder: (cctx, index) {
                return ListTile(
                  leading: Text("${LDoc[index]["BusNum"]}"),
                );
              },
              itemCount: LDoc.length,
            );
          } else {
            return Text("Loading");
          }
        },
      ),
    );
  }
}
