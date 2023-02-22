import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class ProfPanel extends StatefulWidget {
  const ProfPanel({Key? key}) : super(key: key);

  @override
  State<ProfPanel> createState() => _ProfPanelState();
}

class _ProfPanelState extends State<ProfPanel> {
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  Random _rnd = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  final supabase = Supabase.instance.client;
  @override
  Future<String> _generate() async{
    String code = getRandomString(10);
    await supabase .from('QR code') .update({'code': code}) .match({'id':1});
    print(code);
    return code;
  }
  void _regenerate(){
    setState(() {
      String code = getRandomString(10);
    });
  }

  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: (){
          _regenerate();
        },
              child: Text('Generate QR')),
          FutureBuilder<String>(
            future: _generate(), // a previously-obtained Future<String> or null
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              List<Widget> children;
                if (snapshot.hasData) {
                  children = <Widget>[
                    QrImage(
                      data: "${snapshot.data}",
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ];
                } else if (snapshot.hasError) {
                  children = <Widget>[
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  ];
                } else {
                  children = const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Generating QR...'),
                    ),
                  ];
                }

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                ),
              );
            },
          ),
          ElevatedButton(onPressed:(){ Navigator.pushNamed(context, '/report');}, child: Text('Report'))
        ],

      ),
    );
  }
}
