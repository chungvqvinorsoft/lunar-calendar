import 'package:flutter/material.dart';
import 'package:lunar_calendar/services/lunar_converter.dart';
import 'date_cell.dart';

class CalendarMonthGrid extends StatelessWidget {
  final int year;
  final int month;
  final ValueChanged<DateTime> onSelect;
  final DateTime selectDate;
  const CalendarMonthGrid(
      {super.key,
      required this.year,
      required this.month,
      required this.onSelect,
      required this.selectDate});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final first = DateTime(year, month, 1);
    final daysInMonth = DateTime(year, month + 1, 0).day;
    final startWeekDay = (first.weekday % 7);
    final items = <Widget>[];
    bool _isSameDay(DateTime day, DateTime now) {
      return day.year == now.year &&
          day.month == now.month &&
          day.day == now.day;
    }

    for (var i = 0; i < startWeekDay; i++) {
      items.add(const SizedBox.shrink());
    }
    for (var i = 0; i < daysInMonth; i++) {
      final date = DateTime(year, month, i + 1);
      final lunarText = LunarConverter.lunarDayString(date);

      items.add(DateCell(
        day: date,
        isToday: _isSameDay(date, DateTime.now()),
        isSelected: _isSameDay(date, selectDate),
        onTap: () => onSelect(date),
        lunarText: lunarText,
      ));
    }

    return GridView.count(
      crossAxisCount: 7,
      mainAxisSpacing: 8,
      crossAxisSpacing: 12,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: items,
      childAspectRatio: 0.62,
    );
  }
}
