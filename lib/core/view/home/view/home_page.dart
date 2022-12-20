import 'package:flutter/material.dart';
import '../../../components/VerticalCardPager/Model/model_vertical_card_pager.dart';
import '../../../components/VerticalCardPager/vertical_card_pager.dart';
import '../../../components/text/primary_text.dart';

const title1 = 'Keşfetmeye Ne Dersin ?';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromRGBO(236, 247, 254, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: PrimaryTextWidget(
                  title: title1,
                  fontsize: 30,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height
              ,
              child: SizedBox(width: double.infinity,
              child: VerticalCardPager(titles: titles,textStyle: const TextStyle(color: Colors.white,),
              
                images: images,
                onPageChanged: (page) {},
                align: ALIGN.CENTER,
                onSelectedItem: (index) {},   ),),),
                
             
             
            ],
          ),
        ),
      ),
    );
  }
}
