import 'package:flutter/material.dart';
import 'package:recommend_movie/core/view/home/view/home_page.dart';

import '../../../components/VerticalCardPager/Model/model_vertical_card_pager.dart';
import '../../../components/VerticalCardPager/vertical_card_pager.dart';
import '../../../components/text/primary_text.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(14.0),
            child: PrimaryTextWidget(
              title: title1,
              fontsize: 30,
            ),
          ),
          Expanded(
            child: VerticalCardPager(
              titles: titles,
              textStyle: const TextStyle(
                color: Colors.white,
              ),
              images: movie,
              onPageChanged: (page) {
               
              },
              onSelectedItem: (index) {
               
              },
            ),
          ),
        ],
      ),
    );
  }
}
