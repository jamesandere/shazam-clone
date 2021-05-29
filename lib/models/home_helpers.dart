import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:shazam/models/deezer_song_model.dart';
import 'package:shazam/services/song_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeHelpers with ChangeNotifier{
  HomeHelpers(){
    initAcr();
  }

  final AcrCloudSdk acrCloudSdk = AcrCloudSdk();
  final songService = SongService();
  DeezerSongModel currentSong;
  bool isRecognizing = false;
  bool success = false;

  Future<void> initAcr() async {
    try {
    acrCloudSdk
      ..init(
        host: 'identify-eu-west-1.acrcloud.com',
        accessKey: '1c9613cc8defa96437731f941eba5e2b',
        accessSecret: 'smKWmhVVqip9P6FXpCikkFugoExTw6EimaiQLhYy',
        setLog: true,
      )
      ..songModelStream.listen(searchSong);
  } catch (e){
      print(e.toString());
    }
  }

  void searchSong(SongModel song) async{
    print(song);
    final metaData = song?.metadata;
    if(metaData != null && metaData.music.length > 0){
      final trackId = metaData?.music[0]?.externalMetadata?.deezer?.track?.id;
      try{
        final res = await songService.getTrack(trackId);
        currentSong = res;
        success = true;
        notifyListeners();
      } catch (e){
        isRecognizing = false;
        success = false;
        notifyListeners();
      }
    }
  }

  Future<void> startRecognizing() async {
    isRecognizing = true;
    success = false;
    notifyListeners();
    try{
      await acrCloudSdk.start();
    } catch(e){
      print(e.toString());
    }
  }

  Future<void> stopRecognizing() async {
    isRecognizing = false;
    success = false;
    notifyListeners();
    try{
      await acrCloudSdk.stop();
    } catch (e){
      print(e.toString());
    }
  }
}

final homeHelperModel = ChangeNotifierProvider<HomeHelpers>((ref){
  return HomeHelpers();
});