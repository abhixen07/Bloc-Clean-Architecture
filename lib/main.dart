import 'package:bloc_clean_coding/config/routes/routes.dart';
import 'package:bloc_clean_coding/config/routes/routes_name.dart';
import 'package:bloc_clean_coding/repository/auth/login_http_api_repository.dart';
import 'package:bloc_clean_coding/repository/auth/login_repository.dart';
import 'package:bloc_clean_coding/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

//Dependency Injection in more files
GetIt getIt = GetIt.instance;
void main() {
  servicesLocator();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

void servicesLocator() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginHttpApiRepository());
}
