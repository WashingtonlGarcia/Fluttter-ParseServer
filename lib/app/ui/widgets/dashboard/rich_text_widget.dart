import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const RichTextWidget({
    @required this.title,
    @required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            )),
        TextSpan(
            text: subtitle,
            style: TextStyle(
              color: Colors.grey[800],
            )),
      ]),
    );
  }
}
