import 'package:elredtodo/routes/app_routes.dart';
import 'package:elredtodo/screens/auth/auth_screen.dart';
import 'package:elredtodo/screens/splash_screen.dart';
import 'package:elredtodo/screens/todos/create_todo.dart';
import 'package:elredtodo/screens/todos/home_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage(
        name: AppRoutes.splashScreen,
        page: () => const SplashScreen(),
        title: "Splash Screen"),
    GetPage(
        name: AppRoutes.authScreen,
        page: () => const AuthScreen(),
        title: "Auth Screen"),
    GetPage(
        name: AppRoutes.homeScreen,
        page: () => const HomeScreen(),
        title: "Home Screen"),
    GetPage(
        name: AppRoutes.createTodo,
        page: () => const CreateTodo(),
        title: "Create Todo Screen"),
  ];
}
