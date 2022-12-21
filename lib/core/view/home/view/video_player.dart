import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AssetPlayer extends StatefulWidget {
  final String mov;
  final bool? isPlay;
  const AssetPlayer({super.key, required this.mov, this.isPlay=false});

  @override
  State<AssetPlayer> createState() => _AssetPlayerState();
}

class _AssetPlayerState extends State<AssetPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(widget.mov)
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((value) => widget.isPlay!? controller.play() :controller.pause());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? VideoPlayer(controller)
        : Container();
  }
}
