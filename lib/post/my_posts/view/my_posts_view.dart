import 'package:flutter/material.dart';

class MyPostsView extends StatelessWidget {
  const MyPostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This is the My Posts page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
