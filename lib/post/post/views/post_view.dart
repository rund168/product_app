import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/data/remote/api_url.dart';
import 'package:product_app/data/status.dart';
import 'package:product_app/post/post/controller/post_view_controller.dart';
import 'package:product_app/post/postinfo/view/post_info_view.dart';

class PostView extends StatelessWidget {
  final viewModel = Get.put(PostViewController());

  PostView({super.key});

  // Function to handle the refresh action
  Future<void> _refreshData() async {
    await viewModel.fetchPosts(); // Assuming you have a method to fetch posts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Obx(() {
        switch (viewModel.requestLoadingPostStatus.value) {
          case Status.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF26247B),
              ),
            );
          case Status.error:
            return const Center(
              child: Text(
                "Error loading data...",
                style: TextStyle(color: Color(0xFFB00020)),
              ),
            );
          case Status.completed:
          // Sort the posts by creation date (newest first)
            List posts = viewModel.postList;
            posts.sort((a, b) {
              // Assuming createAt is a DateTime or a String timestamp
              return b.createAt.compareTo(a.createAt); // Sort in descending order
            });

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: RefreshIndicator(
                onRefresh: _refreshData, // Trigger the refresh function
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    var data = posts[index];
                    return _buildPostCard(data);
                  },
                ),
              ),
            );
          default:
            return const SizedBox();
        }
      }),
    );
  }

  // Post card that can be tapped to navigate to PostInfoView
  Widget _buildPostCard(data) {
    return GestureDetector(
      onTap: () {
        // Navigate to the PostInfoView screen, passing the selected post's data
        Get.to(PostInfoView(postData: data));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Image
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: "${ApiUrl.imageViewPath}${data.image}", // Add default empty if null
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (context, url) =>
                      Image.asset("assets/images/icons/no-image.jpg", fit: BoxFit.cover),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/images/icons/no-image.jpg", fit: BoxFit.cover),
                ),
              ),
            ),
            // Post Info
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${data.title ?? 'No Title'}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${data.category?.name ?? 'No Category'}",
                    style: TextStyle(color: Colors.grey[700], fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.visibility, size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text("${data.totalView ?? 0} Views", style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
