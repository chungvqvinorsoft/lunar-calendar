import 'package:flutter/material.dart';
import 'package:lunar_calendar/theme/app_theme.dart';
import 'package:lunar_calendar/widgets/congiap_detail.dart';

class TuviConGiap extends StatelessWidget {
  const TuviConGiap({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> moc = [
      {
        "name": "Tý",
        "element": "Kim",
        "years": "1960, 1972, 1984, 1996, 2008, 2020",
        "luckyNumbers": "2, 3",
        "colors": "Xanh, Đỏ",
      },
      {
        "name": "Sửu",
        "element": "Thổ",
        "years": "1961, 1973, 1985, 1997, 2009, 2021",
        "luckyNumbers": "0, 5",
        "colors": "Vàng, Nâu",
      },
      {
        "name": "Dần",
        "element": "Mộc",
        "years": "1962, 1974, 1986, 1998, 2010, 2022",
        "luckyNumbers": "1, 3, 4",
        "colors": "Xanh lá, Đen",
      },
      {
        "name": "Mão",
        "element": "Mộc",
        "years": "1963, 1975, 1987, 1999, 2011, 2023",
        "luckyNumbers": "3, 4, 9",
        "colors": "Hồng, Đỏ, Tím",
      },
    ];
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 3,
              spreadRadius: 0,
              offset: Offset(0, 3),
            )
          ]),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(Icons.star_border, color: AppColors.primary),
              SizedBox(width: 4),
              Text(
                "12 Con Giáp",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            children: moc.map((item) {
              return const Column(
                children: [
                  ConGiapDetail(),
                  SizedBox(height: 12),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
