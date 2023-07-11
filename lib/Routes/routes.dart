import 'package:flash_chat_firebasae/Routes/routes_name.dart';
import 'package:flash_chat_firebasae/screens/chat_screen.dart';
import 'package:flash_chat_firebasae/screens/login_screen.dart';
import 'package:flash_chat_firebasae/screens/registration_screen.dart';
import 'package:flash_chat_firebasae/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.welcome:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case RoutesName.chat:
        return MaterialPageRoute(builder: (context) => ChatScreen());

      case RoutesName.registration:
        return MaterialPageRoute(builder: (context) => RegistrationScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No Routes Defined'),
            ),
          );
        });
    }
  }
}
