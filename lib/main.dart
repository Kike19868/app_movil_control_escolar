import 'package:flutter/material.dart';
import 'package:mesadeservicio/routes/route_name.dart';
import 'package:mesadeservicio/routes/routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mesa de Servicio DCE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      initialRoute: RouteName.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}