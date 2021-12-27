import 'package:babysitter/components/app_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final Icon? icon;
  final bool disabled;

  const AppButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.icon,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget content = Container(
      width: double.infinity,
      height: 50.0,
      // margin: const EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        // gradient: appGradient,
        color: const Color(0xFFFF8800),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: disabled == false ? null : Colors.transparent,
          onTap: () => onTap(),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: text,
                  size: 18.0,
                  color: 0xFFFFFFFF,
                ),
                const SizedBox(width: 8),
                icon ?? Container()
              ],
            ),
          ),
        ),
      ),
    );
    return disabled == false
        ? content
        : ColorFiltered(
            colorFilter:
                const ColorFilter.mode(Colors.grey, BlendMode.modulate),
            child: content,
          );
  }
}
