// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();

    Future<void> addTodo(String title, String desc) async {
      String url = "https://api.nstack.in/v1/todos";
      var body = {
        "title": title,
        "description": desc,
        "is_completed": "false",
      };
      final response = await http.post(
        Uri.parse(url),
        body: body,
      );
      if (response.statusCode == 201) {
        debugPrint("Todo Posted");
      } else {}
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            customText("Enter Title"),
            const SizedBox(
              height: 20,
            ),
            customField(controller, "Type..."),
            const SizedBox(
              height: 20,
            ),
            customText("Enter Description"),
            const SizedBox(
              height: 20,
            ),
            customField(controller2, "Type..."),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                addTodo(controller.text, controller2.text);
              },
              child: const Text("Post"),
            )
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

  Widget customField(TextEditingController controller, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: title),
      ),
    );
  }
}
