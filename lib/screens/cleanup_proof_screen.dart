import 'package:flutter/material.dart';

class CleanupProofScreen extends StatelessWidget {
  const CleanupProofScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cleanup Proof'),
      ),
      body: Center(
        child: Text('Cleanup Proof Screen for id: $id'),
      ),
    );
  }
}
