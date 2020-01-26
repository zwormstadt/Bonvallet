import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final double width;
  final String category;
  CategoryTile({this.width, this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Center(
        child: Text(
          this.category,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'SF Pro',
            fontSize: width * 0.1,
          ),
        ),
      ),
    );
  }
}