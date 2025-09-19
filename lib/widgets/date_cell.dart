//o ngay
import 'package:flutter/material.dart';
import 'package:lunar_calendar/theme/anim.dart';
import 'package:lunar_calendar/theme/app_theme.dart';

/// Ô ngày trong lịch tháng.
/// - [day]         : ngày dương lịch
/// - [isToday]     : có phải hôm nay?
/// - [isSelected]  : đang được chọn?
/// - [lunarText]   : chuỗi ngày âm hiển thị nhỏ (vd: "12")
/// - [onTap]       : callback khi bấm
class DateCell extends StatefulWidget {
  final DateTime day;
  final bool isToday;
  final bool isSelected;
  final String? lunarText;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const DateCell({
    super.key,
    required this.day,
    this.isToday = false,
    this.isSelected = false,
    this.lunarText,
    this.onTap,
    this.onLongPress,
  });

  @override
  State<DateCell> createState() => _DateCellState();
}

class _DateCellState extends State<DateCell>
    with SingleTickerProviderStateMixin {
  double _pressScale = 1.0;

  void _handleTapDown(TapDownDetails _) => setState(() => _pressScale = 0.96);
  void _handleCancel() => setState(() => _pressScale = 1.0);
  void _handleTapUp(TapUpDetails _) => setState(() => _pressScale = 1.0);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    // màu viền/nền theo trạng thái
    final Color borderColor = widget.isSelected
        ? cs.primary
        : widget.isToday
            ? cs.primary.withOpacity(0.45)
            : Colors.black12;

    final Color? bgColor = widget.isSelected ? AppColors.primary : null;

    final Color dayColor = widget.isSelected
        ? Colors.white
        : theme.textTheme.bodyLarge?.color ?? Colors.black87;

    final Color lunarColor =
        widget.isSelected ? AppColors.accentGold : cs.primary.withOpacity(0.8);

    return AnimatedScale(
      duration: const Duration(milliseconds: 160),
      curve: Curves.easeOutCubic,
      scale: _pressScale,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: widget.onTap,
          onLongPress: widget.onLongPress,
          onTapDown: _handleTapDown,
          onTapCancel: _handleCancel,
          onTapUp: _handleTapUp,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor),
              boxShadow: widget.isSelected
                  ? [
                      BoxShadow(
                        color: cs.primary.withOpacity(0.16),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : const [],
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // số ngày dương
                Text(
                  '${widget.day.day}',
                  style: TextStyle(
                    fontWeight:
                        widget.isSelected ? FontWeight.w700 : FontWeight.w600,
                    fontSize: 16,
                    color: dayColor,
                  ),
                ),
                const SizedBox(height: 2),
                // ngày âm nhỏ (nếu có)
                if (widget.lunarText != null)
                  Text(
                    widget.lunarText!,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: lunarColor,
                    ),
                  ),
                // chấm đánh dấu hôm nay (tùy chọn)
                if (widget.isToday && !widget.isSelected) ...[
                  const SizedBox(height: 4),
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: cs.primary.withOpacity(0.85),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
