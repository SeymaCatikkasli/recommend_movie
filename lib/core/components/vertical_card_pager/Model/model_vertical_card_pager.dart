import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

final List<String> titles = [
  "AĞLATSIN",
  "ARKADAŞ ORTAMI",
  "BEYNİMİ YAKSIN",
  "EĞLENDİRSİN",
  "ETKİLESİN",
  "FARKLI BİR DÜNYA",
  "GERİLEYİM",
  "GAZA GETİRSİN",
  "MACERAYA DOYURSUN",
  "VURDULU KIRDILI",
  "SEVGİLİ İLE İZLEMELİK",
];
BoxFit box = BoxFit.fill;
const String boxfit = 'fill';

final List<VideoPlayerController> movie = [
  VideoPlayerController.asset('assets/video/video.mov'),
  VideoPlayerController.asset('assets/video/video2.mp4'),
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
