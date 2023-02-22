
// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc extends Bloc<ForgetPassword, ForgetPasswordState> {

  ForgetPasswordBloc() : super(ForgetPasswordState()) {
    on<ForgetPasswordEvent>((event, emit) async{
      emit(
        state.copyWith(
          isLoadingState: true,
          isInitStateState: false,
          isFailedState: false,
          isSuccessState: false,
        ),
      );

      String res = "";//await CommonRepository.sendResetPasswordEmail(event.email,);

      if(res=="success"){
        emit(
          state.copyWith(
            isLoadingState: false,
            isSuccessState: true,
          ),
        );
      }
      else{
        emit(
          state.copyWith(
            isLoadingState: false,
            isSuccessState: false,
            isFailedState: true,
            isInitStateState: true,
            errorMessage: res,
          ),
        );
      }

    });
  }
}
