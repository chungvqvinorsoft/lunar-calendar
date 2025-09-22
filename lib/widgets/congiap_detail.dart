import 'package:flutter/material.dart';

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            children: [
              Text("Thin"),
            ],
          ))
        ],
      ),
    );
  }
}
