import 'package:flutter/material.dart';
import 'package:lunar_calendar/theme/app_theme.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: AppColors.primary),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cài Đặt",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w900, fontSize: 24),
          ),
          SizedBox(height: 8),
          Text(
            "Tùy chỉnh ứng dụng theo ý thích",
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
