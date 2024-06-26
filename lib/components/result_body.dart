import 'package:flutter/material.dart';

class ResultBody extends StatelessWidget {
  const ResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            width: width * 0.6,
            constraints: const BoxConstraints(maxWidth: 400),
            alignment: const Alignment(-0.25, 0),
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Text(
              'Sous Vide VS Traditional Cooking',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Image.asset('assets/images/cookres1.png'),
          Container(
            padding: const EdgeInsets.all(12),
            width: width * 0.6,
            constraints: const BoxConstraints(maxWidth: 400),
            alignment: const Alignment(-0.25, 0),
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Text(
              'Method A VS Method B',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Image.asset('assets/images/methodSV.jpg'),
          const SizedBox(height: 15),
          DataTable(
            showBottomBorder: true,
            dataRowMaxHeight: double.infinity,
            headingTextStyle: const TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            columns: const <DataColumn>[
              DataColumn(
                label: Text('Method A'),
              ),
              DataColumn(
                label: Text('Method B'),
              ),
            ],
            rows: <DataRow>[
              DataRow(
                cells: [
                  DataCell(
                    SizedBox(
                      width: width * 0.4,
                      child: const Text('A slight gradient in color'),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: width * 0.4,
                      child:
                          const Text('More uniform color from edge to center'),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    SizedBox(
                      width: width * 0.4,
                      child: const Text(
                          'Enhance tenderness due to enzymatic activity at the lower temperature'),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: width * 0.4,
                      child: const Text('Uniformly tender'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
