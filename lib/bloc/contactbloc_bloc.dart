import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:blocpracticepattern/Models/Contacts.dart';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'contactbloc_event.dart';
part 'contactbloc_state.dart';

class ContactblocBloc extends Bloc<ContactblocEvent, ContactblocState> {
  late List<Contacts> contactdata;

  ContactblocBloc() : super(ContactblocInitial()) {
    on<ContactblocEvent>((event, emit) async {
      if (event is FetchContactData) {
        emit(Contactblocloading());
        try {
          contactdata = await getContacts();
          emit(ContactFetchData(contacts: contactdata, Contacts: null));
        } catch (exception) {
          emit(ContactError(msg: exception.toString()));
        }
      }
    });
  }
  Future<List<Contacts>> getContacts() async {
    String url = "https://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts";
    late List<Contacts> contacts;
    try {
      final response = await get(Uri.parse(url));
      if (200 == response.statusCode) {
        contacts = contactsFromJson(response.body);
      }
      return contacts;
    } catch (e) {
      return contacts;
    }
  }
}
