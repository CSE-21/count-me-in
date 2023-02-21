import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Failure extends StatefulWidget {
  const Failure({Key? key}) : super(key: key);

  @override
  State<Failure> createState() => _SuccessState();
}

class _SuccessState extends State<Failure> {
  final supabase = Supabase.instance.client;
  startTime() async {
    // await supabase
    //     .from('Attendance')
    //     .insert({'student_id': 12141680, 'Present':0});
    var duration = new Duration(seconds: 2);
    return new Timer(duration, redirect);
  }

  redirect() {
    Navigator.pushNamed(context, '/home');
  }

  @override
  void initState() async {
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Icon(Icons.reddit), Text('Wrong QR')],
      ),
    );
  }
}
