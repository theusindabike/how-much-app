import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountValue {
  const AmountValue({required this.value});

  final double value;
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
      appBar: AppBar(title: const Text('good morning, beautiful proletariat!')),
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
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String value =
                          _formatter.getUnformattedValue().toString();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data: $value')),
                      );
                    }
                  },
                  child: const Text('Submit'),
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

class ListView extends StatelessWidget {
  const ListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Calculate'),
        onPressed: () {},
      ),
    );
  }
}
