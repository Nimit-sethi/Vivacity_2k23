// import 'dart:html';

// import 'dart:html';

// import 'dart:html';

import 'package:dismissible_carousel_viewpager/dismissible_carousel_viewpager.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_tutorial/constants.dart';
// import 'package:flutter_tutorial/details_screen.dart';
// import 'package:flutter_tutorial/eventDetails.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:vivacity/FetchedDetails.dart';

import 'FetchedDetails.dart';
import 'constants.dart';
import 'details_screen.dart';
import 'eventDetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin{
  // late ScrollController _scrollController;
  String? event;
  var isloading=false;
  late double width;
  DatabaseReference ref = FirebaseDatabase.instance.ref('events');
  List<String> list=['amit','varun'];

  late double height;
  // String? eventName;
  // String? eventDescription;
  // String? eventTime;
  // String? eventDate;
  // String? eventVenue;
  // String? eventDescription;

  // late int i;
  int? eventNumber;
  Color color = const Color(0xff2e2b5a);
  Color kTabBarColor = Color(0xff2e2b5a);
  Color kTabBarActiveColor = Color(0xff871df1);
  // List<String> list = [];
  // late List<Events> x;
  List<bool> pressed = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  // List<String> tabText = [
  //   'Pronites',
  //   '🎸  Music',
  //   '💃 Dance',
  //   'Natak',
  //   'Lifestyle',
  //   '📸 Photography',
  //   'Speaking skills',
  //   'Media Cell',
  //   'Quizzinga',
  //   'Drama',
  //   'Social causes',
  //   'Art',
  // ];

  List<String> tabText = [
    '🎤 Pronites'.toUpperCase(),
    '🎸  MUSIC',
    '💃 Dance'.toUpperCase(),
    '🕺 NATAK',
    '👒 LIFESTYLE',
    '📸 Photography'.toUpperCase(),
    '🗣 SPEAKING SKILLS',
    '🎙  ️MEDIA CELL',
    '📝 QUIZZINGA',
    '🎭 DRAMA',
    '👥 SOCIALCAUSES',
    '🎨 Art'.toUpperCase(),
   ];

  // Color color2 = Color(0xff871df1);
  List<Widget> cards = [];
  bool startAnimation = false;
  late int count;
  int count_1=2;
  double size = 10;
  List<String> listOfEvents = [];
  List<String> listOfPronitesEvents = [];
  List<String> listOfDescription = [];
  List<String> listOfPronitesDescription = [];
  List<String> listOfDate = [];
  List<String> listOfPronitesDate = [];
  List<String> listOfTime = [];
  List<String> listOfPronitesTime = [];
  List<String> listOfVenue = [];
  List<String> listOfPronitesVenue = [];
  List<String> listOfImages = [];
  List<String> listOfRuleBook = [];
  List<String> listOfPronitesImages = [];

  // Future<void> fetchingData(String s,Map<String, List<String>> EventsMap) async {
  //   ref.child(s).onValue.listen((DatabaseEvent event) {
  //     event.snapshot.children.forEach((element) {
  //       print(element.child('title').value.toString());
  //       musicEventsMap.addAll({
  //         element.child('title').value.toString(): [
  //           element.child('description').value.toString(),
  //           element.child('date').value.toString(),
  //           element.child('location').value.toString(),
  //           element.child('time').value.toString(),
  //         ]
  //       });
  //       // musicEventsMap.add({element.child('title').value.toString(): []});
  //     });
  //
  //
  //     for (int i = 0; i < musicEventsMap.length; i++) {
  //       list.add(musicEventsMap.keys.elementAt(i));
  //       print(list);
  //     }
  //   });
  //     // events.addAll(event.snapshot.children.iterator.current);
  //     // for (int i = 0; i < event.snapshot.children.length; i++) {
  //     //   // events.add(event.snapshot.children.toList().elementAt(i).value);
  //     // }
  //     // if (kDebugMode) {
  //     //   print(data[0]);
  //     // }
  // }
  // final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  // void fetchingData(String s,Map<String, List<String>> EventsMap){
  //
  //   List<String> list=[];
  //   ref.child(s).onValue.listen((DatabaseEvent event) {
  //     event.snapshot.children.forEach((element) {
  //       // print(element.child('title').value.toString());
  //       EventsMap.addAll({
  //         element.child('title').value.toString(): [
  //           element.child('description').value.toString(),
  //           element.child('date').value.toString(),
  //           element.child('location').value.toString(),
  //           element.child('time').value.toString(),
  //           element.child('imageUrl').value.toString(),
  //         ]
  //       });
  //
  //     });
  //
  //   });
  //
  // }

  final GlobalKey _listKey = GlobalKey();
  @override

    // TODO: implement initState
    void initState() {
    super.initState();
    for (int i = 0; i < artisitsEventsMap.length; i++) {
      listOfPronitesEvents.add(artisitsEventsMap.keys.elementAt(i));
      listOfPronitesDescription.add(artisitsEventsMap.entries.elementAt(i).value[0]);
      listOfPronitesDate.add(artisitsEventsMap.entries.elementAt(i).value[1]);
      listOfPronitesVenue.add(artisitsEventsMap.entries.elementAt(i).value[2]);
      listOfPronitesTime.add(artisitsEventsMap.entries.elementAt(i).value[3]);
      listOfPronitesImages.add(
          artisitsEventsMap.entries.elementAt(i).value[4]);

      // print(listOfImages);
    }
    // count=listOfPronitesImages.length;


  }



  void _buttonInActive() {
    for (int i = 0; i < 12; i++) {
      pressed[i] = false;
    }
  }

  // static RectTween _createRectTween(Rect begin, Rect end) {
  //   return MaterialRectCenterArcTween(begin: begin, end: end);
  // }

  Widget _buildTile(String eventN, String event,String eventDescription,String eventDate,String eventVenue,String eventTime,String image, String ruleBook) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => DetailsScreen(
                    eventRuleBook: ruleBook,
                    eventImage: image,
                    eventDescription: eventDescription,
                        eventDate: eventDate,
                        eventVenue: eventVenue,
                        eventTime: eventTime,
                        eventName: eventN,
                        eventNo: 1,
                      )));
        },
        child: Column(
          // children: AnimationConfiguration.toStaggeredList(
          //   childAnimationBuilder: (widget) => SlideAnimation(
          //   horizontalOffset: 1000.0,
          //   verticalOffset: 100,
          //   child: ScaleAnimation(
          //     // horizontalOffset: 100.0,
          //     // duration: Duration(milliseconds: 300),
          //     child: widget,
          //   ),
          // ), children: [
          //   Padding(
          //     padding: const EdgeInsets.only(
          //         left: 21.0, right: 8, top: 1, bottom: 20),
          //     child: Container(
          //       alignment: Alignment.topLeft,
          //       child: Text(
          //         eventN,
          //         style: const TextStyle(
          //           color: Colors.white,
          //           fontSize: 22,
          //           fontFamily: 'Kojiro_tpgugz',
          //         ),
          //         // textAlign: TextAlign.left,
          //       ),
          //     ),
          //   ),
          //   Hero(
          //     // createRectTween: _createRectTween(),
          //     tag: "photo+$image",
          //     child: Container(
          //       // height: height / 4,
          //       alignment: Alignment.topLeft,
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(20),
          //         // child: Image.asset(
          //         //   'assets/images/$image'
          //         //       '.webp',
          //         // ),
          //         child: FadeInImage(
          //           fit: BoxFit.contain,
          //           placeholderFit: BoxFit.contain,
          //
          //           placeholder: AssetImage('assets/images/loader'
          //               '.gif'),
          //           image: AssetImage('assets/images/$image'
          //               '.webp'),
          //         ),
          //
          //       ),
          //     ),
          //   ),
          // ], ),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 8, top: 0, bottom: 5),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  eventN,
                  style:  TextStyle(
                    color: Colors.white,
                    fontSize: width/14,
                    fontFamily: 'Kojiro_tpgugz',
                    letterSpacing: 1.4,
                  ),
                  // textAlign: TextAlign.left,
                ),
              ),
            ),
            Hero(
              // createRectTween: _createRectTween(),
              tag: "photo+$image",
              child: Container(
                // height: height / 4,
                alignment: Alignment.topLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  //
                  // child: FadeInImage(
                  //   fit: BoxFit.contain,
                  //   placeholderFit: BoxFit.contain,
                  //   placeholder: AssetImage('assets/images/loader'
                  //       '.gif'),
                  //   image: AssetImage('assets/images/$image'
                  //       '.webp'),
                  // ),
                  child: FadeInImage.assetNetwork(
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                          'assets/images/error.png');
                    },
                    placeholder: 'assets/images/loader'
                        '.gif',
                    image: 'https://d34bifzzrx7azc.cloudfront.net/event-images/$image.webp'

                    ,
                  ),


                ),
              ),
            ),
            SizedBox(
              height: height/25,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTabTile(
      String s, int i, Map<String, List<String>> EventsMap, int milli,) {
    List<String> list=[];
    List<String> listD=[];
    List<String> listDa=[];
    List<String> listT=[];
    List<String> listV=[];
    List<String> listI=[];
    List<String> listR=[];
    // ref.child(s).onValue.listen((DatabaseEvent event) {
    //   event.snapshot.children.forEach((element) {
    //     print(element.child('title').value.toString());
    //     EventsMap.addAll({
    //       element.child('title').value.toString(): [
    //         element.child('description').value.toString(),
    //         element.child('date').value.toString(),
    //         element.child('location').value.toString(),
    //         element.child('time').value.toString(),
    //
    //       ]
    //     });
    //     // musicEventsMap.add({element.child('title').value.toString(): []});
    //   });
    //
    //
    //
    // });


    // List<String> list = [];
    // for (int i = 0; i < EventsMap.length; i++) {
    //   list.add(EventsMap.keys.elementAt(i));
    // }
    // print(list);

    return ShowUpAnimation(
      delayStart: Duration(milliseconds: milli),
      animationDuration: Duration(milliseconds: milli),
      curve: Curves.bounceIn,
      direction: Direction.horizontal,
      offset: 0.5,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: pressed[i] ? kTabBarActiveColor : kTabBarColor),
            child: Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _buttonInActive();
                    if(musicEventsMap.isEmpty){
                      isloading=true;
                    }
                    for (int i = 0; i < EventsMap.length; i++) {
                      list.add(EventsMap.keys.elementAt(i));
                      listD.add(EventsMap.entries.elementAt(i).value[0]);
                      listDa.add(EventsMap.entries.elementAt(i).value[1]);
                      listV.add(EventsMap.entries.elementAt(i).value[2]);
                      listT.add(EventsMap.entries.elementAt(i).value[3]);
                      listI.add(EventsMap.entries.elementAt(i).value[4]);
                      listR.add(EventsMap.entries.elementAt(i).value[5]);


                    }
                    listOfEvents.clear();
                    listOfDescription.clear();
                    listOfDate.clear();
                    listOfVenue.clear();
                    listOfTime.clear();
                    listOfImages.clear();
                    listOfRuleBook.clear();
                    pressed[i] = true;


                    listOfEvents = list;
                    listOfDescription=listD;
                    listOfDate=listDa;
                    listOfVenue=listV;
                    listOfTime=listT;
                    listOfImages=listI;
                    listOfRuleBook=listR;
                    count_1 = listOfEvents.length;

                  });
                },
                child: Text(
                  s,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // final Tween<Offset> _offset = Tween(begin: Offset(100, 0), end: Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // for (int i = 0; i < artisitsEventsMap.length; i++) {
    //
    //   listOfPronitesEvents.add(artisitsEventsMap.keys.elementAt(i));
    //   listOfPronitesDescription.add(artisitsEventsMap.entries.elementAt(i).value[0]);
    //   listOfPronitesDate.add(artisitsEventsMap.entries.elementAt(i).value[1]);
    //   listOfPronitesVenue.add(artisitsEventsMap.entries.elementAt(i).value[2]);
    //   listOfPronitesTime.add(artisitsEventsMap.entries.elementAt(i).value[3]);
    //   listOfPronitesImages.add(
    //       artisitsEventsMap.entries.elementAt(i).value[4]);
    //
    //   // print(listOfImages);
    // }

    // print(musicEventsMap);

    count=listOfPronitesImages.length;

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage('assets/images/splash/noise.gif'),
            fit: BoxFit.cover,
          ),
        ),
        height: height * .89,
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(

                child: Container(
                  alignment: Alignment.center,

                  child: ShowUpAnimation(
                    delayStart: Duration(milliseconds: 400),
                    animationDuration: Duration(milliseconds: 400),
                    curve: Curves.bounceIn,
                    direction: Direction.horizontal,
                    offset: 0.5,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 50),
                      child: Image.asset(
                        'assets/images/viva_name.webp',
                      ),
                    ),
                  ),
                ),

              ),
            ];
          },
          body: Container(
            // color: Colors.blue,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ShowUpAnimation(
                          delayStart: Duration(milliseconds: 600),
                          animationDuration: Duration(milliseconds: 600),
                          curve: Curves.bounceIn,
                          direction: Direction.horizontal,
                          offset: 0.5,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 40,
                                // width: width / 4.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: pressed[0]
                                        ? kTabBarActiveColor
                                        : kTabBarColor),
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _buttonInActive();
                                        pressed[0] = true;
                                        listOfPronitesImages.clear();
                                        listOfPronitesEvents.clear();
                                        listOfPronitesDescription.clear();
                                        listOfPronitesDate.clear();
                                        listOfPronitesVenue.clear();
                                        listOfPronitesTime.clear();
                                        for (int i = 0; i < artisitsEventsMap.length; i++) {
                                          listOfPronitesEvents.add(artisitsEventsMap.keys.elementAt(i));
                                          listOfPronitesDescription.add(artisitsEventsMap.entries.elementAt(i).value[0]);
                                          listOfPronitesDate.add(artisitsEventsMap.entries.elementAt(i).value[1]);
                                          listOfPronitesVenue.add(artisitsEventsMap.entries.elementAt(i).value[2]);
                                          listOfPronitesTime.add(artisitsEventsMap.entries.elementAt(i).value[3]);
                                          listOfPronitesImages.add(
                                              artisitsEventsMap.entries.elementAt(i).value[4]);

                                          // print(listOfImages);
                                        }
                                        count = listOfPronitesImages.length;

                                      });
                                    },
                                    child: Text(
                                      tabText[0],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),


                        Flexible(
                          fit: FlexFit.loose,
                          child:
                              _buildTabTile(tabText[1], 1, musicEventsMap, 800),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child:
                              _buildTabTile(tabText[2], 2, danceEventsMap, 900),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child:
                              _buildTabTile(tabText[3], 3, aavegEventsMap, 1000),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child:
                              _buildTabTile(tabText[4], 4, fashionEventsMap, 1000),
                        ),Flexible(
                          fit: FlexFit.loose,
                          child:
                              _buildTabTile(tabText[5], 5, imaginationEventsMap, 1000),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child:
                              _buildTabTile(tabText[6], 6, lcEventsMap, 1000),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child:
                              _buildTabTile(tabText[7], 7, mediaEventsMap, 1000),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child:
                              _buildTabTile(tabText[8], 8, quizzingaEventsMap, 1000),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child:
                              _buildTabTile(tabText[9], 9, renditionEventsMap, 1000),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child:
                              _buildTabTile(tabText[10], 10, sankalpEventsMap, 1000),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child:
                              _buildTabTile(tabText[11], 11, vignetteEventsMap, 1000),
                        ),


                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: ShowUpAnimation(
                    delayStart: Duration(milliseconds: 1100),
                    animationDuration: Duration(milliseconds: 1100),
                    curve: Curves.bounceIn,
                    direction: Direction.horizontal,
                    offset: 0.5,
                    child: pressed[0]
                        ? DismissibleCarouselViewPager(
                            viewportFraction: .9,
                            besidePageScale: .95,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                // borderRadius: BorderRadius.circular(10),

                                // child: FadeInImage(
                                //   placeholder: AssetImage('assets/images/loader'
                                //       '.gif'),
                                //   image: AssetImage('assets/images/${listOfPronitesImages[index]}'
                                //       '.webp'),
                                // ),
                                child: FadeInImage.assetNetwork(
                                  imageErrorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                        'assets/images/error.png');
                                  },
                                  placeholder: 'assets/images/loader'
                                      '.gif',
                                  image: 'https://d34bifzzrx7azc.cloudfront.net/event-images/${listOfPronitesImages[index]}.webp'

                                  ,
                                ),

                              );
                            },
                            itemCount: count,
                          )
                        :
                     ListView.builder(
                            // primary: true,

                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.all(8),
                            // shrinkWrap: true,
                            key: _listKey,
                            itemCount: count_1,
                            itemBuilder: (BuildContext context, int index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration:
                                    Duration(milliseconds: 40 + (index * 100)),
                                child: SlideAnimation(
                                  verticalOffset: 100,
                                  horizontalOffset: 1000,
                                  // curve: Curves.easeInOut,
                                  // delay: Duration(milliseconds: 1000),
                                  // duration: const Duration(milliseconds: 1000),
                                  child: _buildTile(listOfEvents[index],
                                      pressed[0] ? "${tabText[index]}/" : "",listOfDescription[index],listOfDate[index],listOfVenue[index],listOfTime[index],listOfImages[index],listOfRuleBook[index]),
                                ),
                              );
                            },
                          ),)
                  ),

              ],
            ),
          ),
        ),
      ),
      extendBody: false,
    );

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
