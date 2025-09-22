import 'package:flutter/material.dart';
import 'package:lunar_calendar/theme/app_theme.dart';

enum TimeSuggestType { gold, bad }

class TimeSugest extends StatelessWidget {
  final List<String> times;
  final TimeSuggestType type;
  const TimeSugest({super.key, required this.times, required this.type});
  @override
  Widget build(BuildContext context) {
    final isGoldenTime = type == TimeSuggestType.gold;
    final String title = isGoldenTime ? "Giờ hoàng đạo" : "Giờ hắc đạo";
    final Color headerColor =
        isGoldenTime ? AppColors.accentGold : AppColors.primaryDark;
    final Color slotBackgroundColor =
        isGoldenTime ? Colors.green.shade50 : Colors.red.shade50;
    final Color slotBorderColor =
        isGoldenTime ? Colors.green.shade200 : Colors.red.shade200;
    final Color slotTextColor =
        isGoldenTime ? Colors.green.shade700 : Colors.red.shade700;

    return Container(
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
              Icon(Icons.access_alarms, color: headerColor),
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
          ...times.map((slot) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              width: double.infinity,
              decoration: BoxDecoration(
                color: slotBackgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                  color: slotBorderColor,
                  width: 1,
                ),
              ),
              child: Text(
                slot,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: slotTextColor,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
