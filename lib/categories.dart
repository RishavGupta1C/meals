import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Your Category'),
      ),
      // For many categories we could use GridView.builder()
      body: GridView(
        // cross axis is horizontal axis
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          Text('1'),
          Text('2'),
          Text('3'),
          Text('4'),
          Text('5'),
          Text('6'),
          Text('7'),
        ],
      ),
    );
  }
}
