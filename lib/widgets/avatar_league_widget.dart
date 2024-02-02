import 'package:flutter/material.dart';

class AvatarLeagueWidget extends StatelessWidget {
  const AvatarLeagueWidget({super.key, required this.league});

  final String league;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 54.0,
      width: 54.0,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F4F8),
        borderRadius: BorderRadius.circular(27.0),
      ),
      child: Text(
        league.toUpperCase(),
        style: const TextStyle(fontSize: 12),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
