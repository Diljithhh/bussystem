import 'package:bussystem/Providers/LoginServiceProvider.dart';
import 'package:bussystem/UI/LaunchScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //LoginServiceProvider.instance.login();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LaunchWidget(),
    );
  }
}
