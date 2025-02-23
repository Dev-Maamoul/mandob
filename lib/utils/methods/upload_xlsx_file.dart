import 'package:file_picker/file_picker.dart';

Future<List<int>> uploadXlsxFile() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowCompression: true,

      dialogTitle: "The",
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      // الحصول على بيانات الملف
      PlatformFile file = result.files.first;

      // تحويل الملف إلى List<int>
      List<int> fileBytes = file.bytes!.toList();

      return fileBytes;
    } else {
      throw Exception('حدث خطأ: في رفع الملف');
    }
  } catch (e) {
    throw Exception('حدث خطأ: $e');
  }
}
