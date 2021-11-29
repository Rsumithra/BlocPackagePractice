part of 'contactbloc_bloc.dart';

@immutable
abstract class ContactblocState {}

class ContactblocInitial extends ContactblocState {
  List<Object?> get props => throw UnimplementedError();
}

class Contactblocloading extends ContactblocState {
  List<Object?> get props => throw UnimplementedError();
}

class ContactFetchData extends ContactblocState {
  List<Contacts> contacts;

  ContactFetchData({required this.contacts});

  List<Object?> get props => throw UnimplementedError();
}

class ContactError extends ContactblocState {
  String msg;
  ContactError({required this.msg});
}
