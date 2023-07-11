import 'package:flash_chat_firebasae/Routes/routes.dart';
import 'package:flash_chat_firebasae/Routes/routes_name.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          textTheme:
              const TextTheme(bodyLarge: TextStyle(color: Colors.black54))),
      initialRoute: RoutesName.welcome,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
