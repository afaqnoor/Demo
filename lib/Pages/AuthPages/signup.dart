// ignore_for_file: unused_field, non_constant_identifier_names, body_might_complete_normally_catch_error

import 'package:demo/Pages/AuthPages/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Model/UserModel/model.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _usernamekey = GlobalKey<FormState>();
  final _emailkey = GlobalKey<FormState>();
  final _phonekey = GlobalKey<FormState>();
  final _conpasskey = GlobalKey<FormState>();
  final _passwordkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailcontroller = TextEditingController();
  final phoneController = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordController = TextEditingController();
  bool Obscure = true;
  String? errorMessage;
  bool loading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
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
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // const CircleAvatar(
                    //   radius: 40,
                    //   backgroundColor: Colors.white,
                    //   backgroundImage: AssetImage('images/pets.png'),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Sign Up ',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Form(
                      key: _usernamekey,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: usernameController,
                        onSaved: (value) {
                          usernameController.text;
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
                          hintText: 'Enter Your UserName',
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
                            return 'Enter UserName';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _emailkey,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailcontroller,
                        onSaved: (value) {
                          emailcontroller.text;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
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
                      height: 20,
                    ),
                    Form(
                      key: _phonekey,
                      child: TextFormField(
                        maxLength: 11,
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        onSaved: (value) {
                          phoneController.text;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.phone,
                            size: 25,
                            color: Colors.black,
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15.0),
                          isDense: true,
                          filled: true,
                          fillColor: const Color.fromARGB(255, 207, 206, 206),
                          hintText: 'Phone Number',
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
                            return 'Enter Phone';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _passwordkey,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        //obscureText: _obscureText,
                        controller: passwordcontroller,
                        onSaved: (value) {
                          passwordcontroller.text;
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(
                                // _obscureText
                                //     ? Icons.visibility_sharp
                                //     : Icons.visibility_off_sharp,
                                // color: Colors.black,
                                Icons.abc_sharp),
                            onPressed: () {
                              setState(() {
                                //    _obscureText = !_obscureText;
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
                      height: 20,
                    ),
                    Form(
                      key: _conpasskey,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        // obscureText: _obscureText1,
                        controller: confirmpasswordController,
                        onSaved: (value) {
                          //  confirmpasswordController.text;
                        },
                        decoration: InputDecoration(
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
                          hintText: 'Confirm Password',
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
                            return 'Enter Confirm Password';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        loading = loading;
                        if (_emailkey.currentState!.validate()) {
                        } else if (_phonekey.currentState!.validate()) {
                        } else if (_passwordkey.currentState!.validate()) {
                        } else if (_conpasskey.currentState!.validate()) {}
                        setState(() {
                          loading = true;
                        });
                        signUp(emailcontroller.text.toString(),
                            passwordcontroller.text.toString());
                        setState(() {
                          loading = false;
                        });
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
                          'Sign Up',
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
                        text: "already have an account?  ",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => const SignIn(
                                        //  restorationId: 'main',
                                        )));
                          },
                        text: "Sign In",
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

  void signUp(String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } on FirebaseAuthException catch (error) {
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

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = usernameController.text;
    userModel.phonenumber = phoneController.text;

    await firebaseFirestore
        .collection("UserAuthData")
        .doc(user.uid)
        .set(userModel.toMap());
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const SignIn()),
        (route) => false);
    setState(() {});
  }
}
