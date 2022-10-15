import 'package:flutter/material.dart';

class store_p1 extends StatefulWidget {
  const store_p1({super.key});

  @override
  State<store_p1> createState() => _store_p1State();
}

class _store_p1State extends State<store_p1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text(
        "To be continued...",
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
