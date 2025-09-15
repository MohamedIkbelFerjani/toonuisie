import 'package:flutter/material.dart';

class VolunteerListScreen extends StatelessWidget {
  const VolunteerListScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volunteer List'),
      ),
      body: Center(
        child: Text('Volunteer List Screen for id: $id'),
      ),
    );
  }
}
