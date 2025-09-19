import 'package:flutter/material.dart';
import 'package:lunar_calendar/widgets/calendar_header.dart';
import 'package:lunar_calendar/widgets/calendar_month_grid.dart';
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
    // TODO: implement initState
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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("Lịch Âm", style: TextStyle(fontWeight: FontWeight.w900),)),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HomeHeader(
              dateSelected: _selectedDate
            ),
          ),
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
            padding: EdgeInsets.fromLTRB(16, 12, 16, 24),
            sliver: SliverToBoxAdapter(
              child: CalendarMonthGrid(
                  year: _selectedTime.year,
                  month: _selectedTime.month,
                  selectDate: _selectedDate,
                  onSelect: (d) {
                    // show detail _selectedDate
                    setState(() => _selectedDate = d);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
