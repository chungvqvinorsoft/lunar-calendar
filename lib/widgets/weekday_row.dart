import "package:flutter/material.dart";
import "package:lunar_calendar/theme/app_theme.dart";

class WeekdayRow extends StatelessWidget {
  final labels = ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'];

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        );
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 12, 0),
      child: Row(
        children: List.generate(7, (i) {
          final isWeekend = (i == 0) || (i == 6);
          return Expanded(
            child: Text(
              labels[i],
              textAlign: TextAlign.center,
              style: isWeekend
                  ? textStyle?.copyWith(color: AppColors.primary)
                  : textStyle,
            ),
          );
        }),
      ),
    );
  }
}
