part of 'auth_popup_bloc.dart';

@immutable
sealed class AuthPopupEvent {}

class AuthPopupChangedTo extends AuthPopupEvent {
  final int index;
  AuthPopupChangedTo(this.index);
}
