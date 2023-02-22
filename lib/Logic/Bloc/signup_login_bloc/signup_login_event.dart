part of 'signup_login_bloc.dart';

@immutable
abstract class SignupLogin {}

// class SignUpEvent extends SignupLogin {
//   SignUpEvent({
//     required this.parentsDataModel,
//   });
//
//   final ParentDataModel parentsDataModel;
// }

class LogInEvent extends SignupLogin {
  LogInEvent({
    required this.email,
    required this.password,
    required this.instituteId,
  });

  final String email;
  final String password;
  final String instituteId;
}

