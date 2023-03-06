import 'package:flutter/material.dart';
import 'package:how_much/home/view/home_page.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({required this.salaryInfos, super.key});

  final SalaryInfos salaryInfos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('so..'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(salaryInfos.amountValue.toString()),
      ),
    );
  }
}
