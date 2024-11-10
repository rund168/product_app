import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:product_app/data/status.dart';
import 'package:product_app/models/post/Post_body_request.dart';
import 'package:product_app/models/post/response/post_response.dart';
import 'package:product_app/repository/post/post_repository.dart';

class PostViewController extends GetxController {
  var postList = <PostResponse>[].obs;
  var requestLoadingPostStatus = Status.loading.obs;
  var storage = GetStorage();

  final _postRepository = PostRepository();

  void setRequestLoadingPostStatus(Status value) {
    requestLoadingPostStatus.value = value;
  }

  @override
  void onInit() {
    loadingData();
    super.onInit();
  }

  loadingData() async {
    setRequestLoadingPostStatus(Status.loading);
    if(storage.read("USER_KEY") != null){
      var user = storage.read("USER_KEY");
      print("USER EXIST ${user}");
      print("ACCESSTOKEN ${user['user']['profile']}");
    }
    print("Fetching post data...");
    try {
      await _getAllPost();
      setRequestLoadingPostStatus(Status.completed);
    } catch (e) {
      setRequestLoadingPostStatus(Status.error);
      print("Error loading data: $e");
    }
  }

  _getAllPost() async {
    var request = PostBodyRequest();
    var response = await _postRepository.getAllPosts(request);
    if (response.data != null) {
      postList.clear();
      response.data.forEach((data) {
        postList.add(PostResponse.fromJson(data));
      });
    }
  }

  fetchPosts() async {
    setRequestLoadingPostStatus(Status.loading);
    try {
      var request = PostBodyRequest();
      var response = await _postRepository.getAllPosts(request);
      if (response.data != null) {
        postList.clear();
        response.data.forEach((data) {
          postList.add(PostResponse.fromJson(data));
        });
      }
      setRequestLoadingPostStatus(Status.completed);
    } catch (e) {
      setRequestLoadingPostStatus(Status.error);
      print("Error fetching posts: $e");
    }
  }
}
