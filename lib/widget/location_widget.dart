import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {

  final String secilenSehir;

  const LocationWidget({super.key, required this.secilenSehir});

  @override
  Widget build(BuildContext context) {
    return Text(
      secilenSehir,
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
