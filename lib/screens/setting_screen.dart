import 'package:flutter/material.dart';
import 'package:lunar_calendar/widgets/card_setting.dart';
import 'package:lunar_calendar/widgets/setting_header.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> settingsData = [
      {
        "section": "Cá Nhân",
        "items": [
          {
            "icon": Icons.person_outline,
            "title": "Thông tin cá nhân",
            "subtitle": "Tên, ngày sinh, giới tính",
          },
          {
            "icon": Icons.notifications_none,
            "title": "Thông báo",
            "subtitle": "Nhắc nhở lễ hội, ngày tốt",
          },
        ],
      },
      {
        "section": "Hiển Thị",
        "items": [
          {
            "icon": Icons.palette_outlined,
            "title": "Giao diện",
            "subtitle": "Màu sắc, chủ đề",
          },
          {
            "icon": Icons.dark_mode_outlined,
            "title": "Chế độ tối",
            "subtitle": "Tự động hoặc thủ công",
          },
          {
            "icon": Icons.language_outlined,
            "title": "Ngôn ngữ",
            "subtitle": "Tiếng Việt, English",
          },
        ],
      },
      {
        "section": "Khác",
        "items": [
          {
            "icon": Icons.info_outline,
            "title": "Về ứng dụng",
            "subtitle": "Phiên bản 1.0.0",
          },
        ],
      },
    ];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(toolbarHeight: 8),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SettingHeader(),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: settingsData.map((item) {
              return CardSetting(
                session: item["section"],
                itemsSeting: item["items"],
              );
            }).toList(),
          )),
        ],
      ),
    );
  }
}
