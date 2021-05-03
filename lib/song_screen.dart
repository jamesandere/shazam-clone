import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shazam/models/deezer_song_model.dart';

class SongScreen extends StatelessWidget {
  final DeezerSongModel song;
  SongScreen({@required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF240C3E),
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
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: song?.album?.coverMedium != null ? NetworkImage(song?.album?.coverMedium)
                      : AssetImage(
                    'assets/images/oops.png',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100.0,
                      child: Column(
                        children: [
                          Expanded(
                            child: Text(
                              song?.title ,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ) ,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Expanded(
                      child: Text(
                        song?.artist?.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
