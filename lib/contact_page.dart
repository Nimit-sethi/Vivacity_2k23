import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // String sagarNumber='+91 7727839857';
  // String piyushNumber='+91 8302465700';
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'vivacity@lnmiit.ac.in',
  );

  final Uri websiteLaunchUri = Uri(
      scheme: 'https',
      path: 'vivacity.lnmiit.ac.in'
  );

  final Uri instagramLaunchUri = Uri(
      scheme: 'https',
      path: 'instagram.com/vivacity_lnmiit'
  );

  final Uri youtubeLaunchUri = Uri(
      scheme: 'https',
      path: 'youtube.com/@VivacityLNMIIT'
  );

  final Uri linkedinLaunchUri = Uri(
    scheme: 'https',
    path: 'linkedin.com/company/vivacity-lnmiit/mycompany',
  );

  final Uri phone1LaunchUri = Uri(
      scheme: 'tel',
      path: '+917727839857'
  );

  final Uri phone2LaunchUri = Uri(
      scheme: 'tel',
      path: '+918302465700'
  );

  final Uri mapLaunchUri = Uri(
      scheme: 'http',
      path: 'google.com/maps/place/The+LNM+Institute+of+Information+Technology/@26.9362934,75.9213004,17z/data=!3m1!4b1!4m5!3m4!1s0x396dba21e8a1d1c9:0x5ab565cce4d44c2b!8m2!3d26.9362886!4d75.9234891'
  );


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff030718),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage('assets/images/splash/noise.gif'),
              fit: BoxFit.cover,
            ),
          ),

        ),
        backgroundColor: const Color(0xff030718),
        title: const Center(
          child: Text(
            'Contact Us ',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage('assets/images/splash/noise.gif'),
            fit: BoxFit.cover,
          ),
        ),

        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SizedBox(
            height: screenHeight,
            child: AnimationLimiter(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: AnimationConfiguration.toStaggeredList(
                    duration: Duration(milliseconds: 800),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 120.0,
                      child: ScaleAnimation(
                        // horizontalOffset: 100.0,
                        // duration: Duration(milliseconds: 300),
                        child: widget,
                      ),
                    ),
                    children: [
                      SizedBox(
                        // color: Colors.white,
                        height: screenHeight / 20,
                        width: screenWidth,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // child: const Text(''),
                                height: screenHeight / 7,
                                width: screenWidth / 3,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(

                                      image: AssetImage('assets/images/splash/sagar.jpg'),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,

// borderRadius: BorderRadius.all(Radius.circular(100))
                                ),
                              ),
                              Text(
                                'Sagar Sheoran',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth/20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  launchUrl(phone1LaunchUri);
                                },
                                child:  Text(
                                  '+91 7727839857',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth/20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: screenWidth / 13,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // child: const Text(''),
                                height: screenHeight / 7,
                                width: screenWidth / 3,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/splash/piyush.jpg'),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
// borderRadius: BorderRadius.all(Radius.circular(100))
                                ),
                              ),
                               Text(
                                'Piyush Jhawar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth/20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  launchUrl(phone2LaunchUri);
                                },
                                child:  Text(
                                  '+91 8302465700',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth/20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenHeight / 10,
                        width: screenWidth,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                IconButton(
                                  icon: const Icon(Icons.email_outlined),
                                  color: Colors.white,
                                  onPressed: (){
                                    launchUrl(emailLaunchUri);
                                  },
                                  iconSize: 28,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    launchUrl(emailLaunchUri);
                                  },
                                  child: const Text(
                                    '   vivacity@lnmiit.ac.in',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight / 300000,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                IconButton(
                                  icon: const Icon(Icons.web_rounded),
                                  onPressed: (){
                                    launchUrl(websiteLaunchUri, mode: LaunchMode.externalApplication);
                                  },
                                  iconSize: 28,
                                  color: Colors.white,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    launchUrl(websiteLaunchUri, mode: LaunchMode.externalApplication);
                                  },
                                  child: const Text(
                                    '   vivacity.lnmiit.ac.in',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight / 75,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){launchUrl(instagramLaunchUri, mode: LaunchMode.externalNonBrowserApplication);}, icon: const FaIcon(FontAwesomeIcons.instagram), color: Colors.pinkAccent, iconSize: 32,),
                          IconButton(onPressed: (){launchUrl(linkedinLaunchUri, mode: LaunchMode.externalNonBrowserApplication);}, icon: const FaIcon(FontAwesomeIcons.linkedin), color: Colors.blueAccent, iconSize: 32,),
                          IconButton(onPressed: (){launchUrl(youtubeLaunchUri, mode: LaunchMode.externalNonBrowserApplication);}, icon: const FaIcon(FontAwesomeIcons.youtube), color: Colors.redAccent, iconSize: 32,),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight/10,
                      ),
                      Container(
                        height: screenHeight / 9,
                        width: screenWidth,
// color: Colors.blue,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: screenWidth / 15,
                            ),
                            const Text('ADDRESS :  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    color: Colors.white),
                                textAlign: TextAlign.left),
                            const Text(
                              'Rupa ki Nangal,\n Post-Sumel, Via, \nJamdoli, Jaipur, \nRajasthan 302031',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.locationDot),
                              color: Colors.white,
                              iconSize: 40,
                              onPressed: () async{
                                String googleUrl = 'https://www.google.com/maps/search/?api=1&query=26.936648,75.923187';
                                String googleUrl2 = 'https://www.google.com/maps/place/The+LNM+Institute+of+Information+Technology/@26.9362934,75.9213004,17z/data=!3m1!4b1!4m5!3m4!1s0x396dba21e8a1d1c9:0x5ab565cce4d44c2b!8m2!3d26.9362886!4d75.9234891';
                                launchUrlString(googleUrl2, mode: LaunchMode.externalNonBrowserApplication);
                              },
                            ),
                            SizedBox(
                              width: screenWidth / 15,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight / 32,
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: screenHeight / 10,
      ),
    );
  }
}


