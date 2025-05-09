part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent extends Equatable {

  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class AuthenticationUserChanged extends AuthenticationEvent {

  final MyUser? myUser;

  const AuthenticationUserChanged(this.myUser);

  @override
  List<Object?> get props => [myUser];
}