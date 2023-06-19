import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_tutorial/EventSchedulePage.dart';
// import 'package:flutter_tutorial/constants.dart';
// import 'package:flutter_tutorial/contact_page.dart';
// import 'package:flutter_tutorial/details_screen.dart';
// import 'package:flutter_tutorial/home_screen.dart';
import 'package:show_up_animation/show_up_animation.dart';

import 'EventSchedulePage.dart';
import 'constants.dart';
import 'contact_page.dart';
import 'home_screen.dart';

class NotchBars extends StatefulWidget {
  const NotchBars({Key? key}) : super(key: key);

  @override
  State<NotchBars> createState() => _NotchBarsState();
}

class _NotchBarsState extends State<NotchBars> {
  final _pageController = PageController(initialPage: 0);

  int maxCount = 3;

  /// widget list
  final List<Widget> bottomBarPages = [
    const HomeScreen(),
    const EventSchedulePage(),
    const ContactPage(),
    // const Page3(),
    // const Page4(),
    // const Page5(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash/noise.gif'),
            fit: BoxFit.cover,
          ),
        ),

        // height: MediaQuery.of(context).size.height * .899,
        child: PageView(

          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? ShowUpAnimation(
              delayStart: Duration(milliseconds: 1300),
              animationDuration: Duration(milliseconds: 1300),
              curve: Curves.bounceIn,
              direction: Direction.horizontal,
              offset: 0.5,
              child: AnimatedNotchBottomBar(
                // blurOpacity: .1,
                // showBlurBottomBar: true,
                pageController: _pageController,
                color: kButtonColor,
                showLabel: true,
                showShadow: false,
                itemLabelStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Kojiro_tpgugz',
                    letterSpacing: 1),
                notchColor: Colors.transparent,
                // showBlurBottomBar: true,
                // showShadow: true,
                bottomBarItems: [
                  const BottomBarItem(
                    inActiveItem: Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    ),
                    activeItem: Icon(
                      Icons.home_filled,
                      color: kButtonActiveColor,
                    ),
                    itemLabel: 'Events',
                  ),
                  BottomBarItem(
                    inActiveItem: Column(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                      ],
                    ),

                    activeItem: Column(
                      children: [
                        Icon(
                          Icons.star,
                          color: kButtonActiveColor,
                        ),
                      ],
                    ),
                    // Icon(
                    //   Icons.star,
                    //   color: Colors.blueAccent,
                    // ),
                    itemLabel: 'Schedule',
                  ),

                  ///svg example

                  const BottomBarItem(
                    inActiveItem: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    activeItem: Icon(
                      Icons.person,
                      color:kButtonActiveColor,
                    ),
                    itemLabel: 'Info',
                  ),
                ],
                onTap: (index) {
                  /// control your animation using page controller
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },

              ),
            )
          : null,
    );
  }
}
