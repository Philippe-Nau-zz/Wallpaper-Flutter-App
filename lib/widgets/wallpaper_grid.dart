import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:wallpaper/models/wallpaper_model.dart';

class WallpaperGrid extends StatelessWidget {
  final List<WallpaperModel> items;
  WallpaperGrid({@required this.items});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        staggeredTileBuilder: (index) =>
            StaggeredTile.count(2, index.isEven ? 3 : 4),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemCount: this.items.length,
        crossAxisCount: 4,
        itemBuilder: (context, index) => GridTile(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xfff5f8fd),
              borderRadius: BorderRadius.circular(16),
            ),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/imageview',
                    arguments: this.items[index].largeUrl);
              },
              child: Hero(
                tag: this.items[index].largeUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    this.items[index].mediumUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
