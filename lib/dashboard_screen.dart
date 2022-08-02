import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:offpay_version_one/qrcode.dart';
import 'package:slide_drawer/slide_drawer.dart';
import 'HomePageUI.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  DashboardScreenState createState() {
    return DashboardScreenState();
  }
}
class DashboardScreenState extends State<DashboardScreen>{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        title: "OFFPAY",
      home:Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xFF000046),
          title:const Center(child:Text('offPAY',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Mulish',fontSize: 35.0),)),
          leading: IconButton(
            icon: const Icon(Icons.account_circle_outlined,size: 35.0,),
            // call toggle from SlideDrawer to alternate between open and close
            // when pressed menu button
            onPressed: () {SlideDrawer.of(context)?.toggle();},
          ),
        ),
        body:SlideDrawer(
      items: [
        MenuItem('Home', icon: Icons.home, onTap: (){}),
        MenuItem('Project',icon:Icons.rss_feed, onTap: (){}),
        MenuItem('Favourite',icon: Icons.favorite_border, onTap: (){}),
        MenuItem('Profile',icon: Icons.person_outline, onTap: (){}),
        MenuItem('Setting',icon: Icons.settings, onTap: (){}),
        ],
          brightness: Brightness.dark,
          backgroundGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            colors: [
              Color(0xFF000046),
              Color(0xFF1CB5E0),
            ],
          ),
          child: const HomeUI()
    ),
      ));
  }
}