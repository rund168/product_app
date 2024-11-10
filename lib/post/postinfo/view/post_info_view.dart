import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/data/remote/api_url.dart';
import 'package:product_app/post/post/controller/post_view_controller.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class PostInfoView extends StatelessWidget {
  final viewModel = Get.put(PostViewController());
  final dynamic postData;

  PostInfoView({super.key, required this.postData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Post Detail",
          style: TextStyle(
            color: Colors.white, // Make text white
            fontWeight: FontWeight.bold, // Make text bold
          ),
        ),
        backgroundColor: const Color(0xFF26247B),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Image with rounded corners and shadow
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: "${ApiUrl.imageViewPath}${postData.image}",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(color: Color(0xFF26247B)),
                ),
                errorWidget: (context, url, error) => Image.asset(
                    "assets/images/icons/no-image.jpg", fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),

            // Post Title
            Text(
              postData.title ?? "No Title",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),

            // Post Description (Text with ellipsis for overflow)
            Text(
              postData.description ?? "No Description",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),

            // Category and Post By Row (Added better styling and spacing)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoText("Category: ${postData.category?.name ?? 'No Category'}"),
                _buildInfoText("By: ${postData.createBy ?? 'Unknown'}"),
              ],
            ),
            const SizedBox(height: 16),

            // View Count Row (Icon and Text with spacing)
            Row(
              children: [
                const Icon(
                  Icons.visibility,
                  size: 18,
                  color: Colors.grey,
                ),
                const SizedBox(width: 6),
                Text(
                  "${postData.totalView ?? 0} Views",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Read More Button
            ElevatedButton(
              onPressed: () async {
                // Define the action for this button (launch the URL)
                final url = 'https://bbu.edu.kh/viewsite/view_event?page=13';
                if (await canLaunch(url)) {
                  await launch(url); // Launch the URL in the browser
                } else {
                  // If URL can't be launched, you can show a fallback (optional)
                  throw 'Could not launch $url';
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF26247B),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Read More",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create styled text for category and post by info
  Widget _buildInfoText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[700],
      ),
    );
  }
}
