import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:quotes/main.dart';


class rickroll extends StatefulWidget {

  @override
  State<rickroll> createState() => _rickrollState();
}

class _rickrollState extends State<rickroll> {
  YoutubePlayerController _controller = YoutubePlayerController(initialVideoId: 'dQw4w9WgXcQ', flags: YoutubePlayerFlags(
    autoPlay: true, mute: false,),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("you have been Rickrolled!!!!",style:GoogleFonts.comfortaa(fontSize: 16,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold,color: Colors.white)),
      ),
      body: Center(child:Padding(padding: const EdgeInsets.all(10),child:Container(
        child: SingleChildScrollView(child:Card( child:Center(child:Padding(padding: const EdgeInsets.all(8),child:Container(child:YoutubePlayer(controller: _controller, liveUIColor: Colors.amber, showVideoProgressIndicator: false,

        ),),),),),),),),),
      backgroundColor:Colors.blueGrey,);
  }
}
