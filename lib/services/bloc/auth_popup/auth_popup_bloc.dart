import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_popup_event.dart';
part 'auth_popup_state.dart';

class AuthPopupBloc extends Bloc<AuthPopupEvent, AuthPopupState> {
  AuthPopupBloc() : super(AuthPopupStateChange(0)) {
    on<AuthPopupChangedTo>((event, emit) {
      emit(AuthPopupStateChange(event.index));
    });
  }
}
