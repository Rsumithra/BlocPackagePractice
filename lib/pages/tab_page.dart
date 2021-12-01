import 'package:blocpracticepattern/bloc/contactbloc_bloc.dart';
import 'package:blocpracticepattern/models/contacts.dart';
import 'package:blocpracticepattern/pages/contacts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/contants.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  ContactblocBloc contactblocBloc = ContactblocBloc();
  List<Contacts> contactval = [];
  List<Contacts> firstset = [];
  List<Contacts> secondset = [];
  List<Contacts> thirdset = [];
  List<Contacts> fourthset = [];
  @override
  void initState() {
    contactblocBloc.add(FetchContactData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => contactblocBloc,
      child: Scaffold(
        body: BlocBuilder<ContactblocBloc, ContactblocState>(
            builder: (context, state) {
          if (state is Contactblocloading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is ContactFetchData) {
            firstset = state.contacts.sublist(0, 25);
            secondset = state.contacts.sublist(25, 50);
            thirdset = state.contacts.sublist(50, 75);
            fourthset = state.contacts.sublist(75, 100);
            return DefaultTabController(
              child: Scaffold(
                appBar: AppBar(
                  title: const Text(Constants.apptitle),
                  bottom: TabBar(
                    tabs: [
                      for (int i = 1; i <= 4; i++)
                        Tab(text: Constants.tabname + '$i')
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    ContactList(listofContacts: firstset),
                    ContactList(listofContacts: secondset),
                    ContactList(listofContacts: thirdset),
                    ContactList(
                      listofContacts: fourthset,
                    ),
                  ],
                ),
              ),
              length: 4,
              initialIndex: 0,
            );
          } else if (state is ContactError) {
            return const Text(Constants.loadingerror);
          } else {
            return const Text(Constants.error);
          }
        }),
      ),
    );
  }
}
