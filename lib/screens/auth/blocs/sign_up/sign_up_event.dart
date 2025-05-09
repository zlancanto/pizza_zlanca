part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent extends Equatable {

  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpRequired extends SignUpEvent {

  final MyUser myUser;
  final String password;

  const SignUpRequired(this.myUser, this.password);

  @override
  List<Object> get props => [myUser, password];
}