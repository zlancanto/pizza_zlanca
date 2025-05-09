import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_delivery/blocs/authentication/authentication_bloc.dart';
import 'package:pizza_delivery/screens/auth/blocs/sign_in/sign_in_bloc.dart';
import 'package:pizza_delivery/screens/auth/views/welcom_screen.dart';
import 'package:pizza_delivery/screens/home/blocs/get_pizza/get_pizza_bloc.dart';
import 'package:pizza_delivery/screens/home/views/home_screen.dart';
import 'package:pizza_repository/pizza_repository.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: Colors.grey.shade200,
          onSurface: Colors.black,
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: ((context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create:
                      (context) => SignInBloc(
                        context.read<AuthenticationBloc>().userRepository,
                      ),
                ),
                BlocProvider(
                  create:
                      (context) => GetPizzaBloc(
                        FirebasePizzaRepo()
                      )..add(GetPizza()),
                ),
              ],
              child: const HomeScreen(),
            );
          } else {
            return const WelcomScreen();
          }
        }),
      ),
    );
  }
}
