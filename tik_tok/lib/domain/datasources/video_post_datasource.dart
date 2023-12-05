import 'package:tik_tok/domain/entities/video_post.dart';

abstract class VideoPostDatasoruce {
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID);
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}
