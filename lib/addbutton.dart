
import 'package:flutter/material.dart';

class Addbutton extends StatelessWidget {
  void Function() addBalance;
  bool light_mode;
   Addbutton({super.key, required this.addBalance,required this.light_mode});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 1,
      child: ElevatedButton(onPressed: addBalance,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[900],
              minimumSize: const Size(double.infinity,double.infinity)

          ),
          child:Text('Add Money',
          style: TextStyle(
            color: light_mode?Colors.white:Colors.black,
                fontSize: 20
          ),)
      ),
    );
  }
}
