import 'package:deck_deck_app/quiz/widgets/new_tag.dart';
import 'package:deck_deck_app/shared/domain/memory_card.dart';
import 'package:deck_deck_app/shared/infrastructure/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

@immutable
class BackBody extends StatelessWidget {
  final MemoryCardBack memoryCardBack;
  const BackBody({super.key, required this.memoryCardBack});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerRight,
          child: NewTag(),
        ),
        const Spacer(),
        Text("Answer",
            style: TextStyle(
                color: AppTheme.colors.secondaryText,
                fontWeight: FontWeight.w600)),
        Text(memoryCardBack.answare,
            style: TextStyle(
                color: AppTheme.colors.text,
                fontSize: 64,
                fontWeight: FontWeight.bold)),
        const Spacer()
      ],
    );
  }
}
