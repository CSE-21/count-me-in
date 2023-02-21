import 'package:flutter/material.dart';

class ProfPanel extends StatefulWidget {
  const ProfPanel({Key? key}) : super(key: key);

  @override
  State<ProfPanel> createState() => _ProfPanelState();
}

class _ProfPanelState extends State<ProfPanel> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: (){
          Navigator.pushNamed(context, '/qrgen');
        },
              child: Text('Generate QR'))
        ],
      ),
    );
  }
}
