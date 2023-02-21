import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QR extends StatefulWidget {
  const QR({Key? key}) : super(key: key);

  @override
  State<QR> createState() => _QRState();
}

class _QRState extends State<QR> {
  bool _screenOpened = false;
  MobileScannerController cameraController = MobileScannerController();
  void _detectedQR(BarcodeCapture barcodeCapture) {
    if (!_screenOpened) {
      final String code = barcodeCapture.barcodes[0].rawValue ?? "---";
      debugPrint('Barcode found! $code');
      _screenOpened = true;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff300757),
        title: Text('Pay by QR'),
      ) ,
      body:Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xbb2C0354), Color(0x60A725B2)])),
        child: MobileScanner(
            controller: cameraController,
            onDetect: _detectedQR),

      ),
    );
  }
}