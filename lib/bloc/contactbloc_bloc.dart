import 'package:bloc/bloc.dart';
import 'package:blocpracticepattern/constants/contants.dart';
import '../models/contacts.dart';
import 'package:blocpracticepattern/repository/contactsrespository.dart';

import 'package:meta/meta.dart';

part 'contactbloc_event.dart';
part 'contactbloc_state.dart';

class ContactblocBloc extends Bloc<ContactblocEvent, ContactblocState> {
  late List<Contacts> contactdata;
  ContactsRespository contactsRespository = ContactsRespository();

  ContactblocBloc() : super(ContactblocInitial()) {
    on<ContactblocEvent>((event, emit) async {
      if (event is FetchContactData) {
        emit(Contactblocloading());
        try {
          contactdata = await contactsRespository.getContacts();
          if (contactdata.isEmpty) {
            emit(ContactError(msg: Constants.nodata));
          } else {
            emit(ContactFetchData(contacts: contactdata));
          }
        } catch (exception) {
          emit(ContactError(msg: exception.toString()));
        }
      }
    });
  }
}
