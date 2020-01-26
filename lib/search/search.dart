import 'package:bonvallet/search/category-tile.dart';
import 'package:flutter/material.dart';

final categories = [
  "Cooking",
  "Athletic",
  "Survival",
  "Marksmanship",
  "Academic",
  "Linguistic",
  "Relationship",
  "Business",
  "Musical",
  "Vocal",
  "Art",
  "Others"
];

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xdcf1faEE),
      ),
      child: Center(
        child: Wrap(
          children: _buildTiles(width),
        ),
      ),
    );
  }

  List<Widget> _buildTiles(double width) {
    List<Widget> tiles = [];
    bool addDivider = true;
    categories.forEach((category) {
      tiles.add(CategoryTile(
        width: width * 0.45,
        category: category
      ));
      if (addDivider) {
        tiles.add(VerticalDivider(
          width: width * 0.03
        ));
      }
      addDivider = !addDivider;
    });
    if (!addDivider) {
      tiles.removeLast();
    }
    return tiles;
  }
}