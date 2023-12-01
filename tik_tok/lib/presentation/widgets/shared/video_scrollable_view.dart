import 'package:flutter/material.dart';
import 'package:tik_tok/domain/entities/video_post.dart';
import 'package:tik_tok/presentation/widgets/shared/video_buttons.dart';
import 'package:tik_tok/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost video = videos[index];

        return Stack(
          children: [
            // video player + gradient
            SizedBox.expand(
              child: FullScreenPlayer(
                videoUrl: video.videoUrl,
                caption: video.caption
              )
              ),
            // botones
            Positioned(
            bottom: 40,
            right: 20,
              child: VideoButtons(video: video)
              )
          ],
        );
      },
    );
  }
}
