import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';

class ActionButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData iconData;
  const ActionButton({
    required this.onPressed,
    required this.iconData,
    required this.text,
    super.key,
  });

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: widget.onPressed,
      icon: Icon(
        widget.iconData,
        color: ColorManager.baseBlackColor,
      ),
      label: Text(
        widget.text,
        textScaleFactor: 1,
        overflow: TextOverflow.fade,
        style: const TextStyle(
          color: ColorManager.baseBlackColor,
        ),
      ),
    );
  }
}
