import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  bool isPasswordVisible = false;
  //Icon passwordIcon = const Icon(Icons.visibility_off);
  Icon passwordIcon = const Icon(Icons.visibility_off, color:Color(0xff545454),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),

      body: Column(
        children: [
          Expanded(child:

          SingleChildScrollView(
            //body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Create new\n  Account", style: TextStyle(color: Color(0xff715cf8), fontWeight: FontWeight.w800, fontSize: 42), ),


                    ],
                  ),




                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Registered?", style: TextStyle(color: Color(0xff715cf8), fontSize: 19), ),
                      TextButton(
                        child: Text("Login", style: TextStyle(color: Color(0xff715cf8), fontSize: 19),),
                        onPressed: () {
                          //Navigator.push(context,
                          //MaterialPageRoute(builder: (context) => ));
                        },
                      ),



                    ],
                  ),


                  const SizedBox(height: 18,),
                  Text("Please enter your name                       ", style: TextStyle(color: Color(0xff545454), fontSize: 15), ),
                  const SizedBox(height: 5,),



                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.fromBorderSide(BorderSide(color: Color(0xff545454), width: 2))
                    ),

                    child: Column(

                      children: <Widget>[

                        TextFormField(
                          decoration: InputDecoration(

                            border: InputBorder.none,

                            prefixIcon: Icon(Icons.person_2, color: Color(0xffffffff),),
                            //suffixIcon: Icon(Icons.visibility_off, color: Colors.grey,),

                            //hintText: "N A M E",

                            hintStyle: TextStyle(
                              color: Color(0xff6a6a6a),
                              fontSize: 11,
                            ),


                          ),

                        ),



                      ],


                    ),

                  ),





                  const SizedBox(height: 15,),
                  Text("Please enter your age                         ", style: TextStyle(color: Color(0xff545454), fontSize: 15), ),
                  const SizedBox(height: 5,),



                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.fromBorderSide(BorderSide(color: Color(0xff545454), width: 2))
                    ),

                    child: Column(

                      children: <Widget>[

                        TextFormField(
                          decoration: InputDecoration(

                            border: InputBorder.none,

                            prefixIcon: Icon(Icons.person_2, color: Color(0xffffffff),),
                            //suffixIcon: Icon(Icons.visibility_off, color: Colors.grey,),

                            //hintText: "N A M E",

                            hintStyle: TextStyle(
                              color: Color(0xff6a6a6a),
                              fontSize: 11,
                            ),


                          ),

                        ),



                      ],


                    ),

                  ),

                  const SizedBox(height: 15,),
                  Text("Please enter your gender                     ", style: TextStyle(color: Color(0xff545454), fontSize: 15), ),
                  const SizedBox(height: 5,),



                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.fromBorderSide(BorderSide(color: Color(0xff545454), width: 2))
                    ),

                    child: Column(

                      children: <Widget>[

                        TextFormField(
                          decoration: InputDecoration(

                            border: InputBorder.none,

                            prefixIcon: Icon(Icons.person_2, color: Color(0xffffffff),),
                            //suffixIcon: Icon(Icons.visibility_off, color: Colors.grey,),

                            //hintText: "N A M E",

                            hintStyle: TextStyle(
                              color: Color(0xff6a6a6a),
                              fontSize: 11,
                            ),


                          ),

                        ),



                      ],


                    ),

                  ),

                  const SizedBox(height: 15,),
                  Text("Please enter your district                     ", style: TextStyle(color: Color(0xff545454), fontSize: 15), ),
                  const SizedBox(height: 5,),



                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.fromBorderSide(BorderSide(color: Color(0xff545454), width: 2))
                    ),

                    child: Column(

                      children: <Widget>[

                        TextFormField(
                          decoration: InputDecoration(

                            border: InputBorder.none,

                            prefixIcon: Icon(Icons.person_2, color: Color(0xffffffff),),
                            //suffixIcon: Icon(Icons.visibility_off, color: Colors.grey,),

                            //hintText: "N A M E",

                            hintStyle: TextStyle(
                              color: Color(0xff6a6a6a),
                              fontSize: 11,
                            ),


                          ),

                        ),



                      ],


                    ),

                  ),


                  const SizedBox(height: 15,),
                  Text("Please enter your password                  ", style: TextStyle(color: Color(0xff545454), fontSize: 15), ),
                  const SizedBox(height: 5,),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.fromBorderSide(BorderSide(color: Color(0xff545454), width: 2))
                    ),

                    child: Column(

                      children: <Widget>[

                        TextFormField(
                          obscureText: isPasswordVisible ? false : true,
                          decoration: InputDecoration(

                            border: InputBorder.none,

                            prefixIcon: Icon(Icons.password, color: Color(0xffffffff),),
                            //suffixIcon: Icon(Icons.visibility_off, color: Colors.grey,),

                            //hintText: "P A S S W O R D",

                            hintStyle: TextStyle(
                              color: Color(0xff6a6a6a),
                              fontSize: 11,
                            ),
                            suffixIcon: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xffb5abf9),
                              ),
                              child:
                              IconButton.filled(

                                //icon: Icon(Icons.visibility_off, color: Color(0xff018abe),),
                                icon: passwordIcon,
                                onPressed:

                                    () {

                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                    if(isPasswordVisible){
                                      passwordIcon = const Icon(Icons.visibility, color: Color(0xff545454),);
                                    }
                                    else{
                                      passwordIcon = const Icon(Icons.visibility_off, color: Color(0xff545454),);

                                    }
                                  });

                                },

                                style: IconButton.styleFrom(
                                  backgroundColor: Color(0xffcdc7f6),

                                ),
                              ),

                            ),


                          ),

                        ),



                      ],


                    ),




                  ),

                  Container(
                      height: 50,
                      margin: EdgeInsets.all(30),
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text("S I G N   U P", style: TextStyle(color: Color(0xffd6e8ee), fontSize: 17),),
                        onPressed: () {
                          // Navigator.push(context,
                          //MaterialPageRoute(builder: (context) => ));
                        },
                        style: ElevatedButton.styleFrom(
                          //side: BorderSide(width: 2, color: Colors.black,),
                          textStyle: TextStyle(fontSize: 20),
                          //minimumSize: const Size(345, 115),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),

                          backgroundColor: Color(0xff715cf8),

                        ),
                      )
                  ),


                  //const SizedBox(height: 5,),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Forgot Password?",
                      style: TextStyle(color: Color(0xff715cf8), fontSize: 15),

                    ),
                  ),

                ],
              ),
            ),

          ),


          ),
        ],
      ),
    );


  }
  void displayMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1500),

    ));
  }
}