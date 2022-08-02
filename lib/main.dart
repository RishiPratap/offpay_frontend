import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:offpay_version_one/dashboard_screen.dart';
import 'package:offpay_version_one/login.dart';
import 'package:offpay_version_one/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:permission_handler/permission_handler.dart';

var email;

Future<void> main()  async{
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =  'pk_test_51L71QhSBr13sflj5t6u1AbrzGcCgzd9Av3MLxv9sHN1b7LgWiqXHrqOuYiKlhGZyT76zD11TSqUzbgANxpZ7w2yn00wf6xSGMC';
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //prefs.clear();
  var status = await Permission.sms.status;
  print(status);
  //await Permission.sms.request();
  Map<Permission, PermissionStatus> statuses = await [
    Permission.sms,
    Permission.camera,
  ].request();
  print(statuses);
  email = prefs.getString('email');
  print(email);
  runApp(const MyApp());
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        title: "OFFPAY",
        home: Scaffold(
            body:SplashScreenView(
                navigateRoute: email == null ? const OnboardingScreen():const DashboardScreen(),
                duration: 5000,
                imageSize:500,
                imageSrc: "assets/images/info.png",
                backgroundColor: Colors.white,
                textType: TextType.ColorizeAnimationText,
                text: "OFFPAY",
                textStyle: const TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'Mulish'
                ),
                colors: const [
                  Colors.purple,
                  Colors.blue,
                  Colors.yellow,
                  Colors.red,
                ],
                pageRouteTransition: PageRouteTransition.SlideTransition
            )
        )
    );
  }
}