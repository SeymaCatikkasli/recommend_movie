import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:recommend_movie/core/view/login/view/login_screen.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  static const tiles = [
    GridTile(2, 2),
    GridTile(2, 1),
    GridTile(1, 2),
    GridTile(1, 1),
    GridTile(2, 2),
    GridTile(1, 2),
    GridTile(1, 1),
    GridTile(3, 1),
    GridTile(1, 1),
    GridTile(4, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
   
      child: SafeArea(
        child: Column(
          children: [
           

 ElevatedButton(onPressed: (){
   Navigator.of(context).push(MaterialPageRoute(builder:(context)=> LoginScreen()));
 }, child: const Text('data')),



            const Text(' - Kaydedilenler - ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(height: 10,),
            const CircleAvatar(
              radius: 70,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage('https://picsum.photos/200/300'),
            ),
            const SizedBox(height: 10,),
            const Text(
              'Kullanıcı Bilgileri',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5,),
            const Text('Şeyma Çatıkkaşlı'),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                 
                   child: StaggeredGrid.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: [
                        ...tiles.mapIndexed((index, tile) {
                          return StaggeredGridTile.count(
                            crossAxisCellCount: tile.crossAxisCount,
                            mainAxisCellCount: tile.mainAxisCount,
                            child: ImageTile(
                              index: index,
                              width: tile.crossAxisCount * 100,
                              height: tile.mainAxisCount * 100,
                            ),
                          );
                        }),
                      ],
                    ),
                 ),
                ),
              
            
          ],
        ),
      ),
    );
  }
}

class GridTile {
  const GridTile(this.crossAxisCount, this.mainAxisCount);
  final int crossAxisCount;
  final int mainAxisCount;
}

class ImageTile extends StatelessWidget {
  const ImageTile({
    Key? key,
    required this.index,
    required this.width,
    required this.height,
    this.radius,
  }) : super(key: key);

  final int index;
  final int width;
  final int height;
  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        'https://picsum.photos/$width/$height?random=$index',
        width: width.toDouble(),
        height: height.toDouble(),
        fit: BoxFit.cover,
      ),
    );
  }
}
