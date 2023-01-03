//import 'package:flutter/cupertino.dart';
// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use, unused_import

import 'package:example/authentication_control.dart';
import 'package:example/gender.dart';
import 'package:example/homepage.dart';
import 'package:example/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'loading_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
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
                height: h * 0.35,
              ),
              Positioned(
                top: 10,
                left: 0,
                child: Container(
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
              ),
              Positioned(
                top: 10,
                left: 50,
                right: 50,
                child: Container(
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
          // Container(
          //   width: w,
          //   height: h * 0.4,
          //   decoration: const BoxDecoration(
          //       image: DecorationImage(

          //     image: AssetImage("img/loginimg.png"),
          //     fit: BoxFit.cover,
          //   )),
          // ),
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientText(
                  "Welcome to DAS \nAnalysis and Relief",
                  style: const TextStyle(
                    fontSize: 30,
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
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: " Enter your Email",
                        labelText: "Email",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        prefixIcon: const Icon(
                          Icons.email,
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
                  height: 25,
                ),
                Container(
                  //    padding: const EdgeInsets.only(left: 10),
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
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      "Forget your Password?",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
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
                DasAuth.instance.loginacc(emailController.text.trim(),
                    passwordController.text.trim());
              },
              child: const Text(
                "Sign in",
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
              text: "Sign in using these apps",
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 15,
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
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: "Don't have an account?",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                children: [
                  TextSpan(
                    text: " Create",
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => const GenderPage()),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
