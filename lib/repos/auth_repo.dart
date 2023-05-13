import 'dart:developer';

import 'package:elredtodo/routes/app_routes.dart';
import 'package:elredtodo/utils/app_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  Future<UserCredential?> signInWithGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      if (await GoogleSignIn().isSignedIn()) {
        await GoogleSignIn().signOut();
      }

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      Utils.showToast("Welcome ${userCredential.user!.displayName}");
      Get.toNamed(AppRoutes.homeScreen);
      return userCredential;
    } catch (e) {
      log(e.toString());
      Utils.showToast("Authentication Error !");
    }
    return null;
  }

  String? getCurrentUserEmail() {
    try {
      return FirebaseAuth.instance.currentUser!.email;
    } catch (e) {
      Utils.showToast("Session expired !");
      Get.offAllNamed(AppRoutes.authScreen);
    }
    return null;
  }
}
