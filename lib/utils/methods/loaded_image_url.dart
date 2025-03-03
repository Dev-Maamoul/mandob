import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

loadedImageURL({String? imageURL}) async {
  if (imageURL == null) {
    final ByteData data = await rootBundle.load('assets/logo.png');
    return data.buffer.asUint8List();
  }
  final response = await http.get(Uri.parse(imageURL));
  final image = response.bodyBytes;

  return image;
}