import 'package:budget_tracker/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

normalSignUp({required String email, required String password}) async {
  try {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (kDebugMode) {
      print(user);
    }
    return user;
  } on FirebaseAuthException catch (e) {
    if (e.code == "weak-password") {
      return e.code;
    } else if (e.code == "email-already-in-use") {
      return e.code;
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return e;
  }
}

normalSignIn({required String email, required String password}) async {
  try {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    storage.write("uid", user.user!.uid);
  } on FirebaseAuthException catch (e) {
    if (e.code == "user-not-found") {
      return e.code;
    } else if (e.code == "wrong-password") {
      return e.code;
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return e;
  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

// var user = FirebaseAuth.instance.currentUser!;

