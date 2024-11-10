import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_app/post/auth/register/controller/register_controller.dart';

class RegisterView extends StatelessWidget {
  final RegisterController registerController = Get.put(RegisterController());
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      registerController.profileImagePath.value = image.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color(0xFF26247B),
        centerTitle: true,
        title: Text(
          "Create Account",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Obx(() {
                    return Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ClipOval(
                        child: registerController.profileImagePath.value.isEmpty
                            ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image, size: 40, color: Colors.grey),
                        Text(
                          "Choose Profile",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10, // Adjust this value to make the text smaller
                          ),
                        ),
                          ],
                        )
                            : Image.file(
                          File(registerController.profileImagePath.value),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Please fill in the details to create a new account.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                      controller: registerController.firstNameController.value,
                      icon: Icons.person,
                      label: "First Name",
                      hint: "Enter your first name",
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: buildTextField(
                      controller: registerController.lastNameController.value,
                      icon: Icons.person_outline,
                      label: "Last Name",
                      hint: "Enter your last name",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              buildTextField(
                controller: registerController.usernameController.value,
                icon: Icons.account_circle_rounded,
                label: "Username",
                hint: "Choose a username",
              ),
              SizedBox(height: 20),
              buildTextField(
                controller: registerController.emailController.value,
                icon: Icons.email,
                label: "Email",
                hint: "Enter your email address",
              ),
              SizedBox(height: 20),
              buildTextField(
                controller: registerController.phoneNumberController.value,
                icon: Icons.phone,
                label: "Phone Number",
                hint: "Enter your phone number",
              ),
              SizedBox(height: 20),
              buildTextField(
                controller: registerController.passwordController.value,
                icon: Icons.lock,
                label: "Password",
                hint: "Choose a password",
                obscureText: true,
              ),
              SizedBox(height: 20),
              buildTextField(
                controller: registerController.confirmPasswordController.value,
                icon: Icons.lock_outline,
                label: "Confirm Password",
                hint: "Re-enter your password",
                obscureText: true,
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  registerController.register();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF26247B),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Obx(() {
                    if (registerController.loadingRegister.value) {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }
                    return Text(
                      "CREATE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String label,
    required String hint,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Color(0xFF26247B)),
        hintText: hint,
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[700]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF26247B)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF26247B), width: 2),
        ),
      ),
    );
  }
}
