import 'dart:async';

import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  startTime() async{
    var duration = new Duration(seconds: 6);
    return new Timer(duration, redirect);
  }
  redirect(){
    Navigator.pushNamed(context, '/home');
  }

  @override
  void InitState(){
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Icon(Icons.check),
          Text('Your attendance is Marked')
        ],
      ),
    );
  }
}

