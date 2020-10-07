import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WallpaperGrid extends StatelessWidget {
  final List items;
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
                Get.toNamed('/imageview', arguments: this.items[index]);
              },
              child: Hero(
                tag: this.items[index],
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: kIsWeb
                        ? Image.network(
                            this.items[index],
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: this.items[index],
                            placeholder: (context, url) => Container(
                              color: Color(0xfff5f8fd),
                            ),
                            fit: BoxFit.cover,
                          )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
