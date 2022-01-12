import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes/Login_page.dart';


class  SignUp_pg extends StatefulWidget {
  @override
  State<SignUp_pg> createState() => _SignUp_pgState();
}

class _SignUp_pgState extends State<SignUp_pg> {
  bool checker_1=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checker_1=false;
  }
  //const SignUp_pg({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          fit:StackFit.expand,
          children: [
            Image.network("image url",
              fit:BoxFit.cover,
              //color: Colors.blueGrey,colorBlendMode: BlendMode.darken,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height:15,),
                      Text("\"Quotes\"",style:GoogleFonts.caveatBrush(fontSize: 46,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold,color:Colors.white)),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(17),
                          child: Form(
                            child: Column(
                              children: [
                                SizedBox(height: 15,),
                                TextFormField(
                                  keyboardType:TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      hintText: "Enter Email id",
                                      labelText: "Email ID",
                                      border:OutlineInputBorder()
                                  ),),
                                SizedBox(height: 12,),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: "Enter Username",
                                      labelText: "Select a Username",
                                      border: OutlineInputBorder()
                                  ),),
                                SizedBox(height: 12,),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Enter Password",
                                      labelText: "Set your Password",
                                      border: OutlineInputBorder()
                                  ),),
                                SizedBox(height: 12,),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Re-Enter Password",
                                      labelText: "Confirm your Password",
                                      border: OutlineInputBorder()
                                  ),),
                                SizedBox(height: 20,),

                                Center(
                                  child:checker_1==false?
                                  FlatButton(onPressed:()
                                  {
                                    checker_1=true;
                                    setState(() {});

                                  },
                                    child: Text("Submit",style:GoogleFonts.comfortaa(fontWeight:FontWeight.normal,color: Colors.white),),
                                    color: Colors.blueAccent,):
                                  Column(
                                    children: [
                                      Text("SignUp Successful,Please Login to continue",style:GoogleFonts.comfortaa(fontSize: 12,color: Colors.green,fontWeight: FontWeight.bold)),
                                      SizedBox(height: 10,),
                                      FlatButton(onPressed:()
                                      {
                                        Navigator.pop(context);
                                        },
                                        child: Text("Back",style:GoogleFonts.comfortaa(fontWeight:FontWeight.normal,color: Colors.white),),
                                        color: Colors.blueAccent,),
                                    ],
                                  )
                                )

                              ],
                            ),

                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],

        )
    );
  }
}