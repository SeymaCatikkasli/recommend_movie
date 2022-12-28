import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recommend_movie/core/components/text/primary_text.dart';
import 'package:video_player/video_player.dart';

typedef PageChangedCallback = void Function(double? page);
typedef PageSelectedCallback = void Function(int index);

enum ALIGN { left, center, right }

class VerticalCardPager extends StatefulWidget {
  final List<String> titles;
  final List<VideoPlayerController> images;
  final PageChangedCallback? onPageChanged;
  final PageSelectedCallback? onSelectedItem;
  final int initialPage;
  final ALIGN align;
  final String fontFamily;
  final Color color;
  // ignore: use_key_in_widget_constructors
  const VerticalCardPager({
    required this.titles,
    required this.images,
    required this.color,
    this.onPageChanged,
    this.initialPage = 2,
    this.onSelectedItem,
    this.align = ALIGN.center,
    required this.fontFamily,
  }) : assert(titles.length == images.length);

  @override
  // ignore: library_private_types_in_public_api
  _VerticalCardPagerState createState() => _VerticalCardPagerState();
}

class _VerticalCardPagerState extends State<VerticalCardPager> {
  bool isScrolling = false;
  double? currentPosition;
  PageController? controller;
  late List<VideoPlayerController> _controller;
  late int pages;

  final String fontFamily = 'Bevan';

  @override
  void initState() {
    super.initState();
    _controller = [];
    pages = widget.initialPage;
    currentPosition = widget.initialPage.toDouble();
    controller = PageController(initialPage: widget.initialPage);

    controller!.addListener(() {
      setState(() {
        currentPosition = controller!.page;
        pages = int.parse('${controller!.page!.round()}');
        if (widget.onPageChanged != null) {
          Future(() => widget.onPageChanged!(currentPosition));
        }
      });
    });
    for (var i = 0; i < widget.images.length; i++) {
      _controller.add(widget.images[i]
        ..setLooping(true)
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        }));
    }
  }
@override
  void dispose() {
     for (var i = 0; i < widget.images.length; i++) {
      _controller[i].pause();
     
    }

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onVerticalDragEnd: (details) {
          isScrolling = false;
        },
        onVerticalDragStart: (details) {
          isScrolling = true;
        },
        onTapUp: (details) {
          if ((currentPosition! - currentPosition!.floor()).abs() <= 0.15) {
            int selectedIndex = onTapUp(
                context, constraints.maxHeight, constraints.maxWidth, details);

            if (selectedIndex == 2) {
              if (widget.onSelectedItem != null) {
                Future(() => widget.onSelectedItem!(currentPosition!.round()));
              }
            } else if (selectedIndex >= 0) {
              int goToPage = currentPosition!.toInt() + selectedIndex - 2;
              controller!.animateToPage(goToPage,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutExpo);
            }
          }
        },
        child: Stack(
          children: [
            CardControllerWidget(
              titles: widget.titles,
              images: widget.images,
              color: widget.color,
              currentPostion: currentPosition,
              cardViewPagerHeight: constraints.maxHeight,
              cardViewPagerWidth: constraints.maxWidth,
              align: widget.align,
              pages: pages,
              controller: _controller,
              fontFamily: fontFamily,
            ),
            Positioned.fill(
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.images.length,
                controller: controller,
                itemBuilder: (context, index) {
                  pages == index
                      ? _controller[index].play()
                      : _controller[index].pause();
                      

                  return Container();
                },
              ),
            )
          ],
        ),
      );
    });
  }

  int onTapUp(context, maxHeight, maxWidth, details) {
    final RenderBox box = context.findRenderObject();
    final Offset localOffset = box.globalToLocal(details.globalPosition);

    double dx = localOffset.dx;
    double dy = localOffset.dy;

    for (int i = 0; i < 5; i++) {
      double width = getWidth(maxHeight, i);
      double height = getHeight(maxHeight, i)!;
      double? left = getStartPositon(maxWidth, width);
      double top = getCardPositionTop(height, maxHeight, i);

      if (top <= dy && dy <= top + height) {
        if (left! <= dx && dx <= left + width) {
          return i;
        }
      }
    }
    return -1;
  }

  double? getStartPositon(cardViewPagerWidth, cardWidth) {
    double? position = 0;

    switch (widget.align) {
      case ALIGN.left:
        position = 0;
        break;
      case ALIGN.center:
        position = (cardViewPagerWidth / 2) - (cardWidth / 2);
        break;
      case ALIGN.right:
        position = cardViewPagerWidth - cardWidth;
        break;
    }

    return position;
  }

  double getWidth(maxHeight, i) {
    double cardMaxWidth = maxHeight/2;
    return cardMaxWidth - 60 * (i / 2).abs();
  }

  double? getHeight(maxHeight, i) {
    double? cardMaxHeight = maxHeight / 2;

    if (i == 2) {
      return cardMaxHeight;
    } else if (i == 0 || i == 4) {
      return cardMaxHeight! - cardMaxHeight * (4 / 5) - 10;
    } else {
      return cardMaxHeight! - cardMaxHeight * (4 / 5);
    }
  }
}

double getCardPositionTop(double cardHeight, double viewHeight, int i) {
  int diff = (2 - i);
  int diffAbs = diff.abs();

  double basePosition = (viewHeight / 2 ) - (cardHeight / 2);
  double cardMaxHeight = viewHeight / 2 ;

  if (diffAbs == 0) {
    return basePosition;
  }
  if (diffAbs == 1) {
    if (diff >= 0) {
      return basePosition - (cardMaxHeight * (6 / 9));
    } else {
      return basePosition + (cardMaxHeight * (6 / 9));
    }
  } else {
    if (diff >= 0) {
      return basePosition - cardMaxHeight * (8 / 9);
    } else {
      return basePosition + cardMaxHeight * (8 / 9);
    }
  }
}

