import 'package:flutter/material.dart';
import 'package:shared_pref_task/task_pages/page1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 2"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool("login", true).then((value) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Page1(),
                    ));
              });
            },
            child: const Text("Go to Page1"),
          ),
        ],
      ),
    );
  }
}
