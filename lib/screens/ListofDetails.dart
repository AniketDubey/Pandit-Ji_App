// ignore_for_file: file_names, prefer_is_empty, prefer_const_constructors

import 'package:flutter/material.dart';

class ListofDetails extends StatefulWidget {
  //const ListofDetails({ Key? key }) : super(key: key);

  List<dynamic> l4;
  ListofDetails(this.l4);

  @override
  State<ListofDetails> createState() => _ListofDetailsState();
}

class _ListofDetailsState extends State<ListofDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: widget.l4.length == 0
          ? Center(
              child: Text("No Bus Found"),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                Map<String, dynamic> temp = widget.l4[index];
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Center(
                      child: Text("${temp["BusNum"]}"),
                    ),
                  ),
                );
              },
              itemCount: widget.l4.length,
            ),
    );
  }
}
