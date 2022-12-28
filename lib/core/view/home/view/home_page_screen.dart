import 'package:flutter/material.dart';
import 'package:recommend_movie/core/view/home/view/home_page.dart';
import 'package:recommend_movie/core/view/shorts/widget/loading_screen.dart';

import '../../../components/vertical_card_pager/Model/model_vertical_card_pager.dart';
import '../widgets/vertical_card_pager.dart';
import '../../../components/text/primary_text.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: PrimaryTextWidget(
              title: title1,
              fontsize: 28,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: VerticalCardPager(
              titles: titles,
              images: movie,
              fontFamily: 'Bevan',
              onPageChanged: (page) {},
              onSelectedItem: (index) {
               Navigator.push(context,MaterialPageRoute(builder:(context)=>const LoadingScreen() ) );
              },
              color: Colors.white,
            ),
          ),
        ],
        



      ),
    );
  }
}
