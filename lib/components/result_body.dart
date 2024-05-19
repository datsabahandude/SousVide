import 'package:flutter/material.dart';

class ResultBody extends StatelessWidget {
  const ResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 700),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/cookres1.png'),
              Image.asset('assets/images/cookres2.png'),
              Image.asset('assets/images/cookres3.png'),
            ],
          ),
        ),
      ),
    );
  }
}
