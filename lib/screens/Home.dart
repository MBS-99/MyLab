import 'package:ass07/screens/logIn.dart';
import 'package:ass07/screens/signUp.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Weclome to Our Store",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Sign up now and get 20% discount on your first purchase !",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 0, 38, 91)),
              ),
              SizedBox(
                height: 45,
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: ElevatedButton.icon(
                  onPressed: (() {
                    setState(
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) {
                              return sign_up();
                            }),
                          ),
                        );
                      },
                    );
                  }),
                  icon: Icon(Icons.login),
                  label: Text("Sign Up"),
                  style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      primary: Color.fromARGB(255, 203, 68, 113)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Already have account? Please log in",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 0, 38, 91)),
              ),
              SizedBox(
                height: 45,
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: ElevatedButton.icon(
                  onPressed: (() {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return log_in();
                          },
                        ),
                      );
                    });
                  }),
                  icon: Icon(Icons.login),
                  label: Text("Log In"),
                  style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      primary: Color.fromARGB(255, 203, 68, 113)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
