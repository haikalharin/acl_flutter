import 'package:acl_flutter/core/network/api_config.dart';
import 'package:acl_flutter/core/network/api_helper.dart';
import 'package:acl_flutter/core/network/dio_client.dart';
import 'package:acl_flutter/data/model/post/post.dart';
import 'package:acl_flutter/data/model/user/user.dart';

class PostApi with ApiHelper<Post> {
  final DioClient dioClient;

  PostApi({required this.dioClient});

  Future<bool> createPost(Post post) async {
    return await makePostRequest(dioClient.dio.post(ApiConfig.posts, data: post));
  }

  Future<bool> updatePost(Post post) async {
    return await makePutRequest(dioClient.dio.put("${ApiConfig.posts}/${post.id}", data: post));
  }

  Future<bool> deletePost(Post post) async {
    return await makeDeleteRequest(dioClient.dio.delete("${ApiConfig.posts}/${post.id}"));
  }

  Future<List<Post>> getUsers(User user) async {
    final queryParameters = {'user_id': "${user.id}"};

    return await makeGetRequest(dioClient.dio.get(ApiConfig.posts, queryParameters: queryParameters), Post.fromJson);
  }
}
