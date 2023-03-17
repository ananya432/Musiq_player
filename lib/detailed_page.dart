import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/audio_file.dart';

class DetailedAudioPage extends StatefulWidget {
  const DetailedAudioPage({Key? key}) : super(key: key);

  @override
  State<DetailedAudioPage> createState() => _DetailedAudioPageState();
}

class _DetailedAudioPageState extends State<DetailedAudioPage> {
  late AudioPlayer advancedPlayer;
  @override
  void initState(){
    super.initState();
    advancedPlayer=AudioPlayer();
  }
  @override
  Widget build(BuildContext context) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Stack(
        children:[
          Positioned(
              top:0,
              left:0,
              right:0,
              height:screenHeight/3,
              child:Container(
                  color:Colors.lightBlue.shade300,
              )),
          Positioned(
            top:0,
            left:0,
            right:0,
            child:AppBar(
              leading:IconButton(
                icon:Icon(Icons.arrow_back_ios),
                onPressed: (){

                },
              ),
                actions: [
                  IconButton(
                    icon:Icon(Icons.search),
                    onPressed: (){

                    },
                  ),
                ],
              backgroundColor: Colors.transparent,
              elevation:0.0,
            )),
          Positioned(
            left:0,
              right:0,
              top:screenHeight*0.2,
              height: screenHeight*0.36,
              child:Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color:Colors.white,
                ),
                child: Column(
                  children:[
                    SizedBox(height: screenHeight*0.1,),
                    Text("Hello",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight:FontWeight.bold ,
                      fontFamily: "Avenir",
                    ),),
                    Text("World",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Avenir"),),
                    AudioFile(advancedPlayer:advancedPlayer),
                  ]
                ),
              ) ),
          Positioned(
              top:screenHeight*0.12,
              left:(screenWidth-150)/2,
              right:(screenWidth-150)/2,
              height: screenHeight*0.16,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color:Colors.white,width:2),
                  color: Colors.grey.shade100,
                ),
                child: Padding(padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      // borderRadius: BorderRadius.circular(20),
                      border: Border.all(color:Colors.white,width:2),
                      image:DecorationImage(
                        image:AssetImage("images/musiq.png"),
                        fit: BoxFit.cover,

                      )
                  ),
                ),),

          ))
        ]
      )
    );
  }
}
