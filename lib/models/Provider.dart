// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BList with ChangeNotifier {
  List<dynamic> _l4 = [];

  List<dynamic> amit = [];

  List<dynamic> get l4 {
    return _l4;
  }

  Future<void> fetchData(_details) async {
    List<dynamic> l1 = [];
    List<dynamic> l2 = [];
    List<dynamic> l3 = [];

    try {
      var s1 = await FirebaseFirestore.instance
          .collection("Station")
          .where("SName", isEqualTo: "${_details["Source"]}")
          .get();

      s1.docs.forEach((element) {
        Map<String, dynamic> m1 = element.data();
        l1 = m1["IncBus"];
      });
    } catch (error) {
      print(error);
    }

    try {
      var s2 = await FirebaseFirestore.instance
          .collection("Station")
          .where("SName", isEqualTo: "${_details["Destination"]}")
          .get();

      s2.docs.forEach((element) {
        Map<String, dynamic> m2 = element.data();
        l2 = m2["IncBus"];
      });

      l1.forEach((ele1) {
        if (l2.contains(ele1)) {
          l3.add(ele1);
        }
      });

      l3.forEach(
        (element) async {
          //print(element);
          var s3 = await FirebaseFirestore.instance
              .collection("BusQR")
              .where("BusNum", isEqualTo: element)
              .get();
          s3.docs.forEach(
            (elems) {
              Map<String, dynamic> m3 = elems.data();
              Map<String, dynamic> temp = m3["Sdetails"];

              //print("yahanse $temp");

              var index1 = temp.keys.firstWhere((ele) {
                Map<String, dynamic> temp2 = temp[ele];
                return (temp2.containsKey("${_details["Source"]}"));
              });

              //print("C -> $index1");

              var index2 = temp.keys.firstWhere((ele) {
                Map<String, dynamic> temp2 = temp[ele];
                return (temp2.containsKey("${_details["Destination"]}"));
              });

              //print("T -> $index2");

              int a = int.parse(index1);
              int b = int.parse(index2);

              //print(b - a);

              if ((b - a) > 0) {
                //print("andar aaya main");

                _l4.add(m3);
                notifyListeners();
                amit.add(m3);
                //print(_l4);
              }
            },
          );
        },
      );
    } catch (error) {
      print(error);
    }

    /* notifyListeners();
    print("notify listener ke upar $amit");
    print("l4 ki updated length${_l4.length}"); */
  }

  Future<void> screenChange() async {
    l4.clear();
  }
}
