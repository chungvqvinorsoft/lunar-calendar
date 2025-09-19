import 'package:vnlunar/vnlunar.dart';

class LunarConverter {
  static const List<String> _can = [
    'Giáp',
    'Ất',
    'Bính',
    'Đinh',
    'Mậu',
    'Kỷ',
    'Canh',
    'Tân',
    'Nhâm',
    'Quý'
  ];

  static const List<String> _chi = [
    'Tý',
    'Sửu',
    'Dần',
    'Mão',
    'Thìn',
    'Tỵ',
    'Ngọ',
    'Mùi',
    'Thân',
    'Dậu',
    'Tuất',
    'Hợi'
  ];

  // Compute Can Chi for a given year (using common formula)
  static String canChiYear(int year) {
    final can = _can[(year + 6) % 10];
    final chi = _chi[(year + 8) % 12];
    return '$can $chi';
  }

  static String lunarDayString(DateTime solar) {
    final lunar = Lunar.fromSolar(Solar(solar));
    return '${lunar.day}/${lunar.month}';
  }

  static String lunarFullYear(DateTime solar) {
    final lunar = Lunar.fromSolar(Solar(solar));
    final ccYear = canChiYear(lunar.year);
    return "Ngày ${lunar.day} tháng ${lunar.month} năm $ccYear";
  }
}
