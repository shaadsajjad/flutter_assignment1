import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Balance extends StatelessWidget {
  double balance;
   Balance({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bank Balance'),
          Text('\$ ${NumberFormat.simpleCurrency(name: '').format(balance)}')
        ],
      ),
    );
  }
}
