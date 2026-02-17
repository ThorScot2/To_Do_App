import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Settings/App_Colors.dart';
import 'features/tasks/view/HomePage.dart';
import 'features/tasks/viewmodel/prov.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TaskProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.bodyColor),
      home: Homepage(),
      routes: {
        "home": (context) => Homepage(),

        // "accounts" : (context) => Accountspage(),
      },
    );
  }
}
