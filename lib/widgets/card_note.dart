import 'package:flutter/material.dart';
import 'package:lunar_calendar/theme/app_theme.dart';

class CardNote extends StatelessWidget {
  const CardNote({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Lời Khuyên Hôm Nay",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            decoration: BoxDecoration(
                color: Colors.amber[50],
                border: Border.all(color: Colors.amber, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: const Text(
                "Hôm nay là ngày tốt để bắt đầu những dự án mới. Hãy tận dụng năng lượng tích cực và không ngại thử thách bản thân. Trong tình yêu, hãy thể hiện sự quan tâm nhiều hơn với người bạn yêu thương"),
          ),
        ],
      ),
    );
  }
}
