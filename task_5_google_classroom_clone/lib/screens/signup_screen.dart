import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_5_google_classroom_clone/screens/verify_email.dart';

import '../reusable_widgets/reusable_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  String? _selectedRole;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter UserName", Icons.person_outline, false,
                  _userNameTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Email Id", Icons.person_outline, false,
                  _emailTextController),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  // labelText: "Select Role",
                  prefixIcon: const Icon(Icons.lock_person, color: Colors.black),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                value: _selectedRole,
                items: [
                  DropdownMenuItem(
                    value: 'teacher',
                    child: Text('Teacher'),
                  ),
                  DropdownMenuItem(
                    value: 'student',
                    child: Text('Student'),
                  ),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedRole = newValue;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordTextController,
                obscureText: !_isPasswordVisible,
                enableSuggestions: false,
                autocorrect: false,
                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.9),
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;  // Toggle visibility
                      });
                    },
                    child: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,  // Change icon based on visibility
                      color: Colors.black,
                    ),
                  ),
                  labelText: "Enter Password",
                  labelStyle: TextStyle(
                    color: Colors.black.withOpacity(0.9),
                  ),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.black.withOpacity(0.3),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(width: 0, style: BorderStyle.none)
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 20,
              ),
              firebaseButton(context, "Sign Up", () {
                if (_selectedRole == "teacher") {
                  List<dynamic> students = [];
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                      .then((value) {
                    // Create a new document in Firestore for the user
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(value.user!.uid)
                        .set({
                      'username': _userNameTextController.text,
                      'email': _emailTextController.text,
                      'role': _selectedRole,
                      'students': students
                    }).then((_) {
                      print("User added to Firestore");

                      // Navigate to the verification email screen
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  VerifyEmail(userId: value.user!.uid)));
                    }).catchError((error) {
                      print("Failed to add user: $error");
                    });
                  }).onError((error, stackTrace) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Wrong Credentials'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text("Error ${error.toString()}"),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                    print("Error ${error.toString()}");
                  });
                }
                if (_selectedRole == "student") {
                  List<dynamic> classes = [];
                  List<dynamic> teachers = [];
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                      .then((value) {
                    // Create a new document in Firestore for the user
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(value.user!.uid)
                        .set({
                      'username': _userNameTextController.text,
                      'email': _emailTextController.text,
                      'role': _selectedRole,
                      'classes': classes,
                      'teachers': teachers
                    }).then((_) {
                      print("User added to Firestore");

                      // Navigate to the verification email screen
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  VerifyEmail(userId: value.user!.uid)));
                    }).catchError((error) {
                      print("Failed to add user: $error");
                    });
                  }).onError((error, stackTrace) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Wrong Credentials'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text("Error ${error.toString()}"),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                    print("Error ${error.toString()}");
                  });
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
