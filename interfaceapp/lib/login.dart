import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Databases/tryDB.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _name=TextEditingController();
  late TextEditingController _password=TextEditingController();

  int h1 = 0;
  int h2 = 0;
  final int _selectedValue = 1;
  int obsec = 1;

  late Database db;
  @override
  void initState(){
    super.initState();
    db = Database();
    db.openC();
  }

  void showAlertDialog(BuildContext context,msg,type,actual) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("warning"),
          content: Text(msg),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                if(type=="login"){
                  Navigator.of(context).pushNamed("homepage",arguments: {"name":actual});
                }else{
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
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        title: Center(
          child: Text(
            "Login",
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
                    controller: _name,
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
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 200,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () async{
                        if(_name.text.isEmpty || _password.text.isEmpty) {
                          showAlertDialog(context,
                              "You need to enter both username and password",
                              "nothing", "nothing");
                        }
                        else{
                          dynamic results = await db.login(
                              _name.text.trim(), _password.text.trim());
                          if (results == true) {
                            showAlertDialog(
                                context, "Login successful", "login",
                                _name.text.trim());
                          } else if (results == false) {
                            showAlertDialog(context,
                                "Login Unsuccessful, password or name is incorrect",
                                "nothing", "nothing");
                          } else {
                            showAlertDialog(context,
                                "Login Unsuccessful, password or name is incorrect",
                                "nothing", "nothing");
                          }

                        }

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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/futela.jpg",
              ),
              fit: BoxFit.cover,
              opacity: 0.5
            )
          ),
        ),
      ),
    );
  }
}
