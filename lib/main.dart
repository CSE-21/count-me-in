import 'package:count_me_in/screens/profPanel.dart';
import 'package:count_me_in/screens/report.dart';
import 'package:count_me_in/screens/status/failure.dart';
import 'package:count_me_in/screens/status/success.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/home.dart';
import 'screens/logReg.dart';
import 'screens/login.dart';
import 'screens/qrscan.dart';
import 'screens/register.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://fglvdaywknlafogfwewm.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZnbHZkYXl3a25sYWZvZ2Z3ZXdtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzcwMDY1MjksImV4cCI6MTk5MjU4MjUyOX0.Q4ePoigtKqXT95M0acZBEE_PDHTQOBnFBYEbh_cy-v8',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/profPanel',
      routes: {
        '/logReg': (context) => LogRegister(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/home': (context) => HomeScreen(),
        '/qr': (context) => QR(),
        '/profPanel': (context) => ProfPanel(),
        '/success': (context) => Success(),
        '/failure': (context) => Failure(),
        '/report': (context) => Report()
      },
      title: '',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
    );
  }
}
