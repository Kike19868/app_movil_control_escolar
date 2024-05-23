import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mesadeservicio/pages/home_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash>
with SingleTickerProviderStateMixin  {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds:2),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) =>  const HomePage()));
    });

  }

  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Image.asset("assets/images/pls.png")
          ],
        ),
      ),
    );
  }
}