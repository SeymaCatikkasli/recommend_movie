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
BoxFit box =BoxFit.fill;
const String boxfit='fill';
final List<Widget> images = [
  Container(
   decoration:  BoxDecoration(
    
    image: const DecorationImage(image: AssetImage('assets/img/fantastik.jpeg'),),
   borderRadius: BorderRadius.circular(30.0),
   ),
    child: Image.asset('assets/img/fantastik.jpeg'),
  ),
  const AssetPlayer(),
  Image.asset(
    
    'assets/img/macera.jpeg',
    fit: BoxFit.fill,
  ),
  Image.asset(
    'assets/img/komedi.jpeg',
    fit: box,
  ),
 Image.asset(
   'assets/img/dram.jpeg',
  fit: box,
 ),
  Image.asset(
    'assets/img/suc.jpeg',
    fit: box,
  ),
   Image.asset(
     'assets/img/korku.jpeg',
     fit: box,
   ),
   Image.asset(
     'assets/img/romantik.jpeg',
     fit: box,
   ),
   Image.asset(
     'assets/img/gerilim.jpeg',
    fit: box,
   ),
   Image.asset(
     'assets/img/bilimkurgu.jpeg',
    fit: box,
   ),
];
