import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ReadMoreText({
    Key? key,
    required this.text,
    required this.maxLines,
  }) : super(key: key);

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.grey,
      height: 1.5,
    );

    final textSpan = TextSpan(
      text: widget.text,
      style: textStyle,
    );

    final richText = RichText(
      maxLines: _isExpanded ? null : widget.maxLines,
      text: textSpan,
    );

    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          richText,
          if (!_isExpanded)
            const Text(
              'Read More',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
        ],
      ),
    );
  }
}
