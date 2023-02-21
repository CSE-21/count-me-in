import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  final supabase = Supabase.instance.client;
  startTime() async {
    await supabase
        .from('Attendance')
        .insert({'student_id': 12141680, 'Present': 1});
    var duration = new Duration(seconds: 2);
    return new Timer(duration, redirect);
  }

  redirect() {
    Navigator.pushNamed(context, '/home');
  }

  @override
  void initState() {
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Icon(Icons.check), Text('Your attendance is Marked')],
      ),
    );
  }
}
