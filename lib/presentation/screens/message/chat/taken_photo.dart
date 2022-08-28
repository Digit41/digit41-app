import 'package:flutter/material.dart';

class TakenPhoto extends StatelessWidget {
  const TakenPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network(
        'https://s6.uupload.ir/files/image_klio.png',
        height: double.infinity,
        fit: BoxFit.fitHeight,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.white,
              child: const Icon(Icons.clear),
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(Icons.check),
          ),
        ],
      ),
    );
  }
}
