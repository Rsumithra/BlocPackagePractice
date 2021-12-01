import 'package:blocpracticepattern/pages/tab_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Contactapp());

class Contactapp extends StatefulWidget {
  const Contactapp({Key? key}) : super(key: key);

  @override
  State<Contactapp> createState() => _ContactappState();
}

class _ContactappState extends State<Contactapp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TabPage());
  }
}
