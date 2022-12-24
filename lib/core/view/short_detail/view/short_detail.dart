import 'package:flutter/material.dart';

import '../model/model_short_data.dart';


class ShortMovieDetailScreen extends StatefulWidget {
  final ShortMovieModel shortmovieModel;

  const ShortMovieDetailScreen({
    Key? key,
    required this.shortmovieModel,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShortMovieDetailScreenState createState() => _ShortMovieDetailScreenState();
}

class _ShortMovieDetailScreenState extends State<ShortMovieDetailScreen> {
  bool isDescExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(37, 23, 73,1),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            widget.shortmovieModel.name,
            style: const TextStyle(
              color: Colors.amber,
              
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _HeaderDelegate(
                shortmovieModel: widget.shortmovieModel,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  if (widget.shortmovieModel.y18plus)
                    const _MovieInfoCard(
                      child: Text(
                        '18+',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  _MovieInfoCard(
                    child: Text(
                      getTextByCategry(widget.shortmovieModel.shortmovieCategry),
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  _MovieInfoCard(
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.yellow[800],
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.shortmovieModel.rate.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_box_rounded,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: Text(
                  widget.shortmovieModel.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: Text(
                  widget.shortmovieModel.desc,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: Text(
                  'Actors',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 60,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: widget.shortmovieModel.actors
                        .map(
                          (e) => Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(e.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        ),
      ),
    );
  }

  getTextByCategry(ShortMovieCategry shortmovieCategry) {
    String string = '';

    switch (shortmovieCategry) {
      case ShortMovieCategry.action:
        string = 'Action';
        break;
      case ShortMovieCategry.comedy:
        string = 'Comedy';
        break;
      case ShortMovieCategry.romance:
        string = 'Romance';
        break;
      case ShortMovieCategry.fantasy:
        string = 'Fantasy';
        break;
    }

    return string;
  }
}



class _MovieInfoCard extends StatelessWidget {
  final Widget child;

  const _MovieInfoCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.white38,
            blurRadius: 10,
          )
        ],
      ),
      child: child,
    );
  }
}

const _maxHeaderExtend = 350.0;
const _minHeaderExtend = 220.0;

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final ShortMovieModel shortmovieModel;

  _HeaderDelegate({
    required this.shortmovieModel,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Hero(
            tag: shortmovieModel.name,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  image: AssetImage(shortmovieModel.coverUrl),
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                    Colors.black38,
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -2,
            left: 0,
            right: 0,
            child: Container(
              height: 40,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: CircleAvatar(
              backgroundColor: Colors.redAccent.withOpacity(0.7),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 10,
            child: Text(
              shortmovieModel.duration,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => _maxHeaderExtend;

  @override
  double get minExtent => _minHeaderExtend;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}