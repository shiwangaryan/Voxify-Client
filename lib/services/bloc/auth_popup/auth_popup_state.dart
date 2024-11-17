part of 'auth_popup_bloc.dart';

@immutable
sealed class AuthPopupState {}

final class AuthPopupStateChange extends AuthPopupState {
  final int index;
  AuthPopupStateChange(this.index);
}
