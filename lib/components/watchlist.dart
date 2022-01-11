import 'package:flutter/material.dart';

class Watched extends StatelessWidget {
  const Watched({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watched'),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: const Center(
        child: Text('watched'),
      ),
    );
  }
}
