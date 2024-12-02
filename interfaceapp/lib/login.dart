import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Databases/tryDB.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _email = TextEditingController();
  late TextEditingController _password = TextEditingController();

  int h1 = 0;
  int h2 = 0;
  final int _selectedValue = 1;
  int obsec = 1;

  Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.toLowerCase(), password: password);
      showAlertDialog(context, "Login successful", "login", email);
    } catch (e) {
      print("Error 500:$e");
      showAlertDialog(context, "Login Unsuccessful $e",
          "unsuccessful", "sdds");
    }
  }

  void showAlertDialog(BuildContext context, msg, type, actual) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Notice"),
          content: Text(msg),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                if (type == "login") {
                  Navigator.of(context)
                      .pushNamed("homepage", arguments: {"name": actual});
                } else {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, "/");
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Center(
                child: Text(
                  "Login",
                  style: GoogleFonts.roboto(
                      color: const Color(0xFF9575CD),
                      fontSize: 42,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/wap.jpg"),
                        fit: BoxFit.cover)
                ),
              ),
              Form(
                child: Column(
                  children: [
                    const SizedBox(height: 150),
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        hintStyle: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        suffixIcon: const Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (h2 == 0) {
                                h2 = 1;
                              } else {
                                h2 = 0;
                              }
                            });
                          },
                          icon: Icon(
                            h2 == 0 ? Icons.visibility_off : Icons.visibility,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      obscureText: h2 == 0 ? true : false,
                      obscuringCharacter: "*",
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 110,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_email.text.isEmpty || _password.text.isEmpty) {
                            showAlertDialog(
                                context,
                                "You need to enter both username and password",
                                "nothing",
                                "nothing");
                          } else {
                            login(
                                _email.text.trim(), _password.text.trim());
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF9575CD),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.login,
                              size: 30,
                            ),
                            Text(
                              "Login",
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 140),
              Container(
                margin: EdgeInsets.only(left: 50),
                  child: Row(
                children: [
                  Text(
                    "Don't have account!",
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 0),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "register");
                    },
                    child: Text(
                      "Register",
                      style: GoogleFonts.roboto(
                          color: const Color(0xFF9575CD),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              )),
            ]),
          ),
        ),
      ),
    );
  }
}
