import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'components/basic_overlay_widget.dart';

class VideoPlayerWidget extends StatelessWidget {
  VideoPlayerWidget(this.controller);

  late final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) =>
      controller != null && controller.value.isInitialized
          ? Container(
              child: buildVideo(),
            )
          : Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrange,
              ),
            );

  Widget buildVideo() => Stack(
        children: [
          buildVideoPlayer(),
          Positioned.fill(
            child: BasicOverlayWidget(controller),
          ),
        ],
      );

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      );
}
