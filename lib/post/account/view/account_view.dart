import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/data/remote/api_url.dart';
import 'package:product_app/post/account/controller/account_controller.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AccountController controller = Get.put(AccountController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Information'),
      ),
      body: Obx(() {
        // If loading, show a spinner
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // If there's an error message
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        // Get the user data
        final user = controller.user.value?.user;  // Accessing the User object safely

        if (user == null) {
          return const Center(child: Text('No user data available.'));
        }

        // Construct the profile image URL using imageViewPath from ApiUrl
        final profileImageUrl = '${ApiUrl.imageViewPath}${user.profile ?? ""}';

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Image (use a default image if profileImage is null)
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(profileImageUrl), // Directly using the image URL
              ),
              const SizedBox(height: 16),
              Text(
                'Name: ${user.firstName ?? "Not Available"} ${user.lastName ?? "Not Available"}',
                style: const TextStyle(fontSize: 18),
              ),
              Text('Username: ${user.username ?? "Not Available"}', style: const TextStyle(fontSize: 16)),
              Text('Phone: ${user.phoneNumber ?? "Not Available"}', style: const TextStyle(fontSize: 16)),
              Text('Email: ${user.email ?? "Not Available"}', style: const TextStyle(fontSize: 16)),
              Text('Role: ${user.roles?.isNotEmpty == true ? user.roles?.first.name : "Not Available"}', style: const TextStyle(fontSize: 16)),
            ],
          ),
        );
      }),
    );
  }
}
