import 'package:ass07/screens/CRUD.dart';
import 'package:ass07/screens/storeP1.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  TextEditingController email1 = TextEditingController();
  TextEditingController pass1 = TextEditingController();
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
              "Sign Up",
              style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: email1,
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
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                hintText: "can contain: _ , numbers , letters",
                label: Text("Enter your username"),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: pass1,
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
              height: 25,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                hintText: "Re-type password",
                label: Text("Re-type password"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: ElevatedButton.icon(
                onPressed: (() async {
                  try {
                    var authObject1 = FirebaseAuth.instance;
                    UserCredential myUser1 =
                        await authObject1.createUserWithEmailAndPassword(
                            email: email1.text, password: pass1.text);
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
                label: Text("Sign Up"),
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
