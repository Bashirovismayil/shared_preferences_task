import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_pref_task/task_pages/page1.dart';
import 'package:shared_pref_task/task_pages/page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  bool? isLogin;

  void getInstance() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLogin = pref.getBool("login");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLogin == false ? const Page2() : const Page1(),
    );
  }
}
