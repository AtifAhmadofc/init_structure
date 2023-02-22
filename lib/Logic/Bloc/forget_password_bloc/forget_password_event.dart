part of 'forget_password_bloc.dart';

@immutable
abstract class ForgetPassword {}


class ForgetPasswordEvent extends  ForgetPassword{
  final String email;
  ForgetPasswordEvent({required this.email});
}