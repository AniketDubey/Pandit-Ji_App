// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:panditjiapp/models/Provider.dart';
import 'package:provider/provider.dart';
import 'package:panditjiapp/screens/ListofDetails.dart';

class BusDetailScreen extends StatefulWidget {
  //const BusDetailScreen({Key? key}) : super(key: key);

  Map<String, String> _details;
  BusDetailScreen(this._details);

  @override
  _BusDetailScreenState createState() => _BusDetailScreenState();
}

class _BusDetailScreenState extends State<BusDetailScreen> {
  /* List<dynamic> l1 = [];
  List<dynamic> l2 = [];
  List<dynamic> l3 = [];
  List<dynamic> l4 = []; */

  bool _isLoading = true;

  void submitData() async {
    await Provider.of<BList>(context, listen: false).fetchData(widget._details);
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    submitData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(data);

    /* FirebaseFirestore.instance
        .collection("Station")
        .where("SName", isEqualTo: "${widget._details["Source"]}")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        Map<String, dynamic> m1 = element.data();
        l1 = m1["IncBus"];
        //print(l1);
      });
    });

    FirebaseFirestore.instance
        .collection("Station")
        .where("SName", isEqualTo: "${widget._details["Destination"]}")
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
                          return (temp2
                              .containsKey("${widget._details["Source"]}"));
                        });

                        print("C -> $index1");

                        var index2 = temp.keys.firstWhere((ele) {
                          Map<String, dynamic> temp2 = temp[ele];
                          return (temp2.containsKey(
                              "${widget._details["Destination"]}"));
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
        //_isLoading = false;
      },
    );
    //setState(() {});
    print("finallength hai ${l4.length}"); */
    //print("${widget._details["Source"]}");
    //print("${widget._details["Destination"]}");
    return WillPopScope(
      onWillPop: () async {
        Provider.of<BList>(context, listen: false).screenChange();
        //Navigator.of(context).pop();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: Consumer<BList>(
          builder: (ctx, data, ch) {
            //print("from consumer $data.l4");
            //print(data.l4);
            return _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 6,
                    ),
                  )
                : data.l4.length == 0
                    ? Center(
                        child: Text("NO ITEM FOUND"),
                      )
                    : ListView.builder(
                        itemBuilder: (ctx, index) {
                          Map<String, dynamic> temp = data.l4[index];
                          Map<String, dynamic> mp = temp["Sdetails"];
                          print(temp);
                          //Map<String, dynamic> mpp2 = mp["1"];
                          //print(mpp2.keys);
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Text("Bus No. "),
                                      Spacer(),
                                      Text("${temp["BusNum"]}"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Text("Available Seats"),
                                      Spacer(),
                                      Text("${100 - temp["PasLog"]}"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Text("Station Name"),
                                      Spacer(),
                                      Text("ETA"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemBuilder: (cctx, ind) {
                                      Map<String, dynamic> sName =
                                          mp[(ind + 1).toString()];
                                      //print(sName);
                                      var name = sName.keys.toString();
                                      name = name.substring(1, name.length - 1);
                                      //print(name);
                                      //var atime =
                                      return Row(
                                        children: [
                                          Text("$name"),
                                          Spacer(),
                                          Text("${sName[name][0]}"),
                                        ],
                                      );
                                    },
                                    itemCount: mp.length,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: data.l4.length,
                      ); /* Center(
              child: FloatingActionButton.extended(
                  onPressed: () {
                    print("flength hai ${l4.length}");
                    //print(l4);
    
                    var result;
    
                    /* await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => ListofDetails(l4),
                    ),
                  ); */
    
                    /* FirebaseFirestore.instance
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
                  ); */
    
                    //print(result);
                  },
                  label: Text("PRESS")),
            ); */
          },
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

        /* body: _isLoading
            ? CircularProgressIndicator()
            : Padding(
                padding: EdgeInsets.all(18),
                child: l4.length == 0
                    ? Center(
                        child: Text("dsadsjabdskajdkjsa..."),
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
      ),
    );
  }
}
