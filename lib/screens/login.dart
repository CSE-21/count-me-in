import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _email = "";
  var _password = "";

  Future<void> signIn(String email, String password) async {
    final response = await Supabase.instance.client.auth
        .signInWithPassword(email: email, password: password);
    final Session? session = response.session;
    final User? user = response.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Count Me In"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            // Container(
            //     alignment: Alignment.center,
            //     padding: const EdgeInsets.all(10),
            //     child: const Text(
            //       'TutorialKart',
            //       style: TextStyle(
            //           color: Colors.blue,
            //           fontWeight: FontWeight.w500,
            //           fontSize: 30),
            //     )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) {
                  _email = value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Address',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                onChanged: (value) {
                  _password = value;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            // TextButton(
            //   onPressed: () {
            //     //forgot password screen
            //   },
            //   child: const Text(
            //     'Forgot Password?',
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () async {
                  try {
                    await signIn(_email, _password);
                    Navigator.pushNamed(context, "/home");
                  } catch (e) {
                    print(e);
                  }
                  ;
                },
              ),
            ),
            Row(
              children: <Widget>[
                const Text('Do not have an account?'),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 14),
                  ),
                  onPressed: () {
                    //signup screen
                    Navigator.pushNamed(context, "/register");
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
