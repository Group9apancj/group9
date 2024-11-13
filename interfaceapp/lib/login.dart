import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int h1 = 0;
  int h2 = 0;
  final int _selectedValue = 1;
  int obsec = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        title: Center(
          child: Text(
            "Login1",
            style: GoogleFonts.roboto(
                color: const Color(0xff715cf8),
                fontSize: 42,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child:Column(
              children: [
            Form(
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter name",
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
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 200,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "homepage");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff715cf8),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
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
                const SizedBox(height:270),
                Row(
                  children: [
                    Text("Don't have account!",
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                    ),
                    const SizedBox(width: 0),
                    TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, "register");
                        },
                        child: Text("Register",
                          style: GoogleFonts.roboto(
                            color: const Color(0xff715cf8),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            decoration: TextDecoration.underline
                          ),
                        ),
                    )
                  ],
                )
      ]),

        ),
      ),
    );
  }
}
