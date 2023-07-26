import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodexpress/auth/sign_up_screen.dart';
import 'package:foodexpress/common_widgets/bottom_nav.dart';

import '../bloc/auth_cubit.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String _email = "";
  String _password = "";
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  final _formKey = GlobalKey<FormState>();
  void _submit() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      // Invaild!
      return;
    }
    _formKey.currentState!.save();
    context.read<AuthCubit>().signInWithEmamil(
          email: _email,
          password: _password,
        );
    // TODO:- Authenticate with email and password.
  }

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
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
            if (currentState is AuthError) {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    currentState.message,
                    style: TextStyle(color: Colors.white),
                  ),
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.red,
                ),
              );
            }
            if (currentState is AuthSignedIn) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNav()),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.all(15),
              children: [
                // Email
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {
                    _email = value!.trim();
                  },
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_passwordFocusNode),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: "Enter email",
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
                // Password
                TextFormField(
                  focusNode: _passwordFocusNode,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onSaved: (value) {
                    _password = value!.trim();
                  },
                  onFieldSubmitted: (_) => _submit(),
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
                // TODO:- Submit form and auntenticate with email and password.
                ElevatedButton(
                  onPressed: () => _submit(),
                  child: Text("Log In"),
                ),
                // TODO:- Go to signup screen.
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text("Sign Up Instead"),
                ),
              ],
            );
          },
        ),
      ),
    ));
  }
}
