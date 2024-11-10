import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback? onTab;
  final bool onLoading;
  final String? title;

  const CustomButtonWidget({
    super.key,
    this.onTab,
    this.onLoading = false,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLoading ? null : onTab,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Color(0xFF4A90E2),
        ),
        child: Center(
          child: onLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
            title ?? "",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}