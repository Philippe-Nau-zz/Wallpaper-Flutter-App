import 'package:flutter/material.dart';

import 'categories_tile.dart';

class ListviewCategories extends StatelessWidget {
  final List items;

  ListviewCategories({@required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5),
        scrollDirection: Axis.horizontal,
        itemCount: this.items.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => CategoriesTile(
          imgUrl: this.items[index].imgUrl,
          title: this.items[index].categoriesName,
        ),
      ),
    );
  }
}
