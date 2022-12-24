import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

final List<String> titles = [
  "FANTASTİK",
  "AKSİYON",
  "MACERA",
  "KOMEDİ",
  "DRAM",
  "SUÇ",
  "KORKU",
  "ROMANTİK",
  "GERİLİM",
  "BİLİM KURGU",
];
BoxFit box = BoxFit.fill;
const String boxfit = 'fill';

final List<VideoPlayerController> movie = [
  VideoPlayerController.asset('assets/video/video.mov'),
  VideoPlayerController.asset('assets/video/video.mov'),
  VideoPlayerController.asset('assets/video/video.mov'),
  VideoPlayerController.asset('assets/video/video.mov'),
  VideoPlayerController.asset('assets/video/video.mov'),
  VideoPlayerController.asset('assets/video/video.mov'),
  VideoPlayerController.asset('assets/video/video.mov'),
  VideoPlayerController.asset('assets/video/video.mov'),
  VideoPlayerController.asset('assets/video/video.mov'),
  VideoPlayerController.asset('assets/video/video.mov'),
];
