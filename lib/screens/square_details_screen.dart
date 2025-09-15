import 'package:flutter/material.dart';

class SquareDetailsScreen extends StatelessWidget {
  const SquareDetailsScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Square Details'),
      ),
      body: Center(
        child: Text('Square Details Screen for id: $id'),
      ),
    );
  }
}
