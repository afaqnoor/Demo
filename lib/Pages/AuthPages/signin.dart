// ignore_for_file: non_constant_identifier_names, unused_field

import 'package:demo/Pages/AuthPages/signup.dart';
import 'package:demo/Pages/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool Obscure = true;
  bool loading = false;
  bool validation = false;
  String? errorMessage;
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _emailkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordkey = GlobalKey<FormState>();
  final TextEditingController emaiController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    // const CircleAvatar(
                    //   radius: 40,
                    //   backgroundColor: Colors.white,
                    //   backgroundImage: AssetImage('images/pets.png'),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    const Text(
                      'Sign In ',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Form(
                      key: _emailkey,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emaiController,
                        onSaved: (value) {
                          //   emaiController.text;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person,
                            size: 25,
                            color: Colors.black,
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15.0),
                          isDense: true,
                          filled: true,
                          fillColor: const Color.fromARGB(255, 207, 206, 206),
                          hintText: 'Enter Your Email',
                          hintStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Eamil';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _passwordkey,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        // obscureText: _obscureText,
                        controller: passwordController,
                        onSaved: (value) {
                          //   passwordController.text;
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(
                                // _obscureText
                                //     ? Icons.visibility_sharp
                                //     : Icons.visibility_off_sharp,
                                // color: Colors.black,
                                Icons.ac_unit_rounded),
                            onPressed: () {
                              setState(() {
                                //   _obscureText = !_obscureText;
                              });
                            },
                          ),
                          prefixIcon: const Icon(
                            Icons.password,
                            size: 25,
                            color: Colors.black,
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15.0),
                          isDense: true,
                          filled: true,
                          fillColor: const Color.fromARGB(255, 207, 206, 206),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Password';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    InkWell(
                      onTap: () {
                        loading = loading;
                        if (_emailkey.currentState!.validate()) {
                        } else if (_passwordkey.currentState!.validate()) {}
                        setState(() {
                          loading = true;
                        });
                        signIn(emaiController.text.toString(),
                            passwordController.text.toString());
                        loading = false;
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                            child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text.rich(TextSpan(children: [
                      const TextSpan(
                        text: "dont't have an account?  ",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => const SignUp()));
                          },
                        text: "Sign Up",
                        style: const TextStyle(color: Colors.blue),
                      )
                    ])),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_emailkey.currentState!.validate()) {
      setState(() {
        validation = true;
      });
      try {
        await auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.pushAndRemoveUntil(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                      (route) => false),
                });
      } on FirebaseAuthException catch (error) {
        setState(() {
          validation = false;
        });
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }
}
