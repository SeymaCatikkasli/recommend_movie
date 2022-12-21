import 'package:flutter/material.dart';
import 'package:recommend_movie/core/view/home/view/home_page_screen.dart';
import 'package:recommend_movie/core/view/home/view/search_screen.dart';
import 'package:recommend_movie/core/view/home/view/setting_screen.dart';
import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';

const title1 = 'Keşfetmeye Ne Dersin ?';

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
          itemIcons: const [Icons.home, Icons.settings],
          centerIcon: Icons.search,
          selectedIndex: _selectedIndex,
          onItemPressed: onItemPressed),
      backgroundColor: const Color.fromRGBO(236, 247, 254, 1),
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
        _selectedWidget= const SearchScreen();
    }
    else if(index==2){
       _selectedWidget=const SettingScreen();
    }
  });
}
}
