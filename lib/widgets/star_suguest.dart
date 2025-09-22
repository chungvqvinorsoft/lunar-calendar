import 'package:flutter/material.dart';
import 'package:lunar_calendar/theme/app_theme.dart';

enum StarSuguestType { gold, bad }

class StarSuguest extends StatelessWidget {
  final List<String> stars;
  final StarSuguestType type;
  const StarSuguest({super.key, required this.stars, required this.type});
  @override
  Widget build(BuildContext context) {
    final isGoldenTime = type == StarSuguestType.gold;
    final String title = isGoldenTime ? "Sao Tốt" : "Sao Xấu";
    final Color headerColor =
        isGoldenTime ? AppColors.accentGold : AppColors.primaryDark;
    final Color slotTextColor =
        isGoldenTime ? Colors.green.shade700 : Colors.red.shade700;
    // TODO: implement build
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1, color: Colors.black26),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star_border_purple500, color: headerColor),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                )
              ],
            ),
            const SizedBox(height: 8),
            ...stars.map((slot) {
              return Text(
                slot,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: slotTextColor,
                ),
                softWrap: true,
                maxLines: null,
                overflow: TextOverflow.visible,
              );
            }),
          ],
        ),
      ),
    );
  }
}
