import "package:flutter/material.dart";
import "package:lunar_calendar/theme/app_theme.dart";
import "package:lunar_calendar/widgets/home_header.dart";
import "package:lunar_calendar/widgets/star_suguest.dart";
import "package:lunar_calendar/widgets/time_sugest.dart";

class DayDetail extends StatelessWidget {
  final DateTime dateSelected;
  const DayDetail({super.key, required this.dateSelected});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final goldenHourSlots = List.generate(4, (_) => "05:00 - 07:00 (Mão)");
    final starSlots = List.generate(4, (_) => "Thiên Đức");

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Chi tiết ngày",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: AppColors.primary),
        ),
        const SizedBox(
          height: 12,
        ),
        HomeHeader(dateSelected: dateSelected),
        const SizedBox(
          height: 12,
        ),
        // can chi
        Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(width: 1, color: Colors.black26),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.ac_unit_rounded,
                          color: AppColors.accentGold),
                      const SizedBox(width: 8),
                      Text("Can Chi",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ))
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text("Nhâm Thân",
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600))
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        // gio hoang dao
        TimeSugest(
          type: TimeSuggestType.gold,
          times: goldenHourSlots,
        ),
        const SizedBox(
          height: 12,
        ),
        // Gio xung khac
        TimeSugest(times: goldenHourSlots, type: TimeSuggestType.bad),
        const SizedBox(
          height: 12,
        ),
        // sao
        Row(
          children: [
            StarSuguest(stars: starSlots, type: StarSuguestType.gold),
            const SizedBox(
              width: 8,
            ),
            StarSuguest(stars: starSlots, type: StarSuguestType.bad)
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        // ghi chu
        Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(width: 1, color: Colors.blue.shade100),
              color: Colors.blue[50]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ghi chú",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.blue[800])),
              const SizedBox(height: 8),
              Text(
                "Ngày tốt cho việc khởi công, cưới hỏi, xuất hành",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[600],
                    fontSize: 16),
                softWrap: true,
                maxLines: null,
                overflow: TextOverflow.visible,
              )
            ],
          ),
        ),
      ],
    );
  }
}

void showDateDetailSheet(BuildContext context,
    {required DateTime dateSelected}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    backgroundColor: Colors.transparent, // để bo góc đẹp
    builder: (_) {
      return DraggableScrollableSheet(
        initialChildSize: 0.75, // 75% màn hình khi mở
        minChildSize: 0.4,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: SafeArea(
              top: false,
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                children: [
                  // thanh kéo
                  Center(
                    child: Container(
                      width: 44,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                  // bạn có thể đưa nội dung DayDetail vào đây,
                  // hoặc refactor DayDetail trả về danh sách children.
                  DayDetail(dateSelected: dateSelected),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
