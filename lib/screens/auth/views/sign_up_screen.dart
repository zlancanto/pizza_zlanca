import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_delivery/components/my_text_field.dart';
import 'package:pizza_delivery/screens/auth/blocs/sign_up/sign_up_bloc.dart';
import 'package:user_repository/user_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obscurePassword = true;
  bool signUpRequired = false;
  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool contains8Length = false;

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          setState(() {
            signUpRequired = false;
          });
        } else if (state is SignUpProcess) {
          setState(() {
            signUpRequired = true;
          });
        } else if (state is SignUpFailure) {
          return;
        }
      },
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(CupertinoIcons.mail_solid),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ce champ est requis';
                    } else if (!RegExp(
                      r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Veuillez entrer un email valide';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: MyTextField(
                    controller: passwordController,
                    hintText: 'Mot de passe',
                    obscureText: obscurePassword,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(CupertinoIcons.lock_fill),
                    onChanged: passwordValidator,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                          if (obscurePassword) {
                            iconPassword = CupertinoIcons.eye_fill;
                          } else {
                            iconPassword = CupertinoIcons.eye_slash_fill;
                          }
                        });
                      },
                      icon: Icon(iconPassword),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Ce champ est requis';
                      } else if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$')
                          .hasMatch(val)) {
                        return 'Veuillez saisir un mot de passe valide';
                      }
                      return null;
                    }
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "* 1 majuscule",
                        style: TextStyle(
                          color: containsUpperCase
                              ? Colors.green
                              : Theme
                              .of(context)
                              .colorScheme
                              .onSurface,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "* 1 minuscule",
                        style: TextStyle(
                          color: containsLowerCase
                              ? Colors.green
                              : Theme
                              .of(context)
                              .colorScheme
                              .onSurface,
                        ),
                      ),
                      Text(
                        "* 1 chiffre",
                        style: TextStyle(
                          color: containsNumber
                              ? Colors.green
                              : Theme
                              .of(context)
                              .colorScheme
                              .onSurface,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "* 1 caractère spécial",
                        style: TextStyle(
                          color: containsSpecialChar
                              ? Colors.green
                              : Theme
                              .of(context)
                              .colorScheme
                              .onSurface,
                        ),
                      ),
                      Text(
                        "* 8 caractères minimum",
                        style: TextStyle(
                          color: contains8Length
                              ? Colors.green
                              : Theme
                              .of(context)
                              .colorScheme
                              .onSurface,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: MyTextField(
                  controller: nameController,
                  hintText: 'Nom',
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  prefixIcon: const Icon(CupertinoIcons.person_fill),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ce champ est requis';
                    } else if (value.length < 2) {
                      return 'Le nom doit contenir au moins 2 caractères';
                    } else if (value.length > 30) {
                      return 'Le nom ne doit pas dépasser 30 caractères';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              !signUpRequired
                  ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      MyUser myUser = MyUser.empty;
                      myUser.email = emailController.text;
                      myUser.name = nameController.text;

                      setState(() {
                        context.read<SignUpBloc>().add(
                            SignUpRequired(
                                myUser,
                                passwordController.text
                            )
                        );
                      });
                    }
                  },
                  style: TextButton.styleFrom(
                    elevation: 3.0,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Text(
                      'S\'inscrire',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
              : const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }

  String? passwordValidator(String? val) {
    if (val!.contains(RegExp(r'[A-Z]'))) {
      setState(() {
        containsUpperCase = true;
      });
    } else {
      setState(() {
        containsUpperCase = false;
      });
    }
    if (val.contains(RegExp(r'[a-z]'))) {
      setState(() {
        containsLowerCase = true;
      });
    } else {
      setState(() {
        containsLowerCase = false;
      });
    }
    if (val.contains(RegExp(r'[0-9]'))) {
      setState(() {
        containsNumber = true;
      });
    } else {
      setState(() {
        containsNumber = false;
      });
    }
    if (val.contains(RegExp(r'^(?=.*?[!@#$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])'))) {
      setState(() {
        containsSpecialChar = true;
      });
    } else {
      setState(() {
        containsSpecialChar = false;
      });
    }
    if (val.length >= 8) {
      setState(() {
        contains8Length = true;
      });
    } else {
      setState(() {
        contains8Length = false;
      });
    }
    return null;
  }
}
