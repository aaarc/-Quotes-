import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:quotes/About_page.dart';
import 'package:quotes/Login_page.dart';
import 'package:http/http.dart' as http;
import 'package:quotes/rickroll.dart';
import 'package:clipboard/clipboard.dart';

void main() {
  runApp(MaterialApp(home:Login_pg(),debugShowCheckedModeBanner: false,
  ));
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var url = Uri.parse('api');
  var data_q;
  var data_a;
  var data_1;
  var quote_copy;

  bool has_quote=true;
  var  is_rdy=false;
  fetch_quote()async
  {
    is_rdy=false;
    var response = await http.post(url);
    print(response.body);
    data_1=json.decode(response.body);
    data_q=data_1[0]['q'];
    data_a=data_1[0]['a'];
    data_a="- $data_a";
    quote_copy="\" $data_q\"\n\t$data_a";
    is_rdy=true;
    setState(() {});
  }

  @override
  void initState() {
    fetch_quote();
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    drawer: Padding(
        padding: const EdgeInsets.all(5),
        child: Drawer(
          child:ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: ListTile(
                    title:Text("More About This App",style:GoogleFonts.comfortaa(fontSize: 18,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold,)),
                    onTap:(){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>About_pg()));
                    },),),),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: ListTile(
                    title:Text("????",style:GoogleFonts.comfortaa(fontSize: 18,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold,)),
                    onTap:(){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>rickroll()));
                    },),),),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: ListTile(
                    title:Text("LogOut",style:GoogleFonts.comfortaa(fontSize: 18,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold,)),
                    trailing: Icon(Icons.logout),
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_pg()));
                    },

                  ),
                ),
              )
            ],
          )



    ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network("image url",
          fit: BoxFit.cover,),
          SizedBox(height: 55,),
          Text("\"Quotes\"",),
          SizedBox(height: 60,),
          Padding(padding: const EdgeInsets.all(20),
          child: Center(
            child:Column(
              children: [
                SizedBox(height: 51,),
                Text("\"Quotes\"",style:GoogleFonts.caveatBrush(fontSize: 65,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold,color:Colors.white)),
                SizedBox(height: 18,),
                Center(
                  child: data_1!=null?Card(child: Column(children: [
                    SizedBox(height: 10,),
                    is_rdy?Column(children:[
                      Padding(
                      padding: const EdgeInsets.all(15),
                      child:Center(child: Text("\"$data_q\"",style:GoogleFonts.caveatBrush(fontSize: 33,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold))),
                    ),
                    SizedBox(height: 5,),
                    Text(data_a,style:GoogleFonts.caveat(fontSize: 28,fontStyle:FontStyle.italic,fontWeight:FontWeight.normal),textAlign:TextAlign.end),
                      SizedBox(height: 20,),
                    FlatButton(onPressed: ()
                    {
                      FlutterClipboard.copy(quote_copy);
                    }, child:Text("Copy Quote",style:GoogleFonts.comfortaa(fontSize: 26,fontStyle:FontStyle.italic,fontWeight:FontWeight.normal,color: Colors.white),),color:Colors.blueAccent,),
                    FlatButton(onPressed: ()
                    {
                      fetch_quote();
                      has_quote==true;
                      setState(() {});
                    }, child: Text("Generate Quote",style:GoogleFonts.comfortaa(fontSize: 26,fontStyle:FontStyle.italic,fontWeight:FontWeight.normal,color: Colors.white),),color: Colors.blueAccent,),
                    SizedBox(height: 15,),
                    ],):Column(children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 20,),
                      Padding(padding: const EdgeInsets.all(10),
                      child:
                      FlatButton(onPressed: ()
                      {
                        fetch_quote();
                        has_quote=true;
                        setState(() {});
                      }, child: Text("Generate Quote",style:GoogleFonts.comfortaa(fontSize: 26,fontStyle:FontStyle.italic,fontWeight:FontWeight.normal,color: Colors.white),),color: Colors.blueAccent,
                      ),
                      ),
                      SizedBox(height: 15,),

                    ],)
                  ],
                  ),)
                  :FlatButton(onPressed: ()
                  {
                    has_quote==true;
                    setState(() {});
                    fetch_quote();
                    setState(() {});
                  }, child: Text("Generate Quote",style:GoogleFonts.comfortaa(fontSize: 26,fontStyle:FontStyle.italic,fontWeight:FontWeight.normal,color: Colors.white),),color: Colors.blueAccent,)
                )
              ],
            )
          ),)
        ],
      ),

    );
  }
}


