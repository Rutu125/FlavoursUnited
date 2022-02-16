import 'package:flutter/material.dart';

class ImageMagnifier extends StatelessWidget {
  ImageMagnifier(this.img);
  Image img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: img,
      ),
    );
  }
}
