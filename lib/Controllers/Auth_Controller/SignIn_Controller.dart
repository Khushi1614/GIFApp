import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Screens/Homescreen/homepage.dart';
import '../../utils/CustomSnackBar.dart';

class SignIn_Controller extends GetxController {
  Rx<TextEditingController> number = TextEditingController().obs;
  TextEditingController password = TextEditingController();
  bool isLoading1 = false;
  bool isLoading = false;
  bool isObsecure = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> loginUserWithEmailAndPassword(
      String email, String passwords) async {
    isLoading = true;
    try {
      if (number.value.text.isNotEmpty && passwords.isNotEmpty) {
        final cred = await _auth.signInWithEmailAndPassword(
            email: email, password: passwords);
        Get.off(GiphyHome());
        CustomSnackBar("Login successful", isError: true);
        isLoading = false;

        number.value.clear();
        password.clear();
        return cred.user;
      }
    } catch (e) {
      log("Something went wrong");
      CustomSnackBar("Invalid credentials");
    }
    return null;
  }

  Future<String> signupUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        Get.off(GiphyHome());
        print(cred.user!.uid);

        res = "success";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  void ispass() {
    if (isObsecure == false) {
      isObsecure = true;
      update();
    } else {
      isObsecure = false;
      update();
    }
  }

  void check_len() {
    number.value.text.length;
    password.text;
    update();
  }
}
