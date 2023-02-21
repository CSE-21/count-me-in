import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

class Failure extends StatefulWidget {
  const Failure({Key? key}) : super(key: key);

  @override
  State<Failure> createState() => _SuccessState();
}

class _SuccessState extends State<Failure> {
  final supabase = Supabase.instance.client;
  startTime() async{
    var duration = new Duration(seconds: 6);
    return new Timer(duration, redirect);
  }
  redirect(){
    Navigator.pushNamed(context, '/home');
  }

  @override
  void InitState() async{
    await supabase
        .from('Attendance')
        .insert({'student_id': 12141680, 'Present':0});
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Icon(Icons.reddit),
          Text('Wrong QR')
        ],
      ),
    );
  }
}

