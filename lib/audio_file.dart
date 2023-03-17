import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/src/audioplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  const AudioFile({Key? key, required this.advancedPlayer}) : super(key: key);

  // get path => null;

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration duration=new Duration();
  Duration position=new Duration();

  String path="https://www.youtube.com/watch?v=8xg3vE8Ie_E";
  bool isPlaying=false;
  bool isPaused=false;
  bool isRepeat=false;
  Color  color=Colors.black;

  List<IconData> icons=[
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];
  @override

  void initState(){
    super.initState();
    this.widget.advancedPlayer.onDurationChanged.listen((d) {setState((){
      duration=d;
    }); });

    this.widget.advancedPlayer.onPositionChanged.listen((p) {setState((){
      position=p;
    }); });

    // this.widget.advancedPlayer.setUrl(path);
    // this.widget.advancedPlayer!.setSourceUrl(this.widget.path!);
    this.widget.advancedPlayer.onPlayerComplete.listen((event) {
      setState((){
        if(isRepeat==true){
          isPlaying=true;
        }
        else{
          isPlaying=false;
        }
        position = Duration(seconds:0);
        isPlaying=false;
        isRepeat=false;
      });
    });
  }

  Widget btnStart(){
  return IconButton(
    padding: const EdgeInsets.only(bottom:10),
    icon:isPlaying==false?Icon(icons[0],size:50, color: Colors.blueAccent,):Icon(icons[1],size:50,color: Colors.blueAccent,),
    onPressed: (){
      if(isPlaying==false) {
        // this.widget.advancedPlayer.play(path);
        setState(() {
          isPlaying == true;
        });
      }else if(isPlaying==true){
        this.widget.advancedPlayer.pause();
        setState((){
          isPlaying==false;
        });
      }
    },
  );
  }

  Widget btnFast(){
    return
        IconButton(
            icon:ImageIcon(
              AssetImage('images/forward.png'),
              size:15,
              color:Colors.black,
            ),
            onPressed: (){
              this.widget.advancedPlayer.setPlaybackRate(1.5);
              // this.widget.advancedPlayer!.setPlaybackRate(1.5);
            },);
  }

  Widget btnSlow(){
    return IconButton(
      icon: ImageIcon(
        AssetImage('backword.png'),
        size:15,
        color:Colors.black,
      ),
      onPressed:(){
        this.widget.advancedPlayer.setPlaybackRate(0.5);
        // this.widget.advancedPlayer!.setPlaybackRate(0.5);
    } ,);

  }

  Widget slider(){
    return Slider(
      activeColor: Colors.red,
        inactiveColor: Colors.grey,
        value: position.inSeconds.toDouble(),
        min :0.0,
        max:duration.inSeconds.toDouble(),
        onChanged: (double value){
        setState((){
          changeToSecond(value.toInt());
          value=value;
        });
        });
  }

  Widget btnLoop(){
    return IconButton(
      icon:ImageIcon(
        AssetImage('images/rewind.png'),
        size:15,
        color:Colors.black,
      ),
          onPressed: ((){

          }),
    );
  }

  Widget btnRepeat(){
    return IconButton(
      icon:ImageIcon(
        AssetImage('images/repeat.png'),
        size:15,
        color:color,
      ),
      onPressed: ((){
        if(isRepeat==false){
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.loop);
            setState((){
              isRepeat=true;
              color:Colors.blueAccent;
            });
        }
        else if(isRepeat==true){
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.release);
          color=Colors.black;
          isRepeat=false;
        }
      }), );
  }

  void changeToSecond(int second){
    Duration newDuration=Duration(seconds:second);
    this.widget.advancedPlayer.seek(newDuration);
    
  }

  Widget loadAsset(){
    return
        Container(
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              btnRepeat(),
              btnSlow(),
              btnStart(),
              btnFast(),
              btnLoop(),
            ]
          )
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
        Column(
          children: [
            Padding(padding: const EdgeInsets.only(left: 20,right: 20),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(position.toString().split(".")[0],style:TextStyle(fontSize: 16),),
                
                Text(duration.toString().split(".")[0],style:TextStyle(fontSize: 16),),
              ],
            ),),

            slider(),
            loadAsset(),

          ],
        )
    );
  }
}
