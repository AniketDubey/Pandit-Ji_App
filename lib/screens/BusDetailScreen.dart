// ignore_for_file: file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BusDetailScreen extends StatefulWidget {
  //const BusDetailScreen({Key? key}) : super(key: key);

  @override
  _BusDetailScreenState createState() => _BusDetailScreenState();
}

class _BusDetailScreenState extends State<BusDetailScreen> {
  List<dynamic> l1 = [];
  List<dynamic> l2 = [];
  List<dynamic> l3 = [];
  List<dynamic> l4 = [];

  @override
  void initState() {
    var s1 = FirebaseFirestore.instance
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

    var s2 = FirebaseFirestore.instance
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
                          setState(() {
                            l4.add(m3);
                          });
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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("finallength hai ${l4.length}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Center(
        child: FloatingActionButton.extended(
            onPressed: () {
              print("flength hai ${l4.length}");
              //print(l4);

              var result;

              FirebaseFirestore.instance
                  .collection("BusQR")
                  .where("BusNum", isEqualTo: "1010U")
                  .get()
                  .then(
                (value) {
                  var data = value.docs;
                  data.forEach((element) {
                    print(element.id);
                  });
                },
              );

              //print(result);
            },
            label: Text("PRESS")),
      ),
      /* body: Padding(
        padding: EdgeInsets.all(18),
        child: l4.length == 0
            ? Center(
                child: Text("Loading..."),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  Map<String, dynamic> temp = l4[index];
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Center(
                        child: Text("${temp["BusNum"]}"),
                      ),
                    ),
                  );
                },
                itemCount: l4.length,
              ),
      ), */
    );
  }
}
