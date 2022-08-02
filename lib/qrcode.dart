import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

var code;

class Qrcode extends StatelessWidget {

  const Qrcode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "OFFPAY",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            leading:
            IconButton( onPressed: (){
              Navigator.pop(context);
            },icon:const Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
          ),
          body: Center(child:Container(
            child: QrImage(
              data: "123456", //User Id
              version: QrVersions.auto,
              size: 250.0,
            ),
          )),
        )
    );
  }
}