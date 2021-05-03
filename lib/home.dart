import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shazam/models/home_helpers.dart';
import 'package:shazam/song_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    if(Provider.of<HomeHelpers>(context, listen: false).success){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return SongScreen(
          song: Provider.of<HomeHelpers>(context, listen: false).currentSong,
        );
      }));
    }

    return Scaffold(
      backgroundColor: Color(0xFF240C3E),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Tap for recognition',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 40.0,),
            AvatarGlow(
              endRadius: 200.0,
              animate: Provider.of<HomeHelpers>(context, listen: true).isRecognizing,
              child: GestureDetector(
                onTap: (){
                  Provider.of<HomeHelpers>(context, listen: false).isRecognizing ? Provider.of<HomeHelpers>(context, listen: false).stopRecognizing()
                  : Provider.of<HomeHelpers>(context, listen: false).startRecognizing();
                  // Navigator.push(context, MaterialPageRoute(builder: (context){
                  //   return SongScreen(
                  //     song: Provider.of<HomeHelpers>(context, listen: false).currentSong,
                  //   );
                  // }));
                },
                child: Material(
                  shape: CircleBorder(),
                  elevation: 8.0,
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF16CE),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.mic,
                      size: 110.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
