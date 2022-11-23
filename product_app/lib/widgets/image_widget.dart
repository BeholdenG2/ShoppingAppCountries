import 'dart:io';
import 'package:flutter/cupertino.dart';

class mainImage extends StatefulWidget {
  String?path;
  mainImage({Key? key, this.path}) : super(key: key);

  @override
  State<mainImage> createState() => _mainImageState();
}

class _mainImageState extends State<mainImage> {
  @override
  Widget build(BuildContext context) {
    if (widget.path == '') {
      return Placeholder(
        fallbackHeight: 100,
        fallbackWidth: 100,
      );
    }else{
      return Image.file(File(widget.path!));
    }
  }
}