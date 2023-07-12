
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_firebasae/Routes/routes_name.dart';
import 'package:flash_chat_firebasae/component/my_button.dart';
import 'package:flutter/material.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
   upperBound: 100
    );
    animation= ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controller!);
   //  animation= CurvedAnimation(parent: controller!, curve: Curves.easeIn);
   // animation?.addStatusListener((status) {
   //   setState(() {
   //     if(status==AnimationStatus.completed){
   //       controller?.reverse(from: 1.0);
   //
   //     }else if(status==AnimationStatus.dismissed){
   //       controller?.forward();
   //     }
   //   });
   // });

    controller?.forward();
    controller?.addListener(() {
      setState(() {
        print(controller?.value);
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }
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
            Row(
              children:[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: controller!.value,
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w900,
                    fontSize: 40.0,
                  ),
                  child: AnimatedTextKit(

                    totalRepeatCount: 2,
                    animatedTexts: [
                      TypewriterAnimatedText('Flash Chat'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            MyButton(colors:Colors.blue,title: "Log In", onTapped: (){
              Navigator.pushNamed(context, RoutesName.login);
            }),
            MyButton(colors:Colors.lightBlueAccent,title: "Sign Up", onTapped: (){
              Navigator.pushNamed(context, RoutesName.registration);
            }),

          ],
        ),
      ),
    );

}}
