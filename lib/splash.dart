import 'package:flutter/material.dart';

import 'notch_bars.dart';
// import 'package:flutter_tutorial/notch_bars.dart';
// import 'package:splash_screen_viva/main.dart';
// import 'EventSchedulePage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {

    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          decoration:  BoxDecoration(
            // borderRadius: BorderRadius.circular(10),
            image: DecorationImage(

              image: AssetImage('assets/images/splash/bg_splash.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
          // color: const Color(0xFF030718),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: screenHeight / 5,
                width: double.infinity,
                child: Container(
                    // color: Colors.white,
                    ),
              ),
              Image(
                image: AssetImage("assets/images/splash/logo.webp"),
                height: screenHeight / 4.2,
                width: screenWidth / 1.4,
              ),
              SizedBox(
                height: screenHeight / 8,
                width: double.infinity,
              ),
              // Image(image: AssetImage("images/Jelly_Man"),
              //               //   height: 500.0,
              //               //   width: 125.0,
              //         )
              Image.asset(
                'assets/images/splash/Jelly_Man.gif',
                height: screenHeight / 3,
              )
              // Image.network(
              //     'https://cdn.pixabay.com/animation/2022/12/05/15/23/15-23-06-837_512.gif',
              //     width: 300,
              //     height: 500)
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    // ignore: use_build_context_synchronously
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MyHomePage(title: 'VIVACITY',)));
    Navigator.of(context).pushReplacement(_createRoute());
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const NotchBars(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
