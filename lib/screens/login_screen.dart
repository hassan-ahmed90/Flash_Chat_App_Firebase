


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_firebasae/Routes/routes_name.dart';
import 'package:flash_chat_firebasae/constant.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;
  AnimationController? controller;
  Animation? animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,);
    animation= ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controller!);
    controller?.forward();
    controller?.addListener(() {
      setState(() {
        print(controller?.value);
      });

    });
  }
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: "logo",
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email=value;
                //Do something with the user input.
              },
              decoration: kInputDeco.copyWith(hintText: "Enter Email"),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password=value;
                //Do something with the user input.
              },
              decoration: kInputDeco.copyWith(hintText: "Enter Passwork")
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async{
                    try{
                      final user=await _auth.signInWithEmailAndPassword(email: email!, password: password!);
                      if(user!=null){
                        Navigator.pushNamed(context, RoutesName.chat);
                      }

                    }catch(e){
                      // print(e);
                    }

                    //Implement login functionality.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
