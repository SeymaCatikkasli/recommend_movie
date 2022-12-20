import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class AssetPlayer extends StatefulWidget {
  const AssetPlayer();

  @override
  State<AssetPlayer> createState() => _AssetPlayerState();
}

class _AssetPlayerState extends State<AssetPlayer> {
  final asset ='assets/video/video.mov';
  late VideoPlayerController controller ;



@override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=VideoPlayerController.asset(asset)
    ..addListener(() { setState(() {
      
    });})..setLooping(true)..initialize().then((value) => controller.play());
  }
  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized? VideoPlayer(controller):Container();
  }
}