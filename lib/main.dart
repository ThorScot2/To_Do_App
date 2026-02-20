import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/features/Auth/view/login_page.dart';
import 'package:to_do_app/features/Auth/view/signin_page.dart';
import 'Settings/App_Colors.dart';
import 'features/Auth/view/welcome.dart';
import 'features/Auth/viewmodel/authProvider.dart';
import 'features/tasks/model/task_model.dart';
import 'features/tasks/view/HomePage.dart';
import 'features/tasks/viewmodel/prov.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);

  // سجل ال Adapter بتاع Task
  Hive.registerAdapter(TaskAdapter());

  // افتح البوكس
  await Hive.openBox<Task>('tasks');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
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
      home: Welcome(),
      routes: {
        "home": (context) => Homepage(),
        "login" : (context) => LoginPage(),
        "register" : (context) => SigninPage(),
        "welcome" : (context) => Welcome(),
      },
    );
  }
}
