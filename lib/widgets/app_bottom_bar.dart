import 'package:flutter/material.dart';
import 'package:lunar_calendar/theme/anim.dart';
import 'package:lunar_calendar/theme/app_theme.dart';

class AppBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChaged;
  const AppBottomBar(
      {super.key, required this.currentIndex, required this.onChaged});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      top: false,
      child: Container(
        height: 74,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x1A0000), blurRadius: 10, offset: Offset(0, -4))
            ],
            border: Border(top: BorderSide(color: Colors.black26, width: 1))),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
        child: Row(
          children: [
            Expanded(
              child: _NavItem(
                  icon: Icons.calendar_month,
                  title: "Lịch",
                  isActive: currentIndex == 0,
                  onTap: () => onChaged(0)),
            ),
            Expanded(
              child: _NavItem(
                  icon: Icons.auto_awesome,
                  title: "Tử Vi",
                  isActive: currentIndex == 1,
                  onTap: () => onChaged(1)),
            ),
            Expanded(
              child: _NavItem(
                  icon: Icons.settings,
                  title: "Cài Đặt",
                  isActive: currentIndex == 2,
                  onTap: () => onChaged(2)),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final IconData icon;
  final VoidCallback onTap;
  const _NavItem(
      {required this.icon,
      required this.title,
      required this.isActive,
      required this.onTap});
// behavior: HitTestBehavior.opaque
  @override
  Widget build(BuildContext context) {
    const activeColor = Colors.white;
    const inactiveIcon = Color(0xFF243B53); // xanh đậm giống ảnh
    const inactiveText = Color(0xFF6B7280);
    // TODO: implement build
    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: AnimatedContainer(
          width: 82,
          duration: const Duration(milliseconds: 200),
          curve: Anim.curve,
          padding: EdgeInsets.symmetric(
            horizontal: isActive ? 12 : 0,
            vertical: isActive ? 6 : 0,
          ),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 22,
                color: isActive ? activeColor : inactiveIcon,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: isActive ? activeColor : inactiveText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
