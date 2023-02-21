import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class qrgen extends StatefulWidget {

  const qrgen({Key? key}) : super(key: key);

  @override
  State<qrgen> createState() => _qrgenState();
}

class _qrgenState extends State<qrgen> {
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override

  void initState(){
    String code = getRandomString(10);

  }

  Widget build(BuildContext context) {
    return  Scaffold(
      body:QrImage(
        data: "12141680",
        version: QrVersions.auto,
        size: 200.0,
      ),
    );
  }
}
