import 'package:blocpracticepattern/constants/contants.dart';

import '../models/contacts.dart';
import '../network/api_call.dart';

class ContactsRespository {
  final Api_call _provider = Api_call();

  Future<List<Contacts>> getContacts() async {
    List<Contacts> contacts = [];
    try {
      final response = await _provider.get(Constants.contacts_url);
      contacts = contactsFromJson(response);
      return contacts;
    } on Exception {
      return contacts;
    }
  }
}
