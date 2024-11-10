import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:product_app/data/status.dart';
import 'package:product_app/models/post/Base_post_request.dart';
import 'package:product_app/models/post/post_category.dart';
import 'package:product_app/repository/post/post_repository.dart';

class PostCategoryFormViewModel extends GetxController {
  var categoryNameController = TextEditingController().obs;
  var postRepository = PostRepository();
  var onCreateLoading = false.obs;
  var requestLoadingCategoryStatus = Status.loading.obs;
  void setRequestLoadingCategoryStatus(Status value) =>
      requestLoadingCategoryStatus.value = value;
  var categoryRequest = PostCategory().obs;

  @override
  void onInit() {
    _getCategoryById();
    super.onInit();
  }

  _getCategoryById() async {
    try {
      categoryRequest.value.id = 0;
      int id = int.parse(Get.parameters["id"] ?? "0");
      if (int != 0) {
        requestLoadingCategoryStatus(Status.loading);
        var baseRequest = BasePostRequest(id: id);
        var response = await postRepository.getCategoryById(baseRequest);
        if (response.code == "SUC-000") {
          categoryRequest.value = PostCategory.fromJson(response.data);
          categoryNameController.value.text = categoryRequest.value.name ?? "";
        }
      }
    } finally {
      setRequestLoadingCategoryStatus(Status.completed);
    }
  }

  void onCreateCategory() async {
    if (categoryNameController.value.text.isEmpty) {
      Get.snackbar("Error", "Please enter category name");
      return;
    }
    onCreateLoading(true);
    try {
      categoryRequest.value
        ..name = categoryNameController.value.text
        ..status = "ACT";

      var response =
          await postRepository.createPostCategory(categoryRequest.value);

      if (response.code == "SUC-000") {
        Get.back(result: true);
        Get.snackbar("Success", "Category created successfully");
      } else {
        Get.snackbar("Error", response.message ?? "An error occurred");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to create category: $e");
    } finally {
      onCreateLoading(false);
    }
  }
}
