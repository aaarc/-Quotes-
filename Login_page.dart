import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/Sign_Up_Page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

var list_of_users=["aaarc"];



class Login_pg extends StatefulWidget {



  //const Login_pg({Key? key}) : super(key: key);

  @override
  State<Login_pg> createState() => _Login_pgState();
}

class _Login_pgState extends State<Login_pg> {

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  String _em=' ';
  String _psw=' ';
  bool disp_error=false;
  String er_msg=" ";
  bool login_fail=false;
  var login_fail_msg=" either your email or password is wrong";

  



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
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height:15,),
                    Text("\"Quotes\"",style:GoogleFonts.caveatBrush(fontSize: 46,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold,color:Colors.white)),
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Text("An App that can satisfy your \"Quote\" needs!",style:GoogleFonts.comfortaa(fontSize: 26,fontStyle:FontStyle.italic,fontWeight:FontWeight.normal,color: Colors.white),),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key:_formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 15,),
                              TextFormField(
                                keyboardType:TextInputType.emailAddress,
                                onSaved: (input)=>_em=input.toString(),
                                validator: (input)
                                {
                                  if(input.toString().isEmpty) {
                                    return "Please enter a emailID";
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter username",
                                  labelText: "Username",
                                  border:OutlineInputBorder()
                                ),

                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                onSaved: (input)=>_psw=input.toString(),
                                validator: (input)
                                {
                                  //if(input.toString().isEmpty) {
                                    //return "Please enter a emailID";
                                  //}
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  labelText: "Password",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 15,),
                              login_fail?Text(login_fail_msg,style:GoogleFonts.comfortaa(fontSize:12,fontWeight:FontWeight.normal,color: Colors.red),):Text(" "),
                              SizedBox(height: 15,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FlatButton(onPressed:()
                                  {
                                    final form_state1=_formKey.currentState;
                                    if(form_state1!.validate()) {
                                      form_state1?.save();
                                      if (list_of_users.contains(_em)) {
                                        if ("/ temp username" == _em &&
                                            "/ temp password" == _psw) {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MainPage()));
                                        }
                                        else {
                                          login_fail = true;
                                          login_fail_msg =
                                          "Either the Email or the Password is Wrong";
                                          setState(() {});
                                        }
                                      }

                                      else {
                                        login_fail = true;
                                        login_fail_msg =
                                        "Account Does Not Exist Please Sign Up";
                                        setState(() {});
                                      }
                                    }

                                  },
                                    child: Text("Login",style:GoogleFonts.comfortaa(fontWeight:FontWeight.normal,color: Colors.white),),
                                  color: Colors.blueAccent,),
                                  FlatButton(onPressed:()
                                  {


                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp_pg()));
                                  },
                                    child: Text("Sign Up",style:GoogleFonts.comfortaa(fontWeight:FontWeight.normal,color: Colors.white),),
                                    color: Colors.blueAccent,)
                                ],
                              ),
                              disp_error?Text(er_msg,style:GoogleFonts.comfortaa(fontWeight:FontWeight.normal,color: Colors.red)):Text(" "),

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

