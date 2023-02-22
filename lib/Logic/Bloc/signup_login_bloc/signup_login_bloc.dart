import 'package:bloc/bloc.dart';
import 'package:init_structure/Data/Repo/class_repo.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'signup_login_event.dart';

part 'signup_login_state.dart';

class SignUpLogInBloc extends Bloc<SignupLogin, SignUpLogInState> {
  ClassRepo classRepo;

  SignUpLogInBloc(this.classRepo) : super(SignUpLogInState()) {
    on<LogInEvent>((event, emit) async {
      emit(
        state.copyWith(
          isLoadingState: true,
          isInitStateState: false,
          isFailedState: false,
          isSuccessState: false,
          isProfileUpdatedState: false,
        ),
      );
      bool res = await classRepo.submitClassDetails();
      if (res ) {
        emit(
          state.copyWith(
            isLoadingState: false,
            isSuccessState: true,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isLoadingState: false,
            isSuccessState: false,
            isFailedState: true,
            isInitStateState: true,
            errorMessage: "error",
          ),
        );
      }
    });
  }
}
