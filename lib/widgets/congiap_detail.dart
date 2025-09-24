import 'package:flutter/material.dart';
import 'package:lunar_calendar/theme/app_theme.dart';

class ConGiapDetail extends StatelessWidget {
  const ConGiapDetail({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black26),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Thin",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text("1960, 1972, 1984, 1996, 2008, 2020"),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text("Số may: 2, 3"),
                    SizedBox(width: 12),
                    Text("Màu: Xanh, Đỏ")
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Text(
            "Kim",
            style: TextStyle(
                color: AppColors.primary, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
