// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/authentication_control.dart';
import 'package:example/loading_screen.dart';
import 'package:example/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

//for male avatar
class SignupPage1 extends StatefulWidget {
  const SignupPage1({Key? key}) : super(key: key);

  @override
  State<SignupPage1> createState() => _SignupPage1State();
}

class _SignupPage1State extends State<SignupPage1> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    List images = [
      "g.png",
      "f.png",
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "img/signup.png",
                  fit: BoxFit.cover,
                  width: w,
                  height: h * 0.4,
                ),
                Positioned(
                  top: 10,
                  left: 0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    color: Colors.transparent,
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Body())),
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 50,
                  right: 50,
                  child: Container(
                    width: w,
                    color: Colors.transparent,
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 5,
                  left: 10,
                  child: CircleAvatar(
                    radius: 52.8,
                    backgroundColor: Colors.pinkAccent,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("img/profile_man.png"),
                      backgroundColor: Colors.deepOrangeAccent,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientText(
                    "Create an account",
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    colors: [
                      Colors.deepOrangeAccent,
                      Colors.orange,
                      Colors.pink.shade300,
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            spreadRadius: 7,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.3),
                          )
                        ]),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: " Enter your Name",
                          labelText: "Name",
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          prefixIcon: const Icon(
                            Icons.text_snippet,
                            size: 25,
                            color: Colors.deepOrangeAccent,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            spreadRadius: 7,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.3),
                          )
                        ]),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: " Enter your Email",
                          labelText: "Email",
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          prefixIcon: const Icon(
                            Icons.email,
                            size: 22,
                            color: Colors.deepOrangeAccent,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            spreadRadius: 7,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.3),
                          )
                        ]),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: " Enter your Password",
                          labelText: "Password",
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          prefixIcon: const Icon(
                            Icons.password_outlined,
                            color: Colors.deepOrangeAccent,
                            size: 25,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  image: const DecorationImage(
                    image: AssetImage("img/loginbtn.png"),
                    fit: BoxFit.cover,
                  )),
              child: FlatButton(
                minWidth: w * 0.50,
                height: h * 0.08,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                color: Colors.transparent,
                onPressed: () {
                  DasAuth.instance.register(
                      nameController.text.trim(),
                      emailController.text.trim(),
                      passwordController.text.trim());
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                text: "Sign up using these apps",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Wrap(
              children: List<Widget>.generate(2, (index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundColor: Colors.deepOrangeAccent,
                    radius: 22.5,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        "img/" + images[index],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ));
  }
}

//for female avatar

class SignupPage2 extends StatefulWidget {
  const SignupPage2({Key? key}) : super(key: key);

  @override
  State<SignupPage2> createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    List images = [
      "g.png",
      "f.png",
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "img/signup.png",
                  fit: BoxFit.cover,
                  width: w,
                  height: h * 0.4,
                ),
                Positioned(
                  top: 10,
                  left: 0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    color: Colors.transparent,
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Body())),
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 50,
                  right: 50,
                  child: Container(
                    width: w,
                    color: Colors.transparent,
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 5,
                  left: 10,
                  child: CircleAvatar(
                    radius: 52.8,
                    backgroundColor: Colors.pinkAccent,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("img/profile.png"),
                      backgroundColor: Colors.deepOrangeAccent,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientText(
                    "Create an account",
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    colors: [
                      Colors.deepOrangeAccent,
                      Colors.orange,
                      Colors.pink.shade300,
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            spreadRadius: 7,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.3),
                          )
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: " Enter your Name",
                          labelText: "Name",
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          prefixIcon: const Icon(
                            Icons.text_snippet,
                            size: 25,
                            color: Colors.deepOrangeAccent,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            spreadRadius: 7,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.3),
                          )
                        ]),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: " Enter your Email",
                          labelText: "Email",
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          prefixIcon: const Icon(
                            Icons.email,
                            size: 22,
                            color: Colors.deepOrangeAccent,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            spreadRadius: 7,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.3),
                          )
                        ]),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: " Enter your Password",
                          labelText: "Password",
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          prefixIcon: const Icon(
                            Icons.password_outlined,
                            color: Colors.deepOrangeAccent,
                            size: 25,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  image: const DecorationImage(
                    image: AssetImage("img/loginbtn.png"),
                    fit: BoxFit.cover,
                  )),
              child: FlatButton(
                minWidth: w * 0.50,
                height: h * 0.08,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                color: Colors.transparent,
                onPressed: () => DasAuth.instance.register(
                    nameController.text.trim(),
                    emailController.text.trim(),
                    passwordController.text.trim()),
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                text: "Sign up using these apps",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Wrap(
              children: List<Widget>.generate(2, (index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundColor: Colors.deepOrangeAccent,
                    radius: 22.5,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        "img/" + images[index],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ));
  }
}
