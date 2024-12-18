import 'package:billionaire_app/addbutton.dart';
import 'package:billionaire_app/balance.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balance=0;
  bool light_mode=true;
  @override
  void initState() {
    // TODO: implement initState
    loadbalance();
    super.initState();

  }
  void loadbalance() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.
    setState(() {
    balance= prefs.getDouble('balance')??0;
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
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(
          title: Text("Billionaire App!",
            style: TextStyle(
                fontFamily: "poppins"
            ),),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Balance(balance: balance),
              Addbutton(addBalance: addbalance)

            ],
          )
          ),
        ),
      );


  }
}