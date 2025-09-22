import "package:flutter/material.dart";
import "package:lunar_calendar/screens/home_screen.dart";
import "package:lunar_calendar/screens/tuvi_screen.dart";
import "package:lunar_calendar/widgets/app_bottom_bar.dart";

class MainSell extends StatefulWidget {
  const MainSell({super.key});
  @override
  State<MainSell> createState() => _MainSell();
}

class _MainSell extends State<MainSell> {
  int _index = 0;
  final _pages = const [
    TuviScreen(),
    HomeScreen(),
    _Stub(text: 'Cài Đặt'),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _pages,
      ),
      bottomNavigationBar: AppBottomBar(
        currentIndex: _index,
        onChaged: (i) => setState(() => _index = i),
      ),
    );
  }
}

class _Stub extends StatelessWidget {
  final String text;
  const _Stub({required this.text});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(text, style: Theme.of(context).textTheme.titleLarge));
  }
}
