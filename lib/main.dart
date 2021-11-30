import 'package:blocpracticepattern/screens/tab_four.dart';
import 'package:blocpracticepattern/screens/tab_one.dart';
import 'package:blocpracticepattern/screens/tab_three.dart';
import 'package:blocpracticepattern/screens/tab_two.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Myapp());

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
          title: const Text('Contact App'),
          bottom: const TabBar(
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
        body: const TabBarView(
          children: [Contactone(), Contacttwo(), Contactthree(), ContactFour()],
        ),
      ),
      length: 4,
      initialIndex: 0,
    ));
  }
}
