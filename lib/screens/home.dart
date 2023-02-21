import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Count-Me-In'),),
      body: Column(
        children: [
          Text('Hey!'),
          SizedBox(height: 15,),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/qr');
          }, child: Text('Mark Attendance'))
        ],
      ),
    );
  }
}
