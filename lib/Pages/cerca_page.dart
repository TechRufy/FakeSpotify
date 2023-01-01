import 'package:flutter/material.dart';

class SecondaRoute extends StatelessWidget {
  const SecondaRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Cerca",
        ),
      ),
      body: Center(
        child: Text(
          "Cerca",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
