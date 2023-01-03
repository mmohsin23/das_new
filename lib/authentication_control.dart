// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/homepage.dart';
import 'package:example/loading_screen.dart';
import 'package:example/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

class DasAuth extends GetxController {
  static DasAuth instance = Get.find();

  //user authentication
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser); //type casting ki hui hai meine :)
    _user.bindStream(auth.userChanges()); //user will be notified
    ever(_user, _firstscreen);
  }

  _firstscreen(User? user) {
    if (user == null) {
      Get.offAll(() => Body());
    } else {
      Get.offAll(() => Homepage());
    }
  }

  void register(String nameuser, email, password) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseFirestore.instance.collection("Users").doc(user!.email).set({
        "Name: ": nameuser,
        "Email: ": email,
        "Password: ": password,
      });
    } catch (a) {
      Get.snackbar(
        "About user",
        "user message",
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
        borderColor: Colors.white,
        borderWidth: 2,
        backgroundColor: Colors.red,
        titleText: const Text(
          "Account Creation Failed.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        messageText: Text(
          a.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void loginacc(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login message",
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        borderColor: Colors.white,
        borderWidth: 2,
        backgroundColor: Colors.red,
        titleText: const Text(
          "Login Failed.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void logout() {
    auth.signOut();
  }
}
