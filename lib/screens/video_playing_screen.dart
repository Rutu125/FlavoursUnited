import 'package:flutter/material.dart';
import 'package:flavours_united/components/video_item.dart';

class VideoPlayingScreen extends StatelessWidget {
  VideoItem item;
  VideoPlayingScreen(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: item,
            onDoubleTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
