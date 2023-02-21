import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class QR extends StatefulWidget {
  const QR({Key? key}) : super(key: key);

  @override
  State<QR> createState() => _QRState();
}

class _QRState extends State<QR> {
  final supabase = Supabase.instance.client;
  bool _screenOpened = false;
  MobileScannerController cameraController = MobileScannerController();
  void _detectedQR(BarcodeCapture barcodeCapture) async {
    if (!_screenOpened) {
      final String code = barcodeCapture.barcodes[0].rawValue ?? "---";
      debugPrint('Barcode found! $code');
      _screenOpened = true;
      final data = await supabase.from('QR code').select('code').eq('id', 1);
      print(data);
      print(code);
      print(data[0]['code']);
      if (data[0]['code'] == code) {
        Navigator.pushNamed(context, '/success');
      } else {
        Navigator.pushNamed(context, '/failure');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xbb2C0354), Color(0x60A725B2)])),
        child:
            MobileScanner(controller: cameraController, onDetect: _detectedQR),
      ),
    );
  }
}
