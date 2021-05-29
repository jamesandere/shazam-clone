import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:provider/provider.dart';
import 'package:shazam/models/home_helpers.dart';
import 'package:shazam/song_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class Home extends HookWidget {

  Widget build(BuildContext context) {

    // if(Provider.of<HomeHelpers>(context, listen: false).success){
    //   Navigator.push(context, MaterialPageRoute(builder: (context){
    //     return SongScreen(
    //       song: Provider.of<HomeHelpers>(context, listen: false).currentSong,
    //     );
    //   }));
    // }
    final vm = useProvider(homeHelperModel);

    return ProviderListener<HomeHelpers>(
      provider: homeHelperModel,
      onChange: (context, vm){
        if(vm.success){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return SongScreen(
              song: vm.currentSong,
            );
          }));
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFF001D34),
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
                animate: vm.isRecognizing,
                child: GestureDetector(
                  onTap: (){
                    vm.isRecognizing ? vm.stopRecognizing()
                    : vm.startRecognizing().whenComplete(() {

                    });
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
                        color: Color(0xFF089af8),
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
      ),
    );
  }
}
