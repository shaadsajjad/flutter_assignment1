import 'package:flutter/material.dart';
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
        appBar: AppBar(
          title: Text("Billionaire App!"),
          centerTitle: true,
          backgroundColor: Colors.black,
          leading:light_mode? Icon(Icons.nightlight_outlined): Icon(Icons.nightlight),

        ),
        body: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bank Balance'),
                    Text('\$ $balance')
                  ],
                ),
              ),

              Expanded(
                flex: 1,
                child: ElevatedButton(onPressed: addbalance,
                    child:Text('Add Money'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900],
                    minimumSize: Size(double.infinity,double.infinity)
                  )
                ),
              )
            ],
          )
          ),
        ),
      );


  }
}