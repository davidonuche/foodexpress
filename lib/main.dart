import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodexpress/auth/welcome_screen.dart';
import 'package:foodexpress/bloc/auth_cubit.dart';
import 'package:foodexpress/common_widgets/bottom_nav.dart';
import 'package:foodexpress/service/cart_service.dart';
import 'package:foodexpress/view/home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CartService()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food Express',
          home: user == null ? WelcomeScreen() : BottomNav(),
        ),
      ),
    );
  }
}
