import 'package:flutter/material.dart';
import 'package:recommend_movie/core/view/home/view/home_page.dart';

import '../../../components/vertical_card_pager/Model/model_vertical_card_pager.dart';
import '../widgets/vertical_card_pager.dart';
import '../../../components/text/primary_text.dart';
import '../../movie_detail.dart/model/dummy_data.dart';
import '../../movie_detail.dart/view/movie_detail.dart';

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
            padding: EdgeInsets.all(14.0),
            child: PrimaryTextWidget(
              title: title1,
              fontsize: 30,
            ),
          ),
          Expanded(
            child: VerticalCardPager(
              titles: titles,
              
              images: movie,
              onPageChanged: (page) {
               
              },
              onSelectedItem: (index) {
               Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => MovieDetailScreen(
                      movieModel: movies[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
