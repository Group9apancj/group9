import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _LoginPageState();
}

class _LoginPageState extends State<Register> {
  late TextEditingController _name = TextEditingController();
  late TextEditingController _age = TextEditingController();
  late TextEditingController _email = TextEditingController();
  late TextEditingController _password = TextEditingController();
  late TextEditingController _confirm = TextEditingController();
  int h1 = 0;
  int h2 = 0;
  int _selectedValue = 1;
  int obsec = 1;
  @override
  void initState() {
    super.initState();
  }

  void insertPatient(String name,String age,String email,String password) async{
    Random rand = Random();
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String ID = List.generate(
        10, (index) => characters[rand.nextInt(characters.length)]).join();

    try {
      await FirebaseAuth
          .instance
          .createUserWithEmailAndPassword(
          email: email,
          password: password);

      await FirebaseFirestore
          .instance
          .collection(
          "Patients")
          .add({
        "id": ID,
        "name": name,
        "age": age,
        "email": email,
        "profilepic":[]
      });

      showAlertDialog(context, "Register successful, go back to log in", "register");
    }catch(e){
      print("Cant register: $e");
      showAlertDialog(context, "Register Unsuccessful $e", "registersd");
    }
  }

  void showAlertDialog(BuildContext context, msg, type) {
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
                if (type == "register") {
                  _name.clear();
                  _password.clear();
                  _confirm.clear();
                  _email.clear();
                  _age.clear();

                  Navigator.pushNamed(context, "/");
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void showAlertDialog2(BuildContext context, msg) {
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
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Color(0xff715cf8),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            "Create account",
            style: GoogleFonts.roboto(
                color: const Color(0xFF9575CD),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/wap.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                      hintText: "Enter your name",
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
                    controller: _age,
                    decoration: InputDecoration(
                      hintText: "Enter your age",
                      hintStyle: GoogleFonts.roboto(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      suffixIcon: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: GoogleFonts.roboto(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      suffixIcon: const Icon(
                        Icons.email,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
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
                      hintText: "Enter your password",
                      hintStyle: GoogleFonts.roboto(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (h1 == 0) {
                              h1 = 1;
                            } else {
                              h1 = 0;
                            }
                          });
                        },
                        icon: Icon(
                          h1 == 0 ? Icons.visibility_off : Icons.visibility,
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
                    obscureText: h1 == 0 ? true : false,
                    obscuringCharacter: "*",
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: _confirm,
                    decoration: InputDecoration(
                      hintText: "Confirm your password",
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
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 160,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_name.text.isNotEmpty &&
                            _age.text.isNotEmpty &&
                            _email.text.isNotEmpty &&
                            _password.text.isNotEmpty) {
                          if (_password.text.trim() == _confirm.text.trim()) {
                            insertPatient(
                                _name.text.trim(),
                                _age.text.trim(),
                                _email.text.trim().toLowerCase(),
                                _password.text.trim());
                          } else {
                            showAlertDialog2(context,
                                "The confirm password should be similar to password input");
                          }
                        } else {
                          showAlertDialog2(
                              context, "One of the input field is not filled");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF9575CD),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.app_registration,
                            size: 30,
                          ),
                          Text(
                            "Register",
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
            )),
      ),
    );
  }
}

class Sele extends StatefulWidget {
  const Sele({super.key});

  @override
  State<Sele> createState() => _SeleState();
}

class _SeleState extends State<Sele> {
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Select your gender",
            style: GoogleFonts.roboto(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Text(
                  "Male",
                  style: GoogleFonts.roboto(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Radio(
                  value: 1,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
              ]),
              Row(children: [
                Text(
                  "Female",
                  style: GoogleFonts.roboto(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Radio(
                  value: 2,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
              ]),
            ],
          ),
        ]));
  }
}
