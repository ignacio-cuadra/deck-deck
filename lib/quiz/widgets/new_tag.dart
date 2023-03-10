import 'package:deck_deck_app/shared/infrastructure/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

@immutable
class NewTag extends StatelessWidget {
  const NewTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppTheme.colors.text,
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
        child: Text(
          "new",
          style: TextStyle(
              color: AppTheme.colors.background, fontWeight: FontWeight.bold),
        ));
  }
}
