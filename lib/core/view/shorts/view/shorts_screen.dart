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
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        ShortCardPager(
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
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline_outlined),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.forum_outlined),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send_outlined),
              color: Colors.white,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.linear_scale_outlined,
                  color: Colors.white,
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Wednesday,yeni ortaya çıkan medyumluk yeteneğinde ustalaşmaya çalışacak, kasabada dehşet saçan kanlı bir cinayet serisini önleyecek ve 25 yıl önce ebeveynlerinin karıştığı doğaüstü bir gizemi çözecek. Üstelik tüm bunları yaparken okulda kurduğu yeni ve karmakarışık ilişkilerde yolunu bulmaya çalışacak.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
