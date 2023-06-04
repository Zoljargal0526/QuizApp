import 'package:flutter/material.dart';

class IntroductionSheet extends StatelessWidget {
  const IntroductionSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          Expanded(
            child: ListView(children: [
              Container(
                height: 300,
                color: Colors.red,
              ),
              Container(
                height: 300,
                color: Colors.blue,
              ),
              Container(
                height: 300,
                color: Colors.green,
              ),
            ]),
          ),
          ElevatedButton(
            child: const Text('Үргэлжлүүлэх'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
