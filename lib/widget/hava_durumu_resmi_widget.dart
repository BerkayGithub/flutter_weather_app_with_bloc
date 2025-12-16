import 'package:flutter/material.dart';

class HavaDurumuResmiWidget extends StatelessWidget {
  final String iconUrl;
  final String currentHeat;
  const HavaDurumuResmiWidget({super.key, required this.iconUrl, required this.currentHeat});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$currentHeat°C", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        Image.network(iconUrl, scale: 0.25),
      ],
    );
  }
}
