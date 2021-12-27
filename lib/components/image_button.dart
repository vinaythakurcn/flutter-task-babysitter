import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final Image image;
  final Function onTap;
  const ImageButton({
    Key? key,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () => onTap(),
        child: image,
      ),
    );
  }
}
