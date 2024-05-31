import 'package:flutter/material.dart';
import 'package:sous_v/components/result_body.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Result Page'),
        ),
        body: const ResultBody());
  }
}
