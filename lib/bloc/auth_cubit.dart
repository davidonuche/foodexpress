import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signInWithEmamil({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    // ...logic
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // if success
      emit(AuthSignedIn());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthError('User not found'));
      } else if (e.code == 'wrong-password') {
        emit(AuthError('Wrong password'));
      }
    }
  }

  Future<void> signUpWithEmail({
    required String email,
    required String username,
    required String password,
  }) async {
    emit(AuthLoading());
    // ...logic
    try {
      // 1. Create user with email and password
      // 2. Update user's display name
      // 3. Write our user to cloud usercollection
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user!.updateDisplayName(username);
      // Write our user to cloud firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': username,
        'email': email,
      });
      // if success
      emit(AuthSignedUp());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthError('The password provided is too weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthError('The email is already in use'));
      }
    } catch (e) {
      emit(AuthError('An error has occureded....'));
    }
  }
}
