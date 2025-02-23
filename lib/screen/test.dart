// import 'dart:convert';
// import 'dart:io';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:universal_html/html.dart' as html;
// import 'package:http/http.dart' as http;

// class SaveFile extends StatefulWidget {
//   const SaveFile({super.key});

//   @override
//   State<SaveFile> createState() => _SaveFileState();
// }

// class _SaveFileState extends State<SaveFile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await uploadExcelFile();
//           },
//           child: Text("data"),
//         ),
//       ),
//     );
//   }
// }

// Future<List<int>> uploadExcelFile() async {
//   // اختيار الملف
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowMultiple: false,
//     allowCompression: true,

//     dialogTitle: "The",
//     allowedExtensions: ['xlsx'],
//   );

//   if (result != null) {
//     // الحصول على بيانات الملف
//     PlatformFile file = result.files.first;

//     // تحويل الملف إلى List<int>
//     List<int> fileBytes = file.bytes!.toList();

//     return fileBytes;
//   } else {
//     print('لم يتم اختيار ملف');
//   }
// }

// Future<void> sendToApi(List<int> fileBytes, String fileName) async {
//   var response = await http.put(
//     Uri.parse('http://0.0.0.0:8081/v1/company/upload/driver'),
//     headers: {
//       "authorization":
//           "Bearer MjdhMjViMDY1OWEzMGYzMDJiZTgyMjdhZWIzNDU1Nzg1YThlMWNhMWFjMGNlOWI2ODIxZWU5YTgzMDRkNmUyMGIzOTcwZDIzMmVmMzk5OGM0MTQxMTRiNjIwNGY2N2RkMTZjZWJjNTFmMmU0OWZjMTk0NTVlYzIwYTQzYzNjNmRhM2NiOWZmYjExMjBmNzMxYjM2Y2Y3MmM5NjYyY2VlN2IzOTI2Y2JlOTVmYjAwYjdhOWNkMWU4NTllNGE2ODdjMDhlZTMyOTg3NWY3MDEzZmQzYjU3YzE4NDU3MWFhMWJiZjkyMmQxNzVjNTRmZjk3NTBkNzhhODMyNDhmNDkxNGM4OTg0NWIxN2M2NzkzNjY3ZmMzOGQ4ZmIzNjY1ODM2NmYwYjkyZTkwNWIyMWU2ZGJkZGMwNDQ3YzVmYWNkZDEwYTVhNDI0MzZkY2I3MGVjNGIyYzk4OWJiOGYyZjVhZWNmNTk1NDhkYWQ5OTA4ZDM5ZTZiZTAzZTA1MmIyNDAyODhmZDA1YzdhNDdjNWVlNTk5MTEwNDcwYTYxOGQ1MzRkNGEyN2JmY2ZhOWNlYTMwMDhkYmVkZThhYWEzY2VjOGVkOTdiNGIyZWZmNDAxMzhmMjRjNmZlZWUyYzQ2MTllNzc1NWY5MzlmN2I2MDE1MzQxMTVmMWU3NDZkNzlkZGQ4MDc5MDI0Mzc3ZWZkOWE5MjkyODI4ODhhN2JkNTRjNjA0NWM2MTAwNzBiMjFhZjIzNGUwNzJiNzRiYWEwNGUyODc5MzNiOTUwNmNjZjMzYTgxMjA3MzYxMzgyODFkOGY3ZGEzZWQ2MzYwODI1ZTA2ZTI5YWI4ZTkxYWQxODE1ZDEzOGZhOTkxZGUzYzY5ODRhM2UxMWJiNmZjNmNhMWEwMGI2ZGJmN2RlNzRhY2M5NjQ1NWNhZWY5YWI0NWM0ZTNkZGQ2ZjY4ZDQ2NzUzZGExMjlhZDc2MWUxZjZhMmVjNGE1NWZmZTZlNTE2MGJmYzBhNDQ4OTQyYWE4OTQyODBmM2ZkY2NlNjViZGIxNTEyZWM0YWExYjJiMzg1NjI1Njc0Mzc0YjM3NzZmMWU2OWQwZGJlNjc2MzFjN2Y1YjlmMzQ1OTY1MWI2NWQ3MGQ3NDUxZGJhNDkwOTNjYTBlZjNlY2Q2ZTBmOGYzYTdjNGRkNDliZTdhODRmYzZmYzU1YzRkY2RiMjJlM2U5OGQxOWYwOTA5MWM2M2I3ZmI2MmQwYWZhNTE4MGY1YzM5OTNlYWRiMGE1NGRiMjdmODkzMjE3MWM2MzMyYzIwMDAxNjg4ZjlhMmZmYzk0NDlhNmVhNjY4YTExZjU3ZWVhZmZiZjYzMDZkNGEyN2MzOWY1MGZmYmY3NWEyYWY2NzZjOGU2ZTU2MjgwZDkwZjExZWE0MjliYzUwN2VlYjA1YWEwOTA2NDFiNGNiMjM3YjMwZTNiMjcxZTgxZmI5OTFhYjFkZDM5YzM3MmQ1Njk0YjVjODlhZmY4OGQ5ZThkNmNiY2Y2YmUxNDFjMTUyMTg1ODA1OTZmMGEzMTNkMDFiYWRjNzMwZjg2YWIzYzhmNWVlZjUwZmJjMmFjYzE3ZTUxZDkzNDQ0MjBkMDc1MGU5ZTg2ODg0NTQ3NDgxYzI1YWZhZmI0ZTczMGQ0M2IwNjhkY2U4YWY2YTk0ZDM1ZTY2NzAxZTU0NjI4OTNlMzYxMTEwYmNjYzA0NTYwMGY4ZDhkZmNhYWYzOGYzNzhlMGZkNWEyNjI0M2YxMDUwYjRlMjFjNWZkNzU1ZGFjZGNhZDdkZDY0YjQ2N2JiZjcyMDdhOWI1ZTNmZTk2NmU4ZmJkZDAzYmI5YzY3NjA4ZTk0ZDM5NTJhMGNhZTY3NGQyMWRhZTIxY2Q5NzU1YzUzMWE2ODhkYWI5ODZmZjdlMzMxYzk1YjA1NzU3M2Q5MGZhN2VkM2QwZDE2MWE3YjMyMDNlNWFhMTFhYTRjNjkxOTE2ZjAzMzY3MDU4NjBlZmE5OGYxMmI3MmI4YzliMWNiZTc1MmI4NzlmYjA3MTE3ZGVkNmVjOWI5YzFhNWQ1ZmRkYWY2M2E4OTI4N2MyYjkzMTcxOWM4YWQ1NjA4ZDk2NTY0YzE2YjcwMjM5YWI0OTRkOGVhMmEwM2UyZThmZGRjMWIzZmNiMTllMzkxYzdjMzI5YTAyMDM3YzdjNjk4NjhmMTBlMzU4NzgxNzUwOTAxZWYwZDBjZGNhMTA4ZjQzN2I1NWMxY2Q1YWZhNWQ1MjVjMzllNjEzZTg0ZjdmNDQxOTJiMjhkMTY3NTMxN2NlNDU2ODBiZWE1YmJiM2MxMTgwOWEyMWY3YjFmZWRjYWIyYzRjNTgwNzEyNGFiNzI0MGU2YjUzY2Y4MTdiZDZkOTYzMTM0NzE3MmYwY2M4OWNiOWE4YjY3ZTUyOGZiMjI5NzY3MDVlODVjNWI1ZDNkOTU5OTQ5M2Q2ZmM0ZWEwYTJjZWUzMWNhMmI4YWMxODdkODFjM2ZiMDEwZmZhMmEyMWZhMGVlOTMzMjRkNTA1Mzc4ZWYwNGEwNjhmYmI3YTdjMmZjYmI4ODkxNTU2MDY5ZGVjODBlM2M0OTgwYTE4ZGNiZGM4ZWM5N2E0",
//       "content-type":
//           "application/json", // Specify content-type as JSON to prevent empty response body
//     },
//     body: jsonEncode({"file": fileBytes}),
//   );

//   try {
//     if (response.statusCode == 200) {
//       print('تم الرفع بنجاح');
//     } else {
//       print('خطأ في الرفع: ${response.reasonPhrase}');
//       print('خطأ في الرفع: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('حدث خطأ: $e');
//   }
// }
