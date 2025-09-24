import "package:flutter/material.dart";
import "package:lunar_calendar/screens/home_screen.dart";
import "package:lunar_calendar/screens/setting_screen.dart";
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
    HomeScreen(),
    TuviScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 0),
        transitionBuilder: (child, animation) {
          final offsetAnimation = Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        child: _pages[_index],
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
