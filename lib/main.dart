import 'package:billionaire_app/addbutton.dart';
import 'package:billionaire_app/balance.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balance=0;
  bool light_mode=false;
  @override
  void initState() {
    // TODO: implement initState
    loadbalance();
    super.initState();

  }
  void loadbalance() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final SharedPreferences light = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.

// Save an integer value to 'counter' key.
    setState(() {
    balance= prefs.getDouble('balance')??0;
    light_mode=light.getBool('mode')??false;
    });

  }

  void addbalance() async{
    setState(() {
      balance=balance+500;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.
    await prefs.setDouble('balance', balance);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: light_mode? ThemeData.dark():ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(
          title: const Text("Billionaire App!",
            style: TextStyle(
                fontFamily: "poppins"
            ),),
          centerTitle: true,
          backgroundColor: light_mode?Colors.black: Colors.white,
          leading: GestureDetector(
            onTap: () async{
              setState(() {
                light_mode=!light_mode;

              });
              final SharedPreferences light = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.
              await light.setBool('mode', light_mode);
            },
              child: light_mode?Icon(Icons.nightlight_outlined) : Icon(Icons.nightlight)
          ),
        ),
        body: Container(

          padding: const EdgeInsets.all(15),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Balance(balance: balance),
              Addbutton(addBalance: addbalance,light_mode: light_mode)

            ],
          )
          ),
        ),
      );


  }
}