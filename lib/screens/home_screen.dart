import 'package:flutter/material.dart';
import 'package:lunar_calendar/theme/app_theme.dart';
import 'package:lunar_calendar/widgets/calendar_header.dart';
import 'package:lunar_calendar/widgets/calendar_month_grid.dart';
import 'package:lunar_calendar/widgets/day_detail.dart';
import 'package:lunar_calendar/widgets/home_header.dart';
import 'package:lunar_calendar/widgets/weekday_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime _selectedTime;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedTime = DateTime.now();
    _selectedDate = DateTime.now();
  }

  void _preMonth() {
    setState(() {
      _selectedTime = DateTime(_selectedTime.year, _selectedTime.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _selectedTime = DateTime(_selectedTime.year, _selectedTime.month + 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Lịch Âm",
        style: TextStyle(fontWeight: FontWeight.w900),
      )),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
              color: AppColors.primary,
            ),
            child: HomeHeader(dateSelected: DateTime.now()),
          )),
          SliverToBoxAdapter(
            child: CalendarHeader(
              selectedMonth: _selectedTime,
              preMonth: _preMonth,
              nextMonth: _nextMonth,
            ),
          ),
          SliverToBoxAdapter(
            child: WeekdayRow(),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            sliver: SliverToBoxAdapter(
              child: CalendarMonthGrid(
                year: _selectedTime.year,
                month: _selectedTime.month,
                selectDate: _selectedDate,
                onShowDetail: (d) {
                  showDateDetailSheet(context, dateSelected: d);
                  setState(() => _selectedDate = d);
                },
                onSelect: (d) {
                  setState(() => _selectedDate = d);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
