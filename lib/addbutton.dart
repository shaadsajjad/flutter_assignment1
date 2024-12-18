import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Addbutton extends StatelessWidget {
  void Function() addBalance;
   Addbutton({super.key, required this.addBalance});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 1,
      child: ElevatedButton(onPressed: addBalance,
          child:Text('Add Money'),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[900],
              minimumSize: Size(double.infinity,double.infinity)
          )
      ),
    );
  }
}
