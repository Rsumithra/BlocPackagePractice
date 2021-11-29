import 'package:flutter/material.dart';

class ContactFour extends StatefulWidget {
  const ContactFour({Key? key}) : super(key: key);

  @override
  State<ContactFour> createState() => _ContactFourState();
}

class _ContactFourState extends State<ContactFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue,
      ),
    );
  }
}
