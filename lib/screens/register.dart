import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var _username = "";
  var _password = "";
  var _email = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Count Me In"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Create Account",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            // Text("Name"),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) {
                  _username = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your first name',
                ),
              ),
            ),
            // Text("Email Address"),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) {
                  _email = value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Email Address',
                ),
              ),
            ),
            // Text("Password"),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                onChanged: (value) {
                  _password = value;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter a strong password',
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
                child: const Text('Register'),
                onPressed: () async {
                  try {
                    await Supabase.instance.client.auth.signUp(
                      email: _email,
                      password: _password,
                    );
                    Navigator.pushNamed(context, "/home");
                  } catch (e) {
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Signup failed'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
