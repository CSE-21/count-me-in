import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  final supabase = Supabase.instance.client;

  Future<PostgrestResponse<dynamic>> _getData() async{
    final data = await supabase .from('Attendance') .select('student_id',const FetchOptions(
      count: CountOption.exact,
    )) ;
    return data;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         FutureBuilder<PostgrestResponse<dynamic>>(
          future: _getData(), // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<PostgrestResponse<dynamic>> snapshot) {
            Widget children;
            if (snapshot.hasData) {
              final cnt = (snapshot.data)?.count;
              children =
                ListView.builder(
                    itemCount: snapshot.data?.data.length,
                    itemBuilder: (BuildContext context, int index){
                  return SizedBox(
                  child: Center(child: Text('${(snapshot.data)?.data[index]['student_id']} ' )),
                  );
            });
            } else if (snapshot.hasError) {
              children =
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                );
            }
            else {
              children =
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                );
            }
            return Center(
              child: children
            );
          },
        ),

    );
  }
}