class CardControllerWidget extends StatefulWidget {
  final double? currentPostion;
  final double cardMaxWidth;
  final double cardMaxHeight;
  final double cardViewPagerHeight;
  final double? cardViewPagerWidth;
  final ALIGN? align;
  final String fontFamily;
  final Color color;
  final int pages;
  final List? titles;
  final List? images;
  final List<VideoPlayerController> controller;

  const CardControllerWidget(
      {super.key,
      this.titles,
      this.images,
      required this.fontFamily,
      this.cardViewPagerWidth,
      required this.cardViewPagerHeight,
      this.currentPostion,
      this.align,
      required this.pages,
      required this.controller,
      required this.color})
      : cardMaxHeight = cardViewPagerHeight * (1 / 2),
        cardMaxWidth = cardViewPagerHeight * (1 / 2);

  @override
  State<CardControllerWidget> createState() => _CardControllerWidgetState();
}

class _CardControllerWidgetState extends State<CardControllerWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> cardList = [];

    for (int i = 0; i < widget.images!.length; i++) {
      var cardWidth = max(
          widget.cardMaxWidth - 40 * (widget.currentPostion! - i).abs(), 0.0);
      var cardHeight = getCardHeight(i);

      var cardTop = getTop(cardHeight, widget.cardViewPagerHeight, i);
      Widget card = Positioned.directional(
        textDirection: TextDirection.ltr,
        top: cardTop,
        start: getStartPositon(cardWidth),
        child: Opacity(
          opacity: getOpacity(i),
          child: SizedBox(
            width: cardWidth,
            height: cardHeight,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: VideoPlayer(widget.controller[i]))),
                Align(
                  child: PrimaryTextWidget(
                    title: widget.titles![i],
                    fontsize: getFontSize(i),
                    color: widget.color,
                    style: GoogleFonts.bevan(color: widget.color),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      cardList.add(card);
    }

    return Stack(
      children: cardList,
    );
  }

  double getOpacity(int i) {
    double diff = (widget.currentPostion! - i);

    if (diff >= -2 && diff <= 2) {
      return 1.0;
    } else if (diff > -3 && diff < -2) {
      return 3 - diff.abs();
    } else if (diff > 2 && diff < 3) {
      return 3 - diff.abs();
    } else {
      return 0;
    }
  }

  double getTop(double cardHeight, double viewHeight, int i) {
    double diff = (widget.currentPostion! - i);
    double diffAbs = diff.abs();

    double basePosition = (viewHeight / 2) - (cardHeight / 2);

    if (diffAbs == 0) {
      return basePosition;
    }
    if (diffAbs > 0.0 && diffAbs <= 1.0) {
      if (diff >= 0) {
        return basePosition - (widget.cardMaxHeight * (6 / 9)) * diffAbs;
      } else {
        return basePosition + (widget.cardMaxHeight * (6 / 9)) * diffAbs;
      }
    } else if (diffAbs > 1.0 && diffAbs < 2.0) {
      if (diff >= 0) {
        return basePosition -
            (widget.cardMaxHeight * (6 / 9)) -
            widget.cardMaxHeight * (2 / 9) * (diffAbs - diffAbs.floor()).abs();
      } else {
        return basePosition +
            (widget.cardMaxHeight * (6 / 9)) +
            widget.cardMaxHeight * (2 / 9) * (diffAbs - diffAbs.floor()).abs();
      }
    } else {
      if (diff >= 0) {
        return basePosition - widget.cardMaxHeight * (8 / 9);
      } else {
        return basePosition + widget.cardMaxHeight * (8 / 9);
      }
    }
  }

  double getCardHeight(int index) {
    double diff = (widget.currentPostion! - index).abs();

    if (diff >= 0.0 && diff < 1.0) {
      return widget.cardMaxHeight -
          widget.cardMaxHeight * (4 / 5) * ((diff - diff.floor()));
    } else if (diff >= 1.0 && diff < 2.0) {
      return widget.cardMaxHeight -
          widget.cardMaxHeight * (4 / 5) -
          10 * ((diff - diff.floor()));
    } else {
      final height = widget.cardMaxHeight -
          widget.cardMaxHeight * (4 / 5) -
          10 -
          5 * ((diff - diff.floor()));

      return height > 0 ? height : 0;
    }
  }

  double getFontSize(int index) {
    double diffAbs = (widget.currentPostion! - index).abs();
    diffAbs = num.parse(diffAbs.toStringAsFixed(2)) as double;

    double maxFontSize = 50;
    if (diffAbs >= 0.0 && diffAbs < 1.0) {
      if (diffAbs < 0.02) {
        diffAbs = 0;
      }

      return maxFontSize - 25 * ((diffAbs - diffAbs.floor()));
    } else if (diffAbs >= 1.0 && diffAbs < 2.0) {
      return maxFontSize - 25 - 5 * ((diffAbs - diffAbs.floor()));
    } else {
      final fontSize = maxFontSize - 30 - 15 * ((diffAbs - diffAbs.floor()));

      return fontSize > 0 ? fontSize : 0;
    }
  }

  double getStartPositon(cardWidth) {
    double position = 0;

    switch (widget.align!) {
      case ALIGN.left:
        position = 0;
        break;
      case ALIGN.center:
        position = (widget.cardViewPagerWidth! / 2) - (cardWidth / 2);
        break;
      case ALIGN.right:
        position = widget.cardViewPagerWidth! - cardWidth;
        break;
    }

    return position;
  }
}
