import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:how_much/home/view/home_page.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatelessWidget {
  const DetailScreen({required this.salaryInfos, super.key});

  final SalaryInfos salaryInfos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('so..'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(salaryInfos.amountValue.toString()),
            Center(
              child: FutureBuilder<CountryDetail>(
                future: fetchCountryDetail(
                  http.Client(),
                  salaryInfos.amountValue ?? 0,
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('An error has occurred!'),
                    );
                  } else if (snapshot.hasData) {
                    return Text(snapshot.data!.result);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<CountryDetail> fetchCountryDetail(
    http.Client http,
    double amountValue,
  ) async {
    final url = 'http://172.17.0.1/brazil/$amountValue';
    final response = await http.get(Uri.parse(url));

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    return CountryDetail.fromJson(jsonResponse);
  }
}
