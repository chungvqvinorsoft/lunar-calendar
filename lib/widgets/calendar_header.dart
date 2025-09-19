import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:lunar_calendar/theme/anim.dart";

class CalendarHeader extends StatefulWidget {
  final DateTime selectedMonth;
  final VoidCallback preMonth;
  final VoidCallback nextMonth;
  const CalendarHeader({
    super.key,
    required this.selectedMonth,
    required this.nextMonth,
    required this.preMonth,
  });
  @override
  State<CalendarHeader> createState() => _CalendarHeader();
}

class _CalendarHeader extends State<CalendarHeader> {
  @override
  Widget build(BuildContext context) {
    final label = DateFormat.yMMMM('vi').format(widget.selectedMonth);
    final labelClean = label.replaceAll(',', '');
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        children: [
          IconButton(
              onPressed: widget.preMonth, icon: const Icon(Icons.chevron_left)),
          Expanded(
            child: AnimatedSwitcher(
              duration: Anim.normal,
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              child: Text(
                labelClean,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
          ),
          IconButton(
            onPressed: widget.nextMonth,
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
