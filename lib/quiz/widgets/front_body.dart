import 'package:deck_deck_app/quiz/widgets/new_tag.dart';
import 'package:deck_deck_app/shared/domain/memory_card.dart';
import 'package:deck_deck_app/shared/infrastructure/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

@immutable
class FrontBody extends StatelessWidget {
  final MemoryCardFront memoryCardFront;
  const FrontBody({super.key, required this.memoryCardFront});
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      const Align(
        alignment: Alignment.centerRight,
        child: NewTag(),
      ),
      const Spacer(),
      Text(memoryCardFront.sentence,
          style: TextStyle(
              color: AppTheme.colors.text,
              fontSize: 64,
              fontWeight: FontWeight.bold)),
      const Spacer()
    ];
    if (memoryCardFront.question != null) {
      children.insert(
          2,
          Text(memoryCardFront.question!,
              style: TextStyle(
                  color: AppTheme.colors.secondaryText,
                  fontWeight: FontWeight.w600)));
    }
    return Column(
      children: children,
    );
  }
}
