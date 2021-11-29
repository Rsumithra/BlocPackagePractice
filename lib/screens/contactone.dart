import 'package:blocpracticepattern/bloc/contactbloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/contacts.dart';

class Contactone extends StatefulWidget {
  const Contactone({Key? key}) : super(key: key);

  @override
  State<Contactone> createState() => _ContactoneState();
}

class _ContactoneState extends State<Contactone> {
  ContactblocBloc contactblocBloc = ContactblocBloc();
  late List<Contacts> firstset=[];

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
            return ListView.builder(
                itemCount: state.contacts.length,
                itemBuilder: (context, index) {
                  Contacts con = state.contacts[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    child: ListTile(
                        title: Text(con.name), subtitle: Text(con.contacts)),
                  );
                });
          } else if (state is ContactError) {
            return const Text("Something Went Wrong");
          } else {
            return const Text("Unknown Errror");
          }
        }),
      ),
    );
  }
}
