import 'package:image_picker/image_picker.dart';

class CleanupReport {
  final String description;
  final XFile image;
  final DateTime timestamp;

  CleanupReport({
    required this.description,
    required this.image,
    required this.timestamp,
  });
}
