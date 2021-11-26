

import 'package:blocpracticepattern/bloc/contactbloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Models/Contacts.dart';


class Contactone extends StatefulWidget {
  const Contactone({Key? key}) : super(key: key);

  @override
  State<Contactone> createState() => _ContactoneState();
}

class _ContactoneState extends State<Contactone> {
  ContactblocBloc contactblocBloc = ContactblocBloc();

  @override
  void initState() {
    contactblocBloc.add(FetchContactData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => contactblocBloc,
      child: Scaffold(
        body: Container(child: BlocBuilder<ContactblocBloc, ContactblocState>(
            builder: (context, state) {
          if (state is Contactblocloading) {
            return const Text("Loading");
          } else if (state is ContactFetchData) {
            return ListView.builder(
                itemCount: state.contacts.length,
                itemBuilder: (context, index) {
                  Contacts con = state.contacts[index];
                  return ListTile(
                      title: Text(con.name), subtitle: Text(con.contacts));
                });
          } else if (state is ContactError) {
            return const Text("Something Went Wrong");
          } else {
            return Text("Unknown Errror");
          }
        })),
      ),
    );
  }
}
