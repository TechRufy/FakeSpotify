import 'package:flutter/material.dart';

class TerzaRoute extends StatelessWidget {
  const TerzaRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "La tua Libreria",
        ),
      ),
      body: Center(
        child: Text(
          "libreria",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
