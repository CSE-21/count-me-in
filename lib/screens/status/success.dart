import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
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
        .insert({'student_id': 12141680, 'Present':1});
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

