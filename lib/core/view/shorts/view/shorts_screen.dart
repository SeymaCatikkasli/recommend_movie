import 'package:flutter/material.dart';
import 'package:recommend_movie/core/components/vertical_card_pager/Model/model_vertical_card_pager.dart';


import '../../short_detail/model/short_data.dart';
import '../../short_detail/view/short_detail.dart';
import '../../shorts/widget/short_widget.dart';


class ShortScreen extends StatefulWidget {
  const ShortScreen({super.key});

  @override
  State<ShortScreen> createState() => _ShortScreenState();
}

class _ShortScreenState extends State<ShortScreen> {
  @override
  Widget build(BuildContext context) {
    return ShortCardPager(
      images: movie,
      titles: titles,
      textStyle: const TextStyle(
        fontFamily: "Bevan",
        color: Colors.white10,
      ),
      
      onPageChanged: (page) {},
      onSelectedItem: (index) {
         Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ShortMovieDetailScreen(
                      shortmovieModel: shortmovies[index],
                    ),
                  ),
                );
      }, 
    );
  }
}
