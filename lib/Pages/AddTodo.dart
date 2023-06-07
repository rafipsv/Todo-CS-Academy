// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            customText("Enter Title"),
          ],
        ),
      ),
    );
  }

  Widget customText(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 22),
      child: Row(
        children: [
          Text(title),
        ],
      ),
    );
  }
}
