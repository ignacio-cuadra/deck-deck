import 'package:deck_deck_app/shared/infrastructure/theme/app_theme.dart';
import 'package:flutter/material.dart';

@immutable
class FrontFooter extends StatelessWidget {
  final Function flip;
  final int seconds;
  const FrontFooter({super.key, required this.seconds, required this.flip});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
          onPressed: () {
            flip();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 60, right: 60, top: 15, bottom: 15),
            child: Text("Flip"),
          )),
      const SizedBox(
        height: 10,
      ),
      Text(
        "${seconds}s",
        style: TextStyle(color: AppTheme.colors.secondaryText),
      )
    ]);
  }
}
