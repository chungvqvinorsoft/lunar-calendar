import 'package:flutter/material.dart';
import 'package:lunar_calendar/theme/app_theme.dart';

class TuviConGiap extends StatelessWidget {
  const TuviConGiap({super.key});
  @override
  Widget build(BuildContext context) {
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
      child: const Column(
        children: [
          Row(
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
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
