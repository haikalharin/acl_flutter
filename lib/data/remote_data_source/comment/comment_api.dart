import 'package:acl_flutter/core/network/api_config.dart';
import 'package:acl_flutter/core/network/api_helper.dart';
import 'package:acl_flutter/core/network/dio_client.dart';
import 'package:acl_flutter/data/model/comment/comment.dart';

class CommentApi with ApiHelper<Comment> {
  final DioClient dioClient;

  CommentApi({required this.dioClient});

  Future<bool> createComment(Comment comment) async {
    return await makePostRequest(dioClient.dio.post(ApiConfig.comments, data: comment));
  }

  Future<bool> deleteComment(Comment comment) async {
    return await makeDeleteRequest(dioClient.dio.delete("${ApiConfig.comments}/${comment.id}"));
  }

  Future<List<Comment>> getComments(int postId) async {
    final queryParameters = {'post_id': "$postId"};

    return await makeGetRequest(dioClient.dio.get(ApiConfig.comments, queryParameters: queryParameters), Comment.fromJson);
  }
}
