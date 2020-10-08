import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/models/wallpaper_model.dart';

class WallpaperGrid extends StatelessWidget {
  final List<WallpaperModel> items;
  WallpaperGrid({@required this.items});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
        ),
        itemCount: this.items.length,
        itemBuilder: (context, index) => GridTile(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xfff5f8fd),
              borderRadius: BorderRadius.circular(16),
            ),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/imageview',
                    arguments: this.items[index].originalUrl);
              },
              child: Hero(
                tag: this.items[index].originalUrl,
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
