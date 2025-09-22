import 'package:flutter/material.dart';
import 'package:lunar_calendar/widgets/tuvi_congiap.dart';
import 'package:lunar_calendar/widgets/tuvi_header.dart';

class TuviScreen extends StatelessWidget {
  const TuviScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(toolbarHeight: 8),
      body: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TuviHeader(),
          ),
          SliverToBoxAdapter(
            child: TuviConGiap(),
          )
        ],
      ),
    );
  }
}
