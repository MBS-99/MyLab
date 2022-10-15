import 'package:ass07/screens/CRUD.dart';
import 'package:ass07/screens/storeP1.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class log_in extends StatefulWidget {
  const log_in({super.key});

  @override
  State<log_in> createState() => _log_inState();
}

class _log_inState extends State<log_in> {
  TextEditingController emailLogIn = TextEditingController();
  TextEditingController passLogIn = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/loginImage.jpg"), fit: BoxFit.cover),
        ),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              "Log In",
              style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: emailLogIn,
              decoration: InputDecoration(
                  label: Text("Enter your email"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  hintText: "eg: example@gmail.com"),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: passLogIn,
              obscureText: true,
              decoration: InputDecoration(
                  label: Text("Enter your Password"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  hintText: "at least 8 charecters"),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: ElevatedButton.icon(
                onPressed: (() async {
                  try {
                    var authObject2 = FirebaseAuth.instance;
                    UserCredential myUser2 =
                        await authObject2.signInWithEmailAndPassword(
                            email: emailLogIn.text, password: passLogIn.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyStore();
                        },
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("$e")));
                  }
                }),
                icon: Icon(Icons.login),
                label: Text("Log In"),
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    backgroundColor: Color.fromARGB(255, 203, 68, 113)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
