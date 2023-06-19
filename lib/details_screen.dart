// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vivacity_2k23/FetchedDetails.dart';
import 'package:vivacity_2k23/eventDetails.dart';
// import 'package:flutter_tutorial/constants.dart';
import 'constants.dart';
import 'package:show_up_animation/show_up_animation.dart';

class DetailsScreen extends StatefulWidget {


   DetailsScreen({
    super.key,

    required this.eventName,
     required this.eventDescription,
     required this.eventDate,
     required this.eventTime,
     required this.eventVenue,
     required this.eventImage,
     required this.eventRuleBook,

    required this.eventNo,
  });
  // final EventsDetails details;
  final String eventName;
  final String eventDescription;
   final String eventTime;
   final String eventDate;
   final String eventVenue;
   final String eventImage;
   final String eventRuleBook;
  // final String eventReceived;
  final int eventNo;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late double width;
  var kOnCardClickColor_1 = Colors.black54;
  var kOnCardClickColor_2 = Colors.black54;
  var kOnCardClickColor_3 = Colors.black54;
  Color kOnCardClickTextColor_1 = Colors.grey;
  Color kOnCardClickTextColor_2 = Colors.grey;
  Color kOnCardClickTextColor_3 = Colors.grey;
  
  _launchURL(String url) async {
    // const url = 'https://flutter.io';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: ShowUpAnimation(
        delayStart: Duration(milliseconds: 1200),
        animationDuration: Duration(milliseconds: 1200),
        curve: Curves.bounceIn,
        direction: Direction.horizontal,
        offset: 0.5,
        child: BottomAppBar(
          elevation: 0,
          color: Color(0xff2e2b5a),
          shape: CircularNotchedRectangle(),
          child: SizedBox(
              height: 65,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff781df1))),
                      onPressed: () async {
                        final Uri rulebookLaunchUri = Uri(
                          scheme: 'https',
                          path: 'd34bifzzrx7azc.cloudfront.net/rulebooks/${widget.eventRuleBook}.pdf',
                        );
                          // _launchURL("https://d34bifzzrx7azc.cloudfront.net/rulebooks/${widget.eventRuleBook}.pdf");

                        await launchUrl(
                          mode: LaunchMode.externalApplication,
                          rulebookLaunchUri

                        );
                      },
                      child: Text(
                        'RULEBOOK',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2,
                          fontSize: 20,
                          fontFamily: 'Kojiro_tpgugz',
                        ),
                      ),
                    ),
                    // FloatingActionButton(
                    //   onPressed: () {},
                    //   child: Container(
                    //     height: 40,
                    //     width: 150,
                    //     decoration: BoxDecoration(
                    //       color: Color(0xff781df1),
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: Center(
                    //         child: Text(
                    //       'Order a concert',
                    //       style: TextStyle(color: Colors.white),
                    //     )),
                    //   ),
                    // ),
                  ],
                ),
              )),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash/noise.gif'),
            fit: BoxFit.cover,
          ),
        ),

        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag:
                    "photo+${widget.eventImage}",
                child: SizedBox(
                    width: width,
                    height: height / 3,
                    // child: Image.asset(
                    //     'assets/images/${widget.eventImage}.webp')
                  // child: Image.network(
                  //     'https://d34bifzzrx7azc.cloudfront.net/event-images/${widget.eventImage}.webp'),
                  // child: Image.network(
                  //   'https://d34bifzzrx7azc.cloudfront.net/event-images/${widget.eventImage}.webp',
                  //   fit: BoxFit.fill,
                  //   loadingBuilder: (BuildContext context, Widget child,
                  //       ImageChunkEvent? loadingProgress) {
                  //     if (loadingProgress == null) return child;
                  //     return Center(
                  //       child: CircularProgressIndicator(
                  //
                  //         // value: loadingProgress.expectedTotalBytes != null
                  //         //     ? loadingProgress.cumulativeBytesLoaded /
                  //         //     loadingProgress.expectedTotalBytes!
                  //         //     : null,
                  //       ),
                  //     );
                  //   },
                  // ),

                  child: FadeInImage.assetNetwork(
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                          'assets/images/error.png');
                    },
                    placeholder: 'assets/images/loader'
                        '.gif',
                    image: 'https://d34bifzzrx7azc.cloudfront.net/event-images/${widget.eventImage}.webp'

                    ,
                  ),

          ),

                // child: FadeInImage.assetNetwork(
                  //   placeholder: 'assets/images/loader'
                  //       '.gif',
                  //   image: 'https://d34bifzzrx7azc.cloudfront.net/event-images/${widget.eventImage}.webp'
                  //       ,
                  // ),

              ),
              Flexible(
                child: ShowUpAnimation(
                    delayStart: Duration(milliseconds: 400),
                    animationDuration: Duration(milliseconds: 400),
                    curve: Curves.bounceIn,
                    direction: Direction.horizontal,
                    offset: 0.5,
                    child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          widget.eventName.toUpperCase(),
                          style: TextStyle(
                              fontSize: width/16,
                              fontFamily: 'Kojiro_tpgugz',
                              color: Colors.white,
                              letterSpacing: 2.2,
                              fontWeight: FontWeight.bold),
                        ))),
              ),
              Flexible(
                child: ShowUpAnimation(
                    delayStart: Duration(milliseconds: 600),
                    animationDuration: Duration(milliseconds: 600),
                    curve: Curves.bounceIn,
                    direction: Direction.horizontal,
                    offset: 0.5,
                    child: Container(
                      alignment: Alignment.topCenter,
                      // height: height / 7,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(10),
                        // border: Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                        child: Row(
                          // textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            // Text("Event")
                            Flexible(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    kOnCardClickColor_1 = Colors.black;
                                    kOnCardClickColor_2 = Colors.black54;
                                    kOnCardClickColor_3 = Colors.black54;
                                    kOnCardClickTextColor_1 = Colors.black;
                                    kOnCardClickTextColor_2 = Colors.grey;
                                    kOnCardClickTextColor_3 = Colors.grey;
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.eventDate,
                                      style: TextStyle(
                                          color: kOnCardClickColor_1,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'Date',
                                      style:
                                          TextStyle(color: Colors.grey, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                              child: VerticalDivider(
                                color: Colors.black54,
                                thickness: 1,
                                width: 20,
                              ),
                            ),
                            Flexible(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    kOnCardClickColor_1 = Colors.black54;
                                    kOnCardClickColor_2 = Colors.black;
                                    kOnCardClickColor_3 = Colors.black54;
                                    kOnCardClickTextColor_1 = Colors.grey;
                                    kOnCardClickTextColor_2 = Colors.black;
                                    kOnCardClickTextColor_3 = Colors.grey;
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.eventVenue,
                                      style: TextStyle(
                                          color: kOnCardClickTextColor_2,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'Venue',
                                      style: TextStyle(
                                          color: kOnCardClickTextColor_2, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                              child: VerticalDivider(
                                color: Colors.black54,
                                thickness: 1,
                                width: 20,
                              ),
                            ),
                            Flexible(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    kOnCardClickColor_1 = Colors.black54;
                                    kOnCardClickColor_2 = Colors.black54;
                                    kOnCardClickColor_3 = Colors.black;
                                    kOnCardClickTextColor_1 = Colors.grey;
                                    kOnCardClickTextColor_2 = Colors.grey;
                                    kOnCardClickTextColor_3 = Colors.black;
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.eventTime,
                                      style: TextStyle(
                                          color: kOnCardClickColor_3,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'Time',
                                      style: TextStyle(
                                          color: kOnCardClickTextColor_3, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
              Flexible(
                child: ShowUpAnimation(
                    delayStart: Duration(milliseconds: 800),
                    animationDuration: Duration(milliseconds: 800),
                    curve: Curves.bounceIn,
                    direction: Direction.horizontal,
                    offset: 0.5,
                    child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: width/16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                widget.eventDescription,
                                style: TextStyle(
                                  fontSize: width/18,
                                  fontFamily: 'Darker',
                                  color: Colors.white,
                                  letterSpacing: .5
                                ),
                              ),
                            ),
                          ],
                        ))),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
