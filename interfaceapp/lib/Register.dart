import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _LoginPageState();
}

class _LoginPageState extends State<Register> {
  int h1 = 0;
  int h2 = 0;
  int _selectedValue = 1;
  int obsec=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
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
                color: Color(0xff715cf8),
                fontSize: 42,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [
                  SizedBox(height: 80),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                      hintStyle: GoogleFonts.roboto(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      suffixIcon: Icon(
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
                  SizedBox(height: 40),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your age",
                      hintStyle: GoogleFonts.roboto(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      suffixIcon: Icon(
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
                  SizedBox(height: 40),
                  Container(
                      width: double.infinity,
                      child: Column(children: [
                        Text("Select your gender",
                          style: GoogleFonts.roboto(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
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
                      ])),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: GoogleFonts.roboto(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      suffixIcon: Icon(
                        Icons.email,
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
                  SizedBox(height: 40),
                  TextFormField(
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
                    obscureText: h1==0?true:false,
                    obscuringCharacter: "*",
                  ),
                  SizedBox(height: 40),
                  TextFormField(
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
                    obscureText: h2==0?true:false,
                    obscuringCharacter: "*",
                  ),

                  SizedBox(height: 40),
                  Container(
                    width: 200,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff715cf8),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
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
