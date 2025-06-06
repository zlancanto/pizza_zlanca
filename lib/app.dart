import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'app_view.dart';
import 'blocs/authentication/authentication_bloc.dart';

class App extends StatelessWidget {
  final UserRepository userRepository;
  const App(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(
        userRepository: userRepository
      ),
      child: const AppView(),
    );
  }
}
