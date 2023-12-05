import 'package:tik_tok/domain/datasources/video_post_datasource.dart';
import 'package:tik_tok/domain/entities/video_post.dart';
import 'package:tik_tok/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  final VideoPostDatasoruce videosDatasource;

  VideoPostsRepositoryImpl({
    required this.videosDatasource
  });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.getTrendingVideosByPage(page);
  }
}
