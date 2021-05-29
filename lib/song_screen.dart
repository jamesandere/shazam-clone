import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shazam/models/deezer_song_model.dart';
import 'package:audioplayers/audioplayers.dart';

class SongScreen extends StatelessWidget {
  final DeezerSongModel song;
  SongScreen({@required this.song});
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: song?.artist?.pictureXl != null ? NetworkImage(song?.artist?.pictureXl)
                      : AssetImage(
                    'assets/images/oops.png',
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: Container(
            //     padding: EdgeInsets.all(20.0),
            //     width: MediaQuery.of(context).size.width,
            //     color: Colors.black,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Container(
            //           height: 100.0,
            //           child: Column(
            //             children: [
            //               Expanded(
            //                 child: song?.title != null ? Text(
            //                   song?.title ,
            //                   style: TextStyle(
            //                     color: Colors.white,
            //                     fontSize: 40.0,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                 ) : Text('c'),
            //               ),
            //             ],
            //           ),
            //         ),
            //         SizedBox(height: 5.0,),
            //         Expanded(
            //           child: song?.artist?.name != null? Text(
            //             song?.artist?.name,
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 15.0,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ) : Text('fj'),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black26,
              padding: EdgeInsets.only(bottom: 130.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  MaterialButton(
                    onPressed: () async{
                      print('kk');
                      await audioPlayer.play('https://cdns-preview-3.dzcdn.net/stream/c-3ff6135fdabb39bd6231f2ffc76b2d48-3.mp3', isLocal: false);

                    },
                    color: Colors.orange,
                    shape: CircleBorder(),
                    height: 80.0,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 60.0,
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Text(
                    song?.title ?? 'No song found!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    song?.artist?.name ?? '',
                    style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
