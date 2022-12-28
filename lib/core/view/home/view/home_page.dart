import 'package:flutter/material.dart';
import 'package:recommend_movie/core/view/home/view/home_page_screen.dart';
import 'package:recommend_movie/core/view/saved_screen/view/saved_screen.dart';
import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';

import '../../Shorts/view/shorts_screen.dart';

const title1 = 'Moduna Göre Seç';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Widget _selectedWidget;
  int _selectedIndex = 0;
  @override
  void initState() {
    _selectedWidget =const  HomePageScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DiamondBottomNavigation(
          itemIcons: const [Icons.home_outlined, Icons.bookmarks_outlined],

          centerIcon: Icons.movie_filter_outlined,
          selectedIndex: _selectedIndex,
          onItemPressed: onItemPressed),
      backgroundColor:  Colors.white,
      body: _selectedWidget,
    );
  }
  void onItemPressed(index){
  setState(()
  {
    _selectedIndex=index;
    if(index==0){
      _selectedWidget=const HomePageScreen();
    }
    else if (index==1){
        _selectedWidget= const ShortScreen();
    }
    else if(index==2){
       _selectedWidget=const SavedScreen();
    }
  });
}
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}