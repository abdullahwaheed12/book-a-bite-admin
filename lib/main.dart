import 'package:admin_bite/controllers/configurations.dart';
import 'package:admin_bite/controllers/general_controller.dart';
import 'package:admin_bite/controllers/login_controller.dart';
import 'package:admin_bite/login_signup/welcomeScreen.dart';
import 'package:admin_bite/pages/404/error_page.dart';
import 'package:admin_bite/routing/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/style.dart';
import 'controllers/menu_controller.dart';
import 'controllers/navigation_controller.dart';
import 'layout.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  // Get.put(GeneralController());
  // // log(message.notification.title.toString());
  // // if (message.data['channel'] != null) {
  // //   String route = message.data['route'];
  // //   log('route check ' + route.toString());
  // //   channelName = message.data['channel'];
  // //   Get.find<AppController>().updateAgoraToken(message.data['channel_token']);
  // //   log('FromNotiToken-->>${message.data['channel_token']}');
  // // }
  // LocalNotificationService.display(message);
  // log(message.data.toString());
}
final configurations = Configurations();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: configurations.apiKey,
          appId: configurations.appId,
          messagingSenderId: configurations.messagingSenderId,
          projectId: configurations.projectId));
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  setUrlStrategy(PathUrlStrategy());
  Get.put(MenuController());
  Get.put(NavigationController());
  Get.put(LoginLogic());
  Get.put(GeneralController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const InitClass(),
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => PageNotFound(),
        transition: Transition.fadeIn,
      ),
      getPages: [
        GetPage(name: RootRoute, page: () => SiteLayout()),
        GetPage(name: AuthenticationPageRoute, page: () => WelcomePage()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Book-a-Admin',
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme:
            GoogleFonts.mulishTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.black,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primaryColor: const Color(0xffFFA500),
      ),
    );
  }
}

class InitClass extends StatefulWidget {
  const InitClass({Key? key}) : super(key: key);

  @override
  _InitClassState createState() => _InitClassState();
}

class _InitClassState extends State<InitClass> {
  @override
  Widget build(BuildContext context) {
    return WelcomePage();
  }
}
