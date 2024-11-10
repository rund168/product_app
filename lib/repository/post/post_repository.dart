import 'package:product_app/data/remote/api_url.dart';
import 'package:product_app/data/remote/network_api_service.dart';
import 'package:product_app/models/post/Base_post_request.dart';
import 'package:product_app/models/post/Post_body_request.dart';
import 'package:product_app/models/post/post_base_response.dart';
import 'package:product_app/models/post/post_category.dart';

class PostRepository {
  final _api = NetworkApiService();

  Future<PostBaseResponse> getAllPostCategories(BasePostRequest req) async {
    try {
      var response = await _api.postApi(ApiUrl.postAppCategories, req.toJson());
      return PostBaseResponse.fromJson(response);
    } catch (e) {
      print("Error in getAllPostCategories: $e");
      rethrow; // Passes the error up to handle in the view model if needed
    }
  }

  Future<PostBaseResponse> createPostCategory(PostCategory req) async {
    try {
      var response = await _api.postApi(ApiUrl.postCreateCategoryPath, req.toJson());
      return PostBaseResponse.fromJson(response);
    } catch (e) {
      print("Error in createPostCategory: $e");
      rethrow;
    }
  }

  Future<PostBaseResponse> getCategoryById(BasePostRequest req) async {
    try {
      var response = await _api.postApi(ApiUrl.postCategoryByIdPath + req.id.toString(), req.toJson());
      return PostBaseResponse.fromJson(response);
    } catch (e) {
      print("Error in getCategoryById: $e");
      rethrow;
    }
  }

  Future<PostBaseResponse> getAllPosts(PostBodyRequest req) async {
    try {
      var response = await _api.postApi(ApiUrl.getAllPostPath, req.toJson());
      return PostBaseResponse.fromJson(response);
    } catch (e) {
      print("Error in getAllPosts: $e");
      rethrow;
    }
  }

  Future<PostBaseResponse> getPostById(BasePostRequest req) async {
    try {
      var response = await _api.postApi(ApiUrl.getPostByIdPath, req.toJson());
      return PostBaseResponse.fromJson(response);
    } catch (e) {
      print("Error in getPostById: $e");
      rethrow;
    }
  }

  Future<PostBaseResponse> createPost(BasePostRequest req) async {
    try {
      var response = await _api.postApi(ApiUrl.createPostPath, req.toJson());
      return PostBaseResponse.fromJson(response);
    } catch (e) {
      print("Error in createPost: $e");
      rethrow;
    }
  }
}
