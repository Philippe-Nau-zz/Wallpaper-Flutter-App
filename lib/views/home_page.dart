import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/controller/home_controller.dart';
import 'package:wallpaper/widgets/brand.dart';
import 'package:wallpaper/widgets/listview_categories.dart';
import 'package:wallpaper/widgets/search.dart';
import 'package:wallpaper/widgets/wallpaper_grid.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Brand(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Search(),
              SizedBox(height: 16),
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: (_) => Column(
                  children: [
                    ListviewCategories(items: _.categories),
                    WallpaperGrid(items: _.wallpapers),
                    _.moreImage.isNull
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                              onPressed: () {
                                _.getWallPapers(_.moreImage);
                              },
                              child: Text(
                                'More',
                                style: TextStyle(color: Colors.blueGrey[700]),
                              ),
                              color: Color(0xfff5fdfd),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
