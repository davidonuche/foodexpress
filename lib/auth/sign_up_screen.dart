import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodexpress/auth/sign_in_screen.dart';
import 'package:foodexpress/common_widgets/bottom_nav.dart';

import '../bloc/auth_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _email = "";
  String _username = "";
  String _password = "";
  late final FocusNode _usernameFocusNode;
  late final FocusNode _passwordFocusNode;
  final _formKey = GlobalKey<FormState>();
  void _submit() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      // Invaild!
      return;
    }
    _formKey.currentState!.save();
    context.read<AuthCubit>().signUpWithEmail(
          email: _email,
          password: _password,
          username: _username,
        );
  }

  @override
  void initState() {
    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (prevState, currentState) {
              if (currentState is AuthSignedUp) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              }
              if (currentState is AuthError) {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(currentState.message),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView(
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.all(15),
                children: [
                  // email
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      _email = value!.trim();
                    },
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_usernameFocusNode),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "Enter your email",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter email....";
                      }
                      if (value.length < 4) {
                        return "please provide longer email....";
                      }
                      return null;
                    },
                  ),
                  // username
                  TextFormField(
                    focusNode: _usernameFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    onSaved: (value) {
                      _username = value!.trim();
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: "Enter username",
                    ),
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter username....";
                      }
                      if (value.length < 4) {
                        return "please provide longer username....";
                      }
                      return null;
                    },
                  ),

                  // password
                  TextFormField(
                    focusNode: _passwordFocusNode,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    onFieldSubmitted: (_) => _submit(),
                    onSaved: (value) {
                      _password = value!.trim();
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: "Enter password",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password....";
                      }
                      if (value.length < 4) {
                        return "please provide longer password....";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _submit();
                    },
                    child: Text("Sign Up"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: Text("Sign In Instead"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
