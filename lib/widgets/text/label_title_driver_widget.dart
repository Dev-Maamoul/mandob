import 'package:flutter/widgets.dart';

class LabelTitleDriverWidget extends StatelessWidget {
  const LabelTitleDriverWidget({super.key, required this.title, this.text});
  final String title;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: (1),
            child: Text(
              "$title:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              text.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
