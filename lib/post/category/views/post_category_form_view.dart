import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/post/category/view_model/post_category_form_view_model.dart';
import 'package:product_app/post/widgets/custom_button_widget.dart';
import 'package:product_app/post/widgets/custom_input_widget.dart';

class PostCategoryFormView extends StatelessWidget {
  var viewModel = Get.put(PostCategoryFormViewModel());

  PostCategoryFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF4A90E2), // Updated color
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Create Category".tr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Obx((){
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Enter Category Details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomInputWidget(
                    controller: viewModel.categoryNameController.value,
                    labelText: "Category Name",
                    hintText: "Enter category name",
                  ),
                  SizedBox(height: 30),
                  CustomButtonWidget(
                    onTab: viewModel.onCreateCategory,
                    onLoading: viewModel.onCreateLoading.value,
                    title: "Create",
                  ),
                ],
                ///32:15
              );
            })
        )

    );
  }
}