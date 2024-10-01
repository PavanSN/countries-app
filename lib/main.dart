import 'package:credit_saison/feature/home/view/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CreditSaison());
}

class CreditSaison extends StatelessWidget {
  const CreditSaison({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homescreen(),
    );
  }
}
