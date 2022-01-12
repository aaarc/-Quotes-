import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About_pg extends StatelessWidget {
  const About_pg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text("About Page"),
      ),
      body:
        Center(child:Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Text("\n\n"),
                    Text("Thankyo for Using this App!!!",style:GoogleFonts.comfortaa(fontSize: 18,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold,color: Colors.black)),
                    SizedBox(height: 30,),
                    Text("Made By:aaarc with Flutter and Dart",style:GoogleFonts.comfortaa(fontSize: 15,fontStyle:FontStyle.italic,fontWeight:FontWeight.normal,color: Colors.black)),
                    SizedBox(height: 40,),
                    Text("Sources:\n\nImages:\ntheconversation.com, pexels.com, amazon.com, \n[images are not ownwd by me and i do not take any credit]",style:GoogleFonts.comfortaa(fontSize: 14,fontStyle:FontStyle.italic,fontWeight:FontWeight.normal,color: Colors.black)),
                    SizedBox(height: 10,),
                    Text("Video:\nNever Gonna Give You Up ,by rick astley\nQuotes:\nThe quotes are taken from zenquotes,via the zenquotes api",style:GoogleFonts.comfortaa(fontSize: 15,fontStyle:FontStyle.italic,fontWeight:FontWeight.normal,color: Colors.black)),
                    SizedBox(height: 20,),
                    FlatButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("Back",style:GoogleFonts.comfortaa(fontSize: 20,fontStyle:FontStyle.italic,fontWeight:FontWeight.normal,color: Colors.white)),color: Colors.blueAccent,)
                  ],
                ),
              ),
            )
            ,),
        ),
        ),
    );
  }
}
