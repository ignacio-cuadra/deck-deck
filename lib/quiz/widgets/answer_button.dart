import 'package:deck_deck_app/shared/infrastructure/theme/app_theme.dart';
import 'package:flutter/material.dart';

@immutable
class AnswerButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String time;
  final Function onPressed;
  const AnswerButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.time,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPressed();
        },
        child: Column(
          children: [
            Icon(
              icon,
              size: 64.0,
              color: AppTheme.colors.text,
            ),
            Text(label, style: TextStyle(color: AppTheme.colors.text)),
            Text(time)
          ],
        ));
  }
}
