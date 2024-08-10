import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

const bgColor = Color(0xfffafafa);

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  bool isScanCompleted = false;

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                      child: Column(children: const [
                Text("Place the QR Code in the area")
              ]))),
              Expanded(
                  flex: 4, 
                  child: MobileScanner(
                    // missing allowDuplicates
                    onDetect: (barcode) { //changed from (barcode, args)
                      if(!isScanCompleted) {
                        List<Barcode> barcodes = barcode.barcodes;
                        print("QR Code found!");
                        //String code = barcode.raw;
                        isScanCompleted = true;
                      }
                    },
                    )),
              Expanded(
                  child: Container(
                color: Colors.amber,
              )),
            ],
          )),
    );
  }
}
