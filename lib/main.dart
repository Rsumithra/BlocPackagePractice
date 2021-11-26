import 'package:blocpracticepattern/contacts/contactone.dart';
import 'package:blocpracticepattern/contacts/contactthree.dart';
import 'package:blocpracticepattern/contacts/contacttwo.dart';
import 'package:flutter/material.dart';

import 'contacts/contactfour.dart';

void main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contact App'),
          bottom: TabBar(
            tabs: [
              Tab(text: "Contact1"),
              Tab(text: "Contact2"),
              Tab(
                text: 'Contact3',
              ),
              Tab(
                text: "Contact4",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [Contactone(), Contacttwo(), Contactthree(), ContactFour()],
        ),
      ),
      length: 4,
      initialIndex: 0,
    ));
  }
}
