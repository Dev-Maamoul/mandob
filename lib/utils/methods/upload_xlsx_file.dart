import 'dart:io';

import 'package:file_picker/file_picker.dart';

Future<void> uploadXlsxFile() async {
  try {
    // Pick an xlsx file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);

      // Create a form data object

      // Upload file
    } else {
      print("No file selected.");
    }
  } catch (e) {
    print("Error uploading file: $e");
  }
}
