import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final double width;
  final String category;
  CategoryTile({this.width, this.category});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(1.2, 0.0), // 10% of the width, so there are ten blinds.
            colors: [
              Colors.lightBlueAccent, 
              Colors.lightBlue, 
              Colors.deepPurple
            ], // whitish to gray
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
          color: Colors.black,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.white,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(
              width * 0.05
            ),
          ),
        ),
        height: width * 0.55,
        width: width,
        child: Center(
          child: Text(
            this.category,
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontFamily: 'SF Pro',
              fontSize: width * 0.12,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}