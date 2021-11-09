// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class FutureCheck extends StatefulWidget {
  const FutureCheck({Key? key}) : super(key: key);

  @override
  _FutureCheckState createState() => _FutureCheckState();
}

class _FutureCheckState extends State<FutureCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Check"),
      ),
      body: FutureBuilder(
        builder: (ctx, AsyncSnapshot projectSnap) {
          if (projectSnap.connectionState == ConnectionState.done) {
            if (projectSnap.hasError) {
              return Center(
                child: Text("${projectSnap.error}"),
              );
            }
          } else if (projectSnap.hasData) {
            final data = projectSnap.data;
            return Center(
              child: Text("$data"),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        future: getProjectDetails(),
      ),
    );
  }

  Future<List<dynamic>> getProjectDetails() async {
    List<dynamic> l1 = [];
    List<dynamic> l2 = [];
    List<dynamic> l3 = [];
    List<dynamic> l4 = [];

    var s1 = await FirebaseFirestore.instance
        .collection("Station")
        .where("SName", isEqualTo: "C")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        Map<String, dynamic> m1 = element.data();
        l1 = m1["IncBus"];
        //print(l1);
      });
    });

    var s2 = await FirebaseFirestore.instance
        .collection("Station")
        .where("SName", isEqualTo: "T")
        .get()
        .then(
      (value) {
        value.docs.forEach(
          (wholeDATA) {
            //print(wholeDATA);
            Map<String, dynamic> m2 = wholeDATA.data();
            l2 = m2["IncBus"];

            l1.forEach(
              (element) {
                //print(object)
                if (l2.contains(element)) {
                  l3.add(element);
                }
              },
            );
            //print(l3);
            l3.forEach(
              (element) {
                //print(element);
                FirebaseFirestore.instance
                    .collection("BusQR")
                    .where("BusNum", isEqualTo: element)
                    .get()
                    .then(
                  (value) {
                    value.docs.forEach(
                      (elems) {
                        Map<String, dynamic> m3 = elems.data();
                        Map<String, dynamic> temp = m3["Sdetails"];

                        print("yahanse $temp");

                        var index1 = temp.keys.firstWhere((ele) {
                          Map<String, dynamic> temp2 = temp[ele];
                          return (temp2.containsKey("C"));
                        });

                        print("C -> $index1");

                        var index2 = temp.keys.firstWhere((ele) {
                          Map<String, dynamic> temp2 = temp[ele];
                          return (temp2.containsKey("T"));
                        });

                        print("T -> $index2");

                        int a = int.parse(index1);
                        int b = int.parse(index2);

                        //print(b - a);

                        if ((b - a) > 0) {
                          l4.add(m3);
                        }

                        /* if ((b - a) > 0) {
                        l4.add(element.data());
                      } */
                      },
                    );
                  },
                );
              },
            );
          },
        );
      },
    );

    return l4;
  }
}
