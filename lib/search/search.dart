import 'package:bonvallet/search/category-tile.dart';
import 'package:flutter/material.dart';

const categories = [
  "Cooking",
  "Athletic",
  "Survival",
  "Marksmanship",
  "Academic",
  "Linguistic",
  "Programming",
  "Business",
  "Musical",
  "Vocal",
  "Painting",
  "Art"
];

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Wrap(
        children: _buildTiles(width),
      ),
    );
  }

  List<Widget> _buildTiles(double width) {
    List<Widget> tiles = [];
    bool addDivider = true;
    categories.forEach((category) {
      tiles.add(CategoryTile(
        width: width * 0.35,
        category: category
      ));
      if (addDivider) {
        tiles.add(VerticalDivider(
          width: width * 0.1
        ));
      }
      addDivider = !addDivider;
    });
    return tiles;
  }
}