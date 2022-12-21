import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recommend_movie/core/view/home/view/home_page.dart';
import 'package:recommend_movie/core/view/home/view/video_player.dart';

import '../../../components/VerticalCardPager/Model/model_vertical_card_pager.dart';
import '../../../components/VerticalCardPager/vertical_card_pager.dart';
import '../../../components/text/primary_text.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() { 
    super.initState();
      isPlayBool[2] = true;
  }
  List<bool> isPlayBool = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<Widget> list(int index) {
    return [
      AssetPlayer(
        isPlay: isPlayBool[0],
        mov: 'assets/video/video.mov',
      ),
      AssetPlayer(
        mov: 'assets/video/video.mov',
        isPlay: isPlayBool[1],
      ),
      AssetPlayer(
        isPlay: isPlayBool[2],
        mov: 'assets/video/video.mov',
      ),
      AssetPlayer(
        isPlay: isPlayBool[3],
        mov: 'assets/video/video.mov',
      ),
      AssetPlayer(
        isPlay: isPlayBool[4],
        mov: 'assets/video/video.mov',
      ),
      AssetPlayer(
        isPlay: isPlayBool[5],
        mov: 'assets/video/video.mov',
      ),
      AssetPlayer(
        isPlay: isPlayBool[6],
        mov: 'assets/video/video.mov',
      ),
      AssetPlayer(
        isPlay: isPlayBool[7],
        // images> 0 index > widget> isPlay= true or false
        mov: 'assets/video/video.mov',
      ),
      AssetPlayer(
        isPlay: isPlayBool[8],
        mov: 'assets/video/video.mov',
      ),
      AssetPlayer(
        isPlay: isPlayBool[9],
        mov: 'assets/video/video.mov',
      ),
    ];
  }

  int index = 2;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: PrimaryTextWidget(
                title: title1,
                fontsize: 30,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SizedBox(
                width: double.infinity,
                child: VerticalCardPager(
                  titles: titles,
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  images:list(index)
                  ,
                  onPageChanged: (page) {
                    log('OnCahnge ${page!.round()}');

                    /* setState(() {
                      isPlayBool[page.round()] = true;
                    });
                    log('$isPlayBool'); */
                  },
                  align: ALIGN.CENTER,
                  onSelectedItem: (indexs) {
                    setState(() {
                      index = indexs;
                  
                      isPlayBool[indexs] = true;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
