import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:lunar_calendar/services/lunar_converter.dart";
import "package:lunar_calendar/theme/app_theme.dart";

class HomeHeader extends StatelessWidget {
  final DateTime dateSelected;
  const HomeHeader({super.key, required this.dateSelected});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final String solar = DateFormat.yMMMMEEEEd('vi')
        .format(dateSelected)
        .replaceAll(',', '')
        .replaceAll("${dateSelected.year}", "năm ${dateSelected.year}");
    final String lunar = LunarConverter.lunarFullYear(dateSelected);
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: AppColors.primary,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              color: Colors.white.withOpacity(0.1),
              border: Border.all(color: Colors.white.withOpacity(0.10)),
            ),
            child: Row(
              children: [
                const Icon(Icons.wb_sunny_outlined,
                    size: 18, color: Color(0xFFFFD700)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Dương lịch",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(solar,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              color: Colors.white.withOpacity(0.1),
              border: Border.all(color: Colors.white.withOpacity(0.10)),
            ),
            child: Row(
              children: [
                const Icon(Icons.nightlight_outlined,
                    size: 18, color: Color(0xFFFFD700)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Âm lịch",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(lunar,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
