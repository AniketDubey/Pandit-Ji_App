// ignore_for_file: file_names, avoid_web_libraries_in_flutter

import 'package:http/http.dart' as http;
import 'dart:io' show Platform;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Scanqr extends StatefulWidget {
  //const Scanqr({Key? key}) : super(key: key);

  @override
  _ScanqrState createState() => _ScanqrState();
}

class _ScanqrState extends State<Scanqr> {
  final qrKey = GlobalKey(debugLabel: "QR");
  Barcode? barcode;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void reassemble() async {
    // TODO: implement reassemble
    super.reassemble();

    bool isAndroid = Theme.of(context).platform == TargetPlatform.android;
    if (isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            buildQRView(context),
            Positioned(
              bottom: 10,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white24,
                ),
                child: buildResult(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildResult() {
    if (barcode == null) {
      return Text("Scan QR");
    } else {
      var animap = json.decode(barcode!.code);
      print(animap);
      return Text(barcode!.code);
    }
    //return Text(barcode!.code);
  }

  Widget buildQRView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        cutOutSize: MediaQuery.of(context).size.width * 0.80,
        borderWidth: 10,
        borderLength: 20,
        borderRadius: 10,
        borderColor: Colors.blueAccent,
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode = barcode;
      });
    });
  }
}
