import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:recommend_movie/core/view/movie_detail.dart/model/dummy_data.dart';
import 'package:recommend_movie/core/view/movie_detail.dart/view/movie_detail.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(1),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Padding(
                padding: const EdgeInsets.only(top:28.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(right:30.0),
                    child: Lottie.asset('assets/animation/popcorn3.json',width:200,height: 300,fit: BoxFit.cover,
                        controller: _animationController,
                        animate: true, onLoaded: (compositon) {
                      _animationController
                        ..duration = compositon.duration
                        ..forward().whenComplete(() => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailScreen(
                                        movieModel: movies[0],
                                      )),
                            ));
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Container(
                  color: Colors.white,
                  child:  Text(
                    'Sizin için en uygun filmi arıyoruz',
                    style: GoogleFonts.creteRound(textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(
                              offset: Offset(5.0, 5.0),
                              blurRadius: 10.0,
                              color: Colors.blueGrey)
                        ]), ),
                  )),
            )
          ],
        ));
  }
}
