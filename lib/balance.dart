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
          const Text('Bank Balance',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26
          ),
          ),
          Text('\$ ${NumberFormat.simpleCurrency(name: '').format(balance)}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
          )
        ],
      ),
    );
  }
}
