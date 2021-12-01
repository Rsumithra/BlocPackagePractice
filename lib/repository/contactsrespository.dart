import 'package:blocpracticepattern/constants/contants.dart';

import '../models/contacts.dart';
import '../network/api_call.dart';

class ContactsRespository {
  final Apicall _provider = Apicall();

  Future<List<Contacts>> getContacts() async {
    List<Contacts> contacts = [];
    try {
      final response = await _provider.get(Constants.contactsurl);
      contacts = contactsFromJson(response);
      return contacts;
    } on Exception {
      return contacts;
    }
  }
}
