import 'package:flutter/material.dart';
import 'day_details.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// import 'contact_page.dart';
class EventSchedulePage extends StatefulWidget {
  const EventSchedulePage({Key? key}) : super(key: key);

  @override
  State<EventSchedulePage> createState() => _EventSchedulePageState();
}

class _EventSchedulePageState extends State<EventSchedulePage> with AutomaticKeepAliveClientMixin{
  int _counter = 0;
  double screenHeight = 0;
  double screenWidth = 0;

  bool startAnimation = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/splash/noise.gif'),
                fit: BoxFit.cover,
              ),
            ),

          ),
          centerTitle: true,
          title: const Text(
            'Event Schedule',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                // fontFamily: 'Kojiro_tpgugz',
                letterSpacing: 1),
          ),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: Material(
              // color: Color(0xff4c00b0), //<-- SEE HERE
              color: const Color(0xFF030718),
              child: _tabBar,
            ),
          ),
          backgroundColor: const Color(0xFF030718),
        ),
        body: TabBarView(
          children: [
            // Icon(Icons.flight, size: 350),
            c1(),
            c2(),
            c3(),
          ],
        ),
      ),
    );
  }

  TabBar get _tabBar => const TabBar(
    isScrollable: true,
    tabs: [
      // Tab(icon: Icon(Icons.flight)),
      // Tab(icon: Icon(Icons.directions_transit)),
      // Tab(icon: Icon(Icons.directions_car)),
      // Tab(icon: Icon(Icons.bike_scooter)),
      Tab(
        child: Text(
          'Day 1',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'Kojiro_tpgugz'),
        ),
      ),
      Tab(
        child: Text(
          'Day 2',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'Kojiro_tpgugz'),
        ),
      ),
      // Tab(text: 'Day3',)
      Tab(
        child: Text(
          'Day 3',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'Kojiro_tpgugz'),
        ),
      )
    ],
  );

  Widget c1() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('assets/images/splash/noise.gif'),
          fit: BoxFit.cover,
        ),
      ),

      // padding: EdgeInsets.all(20),
      // color: const Color(0xFF030718),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 20,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: day1_event_names.length,
              itemBuilder: (context, index) {
                // return item_day1(index);
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: ScaleAnimation(
                          child: item_day1(index),
                          duration: Duration(milliseconds: 631),
                        )
                    )
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget c2() {
    return Container(
      // padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('assets/images/splash/noise.gif'),
          fit: BoxFit.cover,
        ),
      ),

      // color: const Color(0xFF030718),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 20,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: day2_event_names.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: ScaleAnimation(
                          child: item_day2(index),
                          duration: Duration(milliseconds: 631),
                        )
                    )
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget c3() {
    return Container(
      // padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('assets/images/splash/noise.gif'),
          fit: BoxFit.cover,
        ),
      ),

      // color: const Color(0xFF030718),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 20,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: day3_event_names.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: ScaleAnimation(
                          child: item_day3(index),
                          duration: Duration(milliseconds: 631),
                        )
                    )
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }


  Widget item_day1(int index) {
    return AnimatedContainer(
      // height: 82,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 200)),
      transform:
      Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 20,
      ),
      decoration: BoxDecoration(
          color: const Color(0xfff4e2d5),
          border: Border.all(
            color: Colors.blueGrey,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.blueGrey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ]),
      child: Column(
        children: [
          const SizedBox(
            height: 14,
          ),
          Text(
            day1_event_names[index],
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color(0xFF030718),
                letterSpacing: 1.2,
                fontSize: 18,

                // fontWeight: FontWeight.w900,
                fontFamily: 'Kojiro_tpgugz'),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Venue: \n${day1_event_venues[index]}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Time:', style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )),
                  Text(
                    day1_event_timings[index],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Widget item_day2(int index) {
    return AnimatedContainer(
      // height: 82,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 200)),
      transform:
      Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 20,
      ),
      decoration: BoxDecoration(
          color: const Color(0xfff4e2d5),
          border: Border.all(
            color: Colors.blueGrey,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.blueGrey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ]),
      child: Column(
        children: [
          const SizedBox(
            height: 14,
          ),
          Text(
            day2_event_names[index],
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color(0xFF030718),
                letterSpacing: 1.2,
                fontSize: 18,

                // fontWeight: FontWeight.w900,
                fontFamily: 'Kojiro_tpgugz'),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Venue: \n${day2_event_venues[index]}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Time:', style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )),
                  Text(
                    day2_event_timings[index],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Widget item_day3(int index) {
    return AnimatedContainer(
      // height: 82,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 200)),
      transform:
      Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 20,
      ),
      decoration: BoxDecoration(
          color: const Color(0xfff4e2d5),
          border: Border.all(
            color: Colors.blueGrey,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.blueGrey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ]),
      child: Column(
        children: [
          const SizedBox(
            height: 14,
          ),
          Text(
            day3_event_names[index],
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color(0xFF030718),
                letterSpacing: 1.2,
                fontSize: 18,

                // fontWeight: FontWeight.w900,
                fontFamily: 'Kojiro_tpgugz'),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Venue: \n${day3_event_venues[index]}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Time:', style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )),
                  Text(
                    day3_event_timings[index],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

