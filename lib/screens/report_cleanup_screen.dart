import 'dart:io';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/models/cleanup_report.dart';

class ReportCleanupScreen extends StatefulWidget {
  const ReportCleanupScreen({super.key});

  @override
  State<ReportCleanupScreen> createState() => _ReportCleanupScreenState();
}

class _ReportCleanupScreenState extends State<ReportCleanupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  void _submitReport() {
    if (_formKey.currentState!.validate() && _image != null) {
      final report = CleanupReport(
        description: _descriptionController.text,
        image: _image!,
        timestamp: DateTime.now(),
      );

      // Log the report details to the console
      developer.log(
        'New Cleanup Report Submitted',
        name: 'cleantunisia.report',
        level: 800, // INFO
        error: {
          'description': report.description,
          'image_path': report.image.path,
          'timestamp': report.timestamp.toIso8601String(),
        },
      );

      // Navigate back and show a confirmation
      context.go('/home');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cleanup reported successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields and add a photo.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report a Cleanup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'e.g., Plastic bottles and bags on the beach.',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              Center(
                child: _image == null
                    ? const Text('No image selected.')
                    : Image.file(
                        File(_image!.path),
                        height: 200,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.camera_alt),
                label: const Text('Take a Picture'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitReport,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Submit Report'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
