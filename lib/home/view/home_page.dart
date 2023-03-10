import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:how_much/home/view/datail_page.dart';

class SalaryInfos {
  SalaryInfos(double amountValue, List<CountryDetail> countryDetail) {
    this.amountValue = amountValue;
    this.countryDetail = countryDetail;
  }
  //SalaryInfos(this.countryDetail, this.amountValue);
  double? amountValue;
  List<CountryDetail>? countryDetail;
}

class CountryDetail {
  final String country;
  final String result;

  const CountryDetail({required this.country, required this.result});

  factory CountryDetail.fromJson(Map<String, dynamic> json) {
    return CountryDetail(
      country: json['country'] as String,
      result: json['result'] as String,
    );
  }
}

class MainForm extends StatefulWidget {
  const MainForm({super.key});

  @override
  State<MainForm> createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  final _formKey = GlobalKey<FormState>();
  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter(
    locale: 'BRL',
    decimalDigits: 2,
    symbol: r'R$ ',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Good morning, beautiful proletariat!')),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                inputFormatters: <TextInputFormatter>[
                  _formatter,
                ],
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      double value =
                          _formatter.getUnformattedValue().toDouble();
                      //TODO: Try named route approach (https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            // salaryInfos: SalaryInfos(amountValue: value),
                            salaryInfos: SalaryInfos(value, List.empty()),
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Do the magic'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainForm();
  }
}
