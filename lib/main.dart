import 'package:elredtodo/providers/auth_provider.dart';
import 'package:elredtodo/providers/todo_provider.dart';
import 'package:elredtodo/routes/app_pages.dart';
import 'package:elredtodo/routes/app_routes.dart';
import 'package:elredtodo/utils/globals.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TodoProvider(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: Globals.APPNAME,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.authScreen,
        getPages: AppPages.pages,
      ),
    );
  }
}
