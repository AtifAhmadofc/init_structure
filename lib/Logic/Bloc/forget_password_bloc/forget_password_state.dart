part of 'forget_password_bloc.dart';



class ForgetPasswordState {
  final bool isLoadingState;
  final bool isInitStateState;
  final bool isSuccessState;
  final bool isFailedState;
  final String errorMessage;

  ForgetPasswordState({
    this.isLoadingState = false,
    this.isInitStateState = true,
    this.isSuccessState = false,
    this.isFailedState = false,
    this.errorMessage = "",
  });

  ForgetPasswordState copyWith({
    bool? isLoadingState,
    bool? isInitStateState,
    bool? isSuccessState,
    bool? isFailedState,
    String? errorMessage,
  }) {
    return ForgetPasswordState(
      isLoadingState: isLoadingState ?? this.isLoadingState,
      isInitStateState: isInitStateState ?? this.isInitStateState,
      isSuccessState: isSuccessState ?? this.isSuccessState,
      isFailedState: isFailedState ?? this.isFailedState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
