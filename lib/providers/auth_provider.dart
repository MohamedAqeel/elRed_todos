import 'dart:developer';

import 'package:elredtodo/repos/auth_repo.dart';
import 'package:elredtodo/routes/app_routes.dart';
import 'package:elredtodo/utils/app_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  UserCredential? userCredential;
  AuthRepository authRepository = AuthRepository();
  bool isLoading = false;

  signInWithGoogle() async {
    isLoading = true;
    notifyListeners();
    userCredential = await authRepository.signInWithGoogle();
    isLoading = false;
    notifyListeners();
  }
}
