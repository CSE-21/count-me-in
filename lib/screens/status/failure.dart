import 'dart:async';

import 'package:flutter/material.dart';

class Failure extends StatefulWidget {
  const Failure({Key? key}) : super(key: key);

  @override
  State<Failure> createState() => _SuccessState();
}

class _SuccessState extends State<Failure> {
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

