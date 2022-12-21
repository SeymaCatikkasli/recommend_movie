import 'package:flutter/material.dart';
import 'package:recommend_movie/core/view/home/view/video_player.dart';

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



final List<Widget> images = [
  const AssetPlayer(
    mov: 'assets/video/video.mov',
  ),
  const AssetPlayer(
    mov: 'assets/video/video.mov',
    isPlay: true,
  ),
  const AssetPlayer(
    isPlay: true,
    mov: 'assets/video/video.mov',
  ),
  const AssetPlayer(
    isPlay: true,
    mov: 'assets/video/video.mov',
  ),
  const AssetPlayer(
    isPlay: true,
    mov: 'assets/video/video.mov',
  ),
  const AssetPlayer(
    isPlay: true,
    mov: 'assets/video/video.mov',
  ),
  const AssetPlayer(
    mov: 'assets/video/video.mov',
  ),
  const AssetPlayer(
    isPlay: true, // images> 0 index > widget> isPlay= true or false
    mov: 'assets/video/video.mov',
  ),
  const AssetPlayer(
    isPlay: true,
    mov: 'assets/video/video.mov',
  ),
  const AssetPlayer(
    isPlay: true,
    mov: 'assets/video/video.mov',
  ),
];
