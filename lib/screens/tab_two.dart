import 'package:blocpracticepattern/bloc/contactbloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/contacts.dart';

class Contacttwo extends StatefulWidget {
  const Contacttwo({Key? key}) : super(key: key);

  @override
  State<Contacttwo> createState() => _ContacttwoState();
}

class _ContacttwoState extends State<Contacttwo> {
  ContactblocBloc contactblocBloc = ContactblocBloc();
  List<Contacts> secondset = [];
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
            for (int i = 25; i < 50; i++) {
              secondset.add(state.contacts[i]);
            }
            return ListView.builder(
                itemCount: secondset.length,
                itemBuilder: (context, index) {
                  Contacts con = secondset[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    child: ListTile(
                      title: Text(con.name),
                      subtitle: Text(con.contacts),
                      trailing: Image.network("https://picsum.photos/200/300"),
                    ),
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
