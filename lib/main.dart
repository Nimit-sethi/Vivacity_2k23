// import 'dart:html';

import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vivacity_2k23/splash.dart';

// import 'package:flutter_tutorial/bottom_bars.dart';
// import 'package:flutter_tutorial/home_screen.dart';
// import 'package:flutter_tutorial/splash.dart';

import 'FetchedDetails.dart';
import 'constants.dart';
import 'eventDetails.dart';
import 'home_screen.dart';
import 'notch_bars.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp= await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseDatabase.instance.setPersistenceEnabled(true);
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  Map<String,List<String>> EventsMap={};
  DatabaseReference ref = FirebaseDatabase.instance.ref('events');


  Future<void> fetchingData(String s,Map<String, List<String>> EventsMap) async {
    artisitsEventsMap.clear();
    List<String> list=[];
    ref.child(s).onValue.listen((DatabaseEvent event) {
      // print(event.snapshot.children.elementAt(2).value);
      if(event.snapshot.children.isNotEmpty) {
        event.snapshot.children.forEach((element) {
          // print(element.children.first.value);
          if(element.children.isNotEmpty) {
            // print(element
            //     .child('rulebook')
            //     .value
            //     .toString());
            EventsMap.addAll({
              element
                  .child('title')
                  .value
                  .toString(): [
                element
                    .child('description')
                    .value
                    .toString(),
                element
                    .child('date')
                    .value
                    .toString(),
                element
                    .child('location')
                    .value
                    .toString(),
                element
                    .child('time')
                    .value
                    .toString(),
                element
                    .child('imageUrl')
                    .value
                    .toString(),
                element
                    .child('rulebook')
                    .value
                    .toString(),
              ]
            });
          }
          // musicEventsMap.add({element.child('title').value.toString(): []});
        });


        // for (int i = 0; i < EventsMap.length; i++) {
        //   list.add(EventsMap.keys.elementAt(i));
        //   print(list);
        // }
      }
    });
    // events.addAll(event.snapshot.children.iterator.current);
    // for (int i = 0; i < event.snapshot.children.length; i++) {
    //   // events.add(event.snapshot.children.toList().elementAt(i).value);
    // }
    // if (kDebugMode) {
    //   print(data[0]);
    // }
  }

  // final ref = FirebaseDatabase.instance.ref('events').child('0');
  /// @param s : Event Category name
  // void fetchingAllData(String s, Map<String, Map<String, String>> EventsMap){
  //
  //   List<String> list=[];
  //   // Map<,String> temp={};
  //   ref.onValue.listen((event) {
  //     // print(event.snapshot.children.elementAt(1).value);
  //
  //     event.snapshot.children.forEach((element) {
  //
  //       // element.
  //       print(element.children.first);
  //       // temp = element.value as Map;
  //       // print("Value  Object: " +  );
  //       // print("Value : " + element.children.single.exists.toString();
  //       // element.children.map((e) => print(e.children.first));
  //
  //
  //       // allEventDetails.addAll(
  //       //     element.key.toString(): [
  //       //
  //       //     ]
  //       // );
  //   });
  //   // ref.child(s).onValue.listen((DatabaseEvent event){
  //
  //       // musicEventsMap.add({element.child('title').value.toString(): []});
  //     // });
  //   //
  //   //   // for (int i = 0; i < EventsMap.length; i++) {
  //   //   //   list.add(EventsMap.keys.elementAt(i));
  //   //   //   print(list);
  //   //   // }
  //   });
  //
  // }




  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);


    fetchingData('music', musicEventsMap);
    fetchingData('dance', danceEventsMap);
    fetchingData('aaveg', aavegEventsMap);
    fetchingData('artists', artisitsEventsMap);
    fetchingData('fashion', fashionEventsMap);
    fetchingData('imagination', imaginationEventsMap);
    fetchingData('lc', lcEventsMap);
    fetchingData('media', mediaEventsMap);
    fetchingData('quizzinga', quizzingaEventsMap);
    fetchingData('rendition', renditionEventsMap);
    fetchingData('sankalp', sankalpEventsMap);
    fetchingData('vignette', vignetteEventsMap);




    // finalEventList=[musicEventsMap,danceEventsMap,aavegEventsMap,artisitsEventsMap,fashionEventsMap,imaginationEventsMap,lcEventsMap,mediaEventsMap,quizzingaEventsMap,renditionEventsMap,sankalpEventsMap,vignetteEventsMap];
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;ent
    // List<EventsDetails> events = [];
    // // events
    // List<String> date = [];
    // // var data;
    // DatabaseReference ref =
    // FirebaseDatabase.instance.ref('events').child('music');
    // ref.onValue.listen((DatabaseEvent event) {
    //   for (var element in event.snapshot.children) {
    //     musicEventsMap.addAll({
    //       element.child('title').value.toString(): [
    //         element.child('description').value.toString(),
    //         element.child('date').value.toString(),
    //         element.child('location').value.toString(),
    //         element.child('time').value.toString(),
    //       ]
    //     });
    //   }
    //   // events.addAll(event.snapshot.children.iterator.current);
    //   // for (int i = 0; i < event.snapshot.children.length; i++) {
    //   //   // events.add(event.snapshot.children.toList().elementAt(i).value);
    //   // }
    //   if (kDebugMode) {
    //     print(musicEventsMap);
    //   }
    // });
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: "Vivacity'23",
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color(0xff030718)

      ),
      home:Splash(),


    );
  }
}
