import 'package:flutter/material.dart';

import '../models/sport_event.dart';
import '../widgets/avatar_league_widget.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key, required this.event});

  final SportEvent event;

  @override
  Widget build(BuildContext context) {
    String endTime = '';
    if (event.sportType.toLowerCase() == 'football') {
      endTime = ' - ${int.parse(event.timeStarting.split(':')[0]) + 2}:${event.timeStarting.split(':')[1]}';
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width / 3,
        leading: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Color(0xFF7B7B7B)),
            ),
            const Text('Go Back', style: TextStyle(color: Color(0xFF7B7B7B))),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            AvatarLeagueWidget(league: event.league),
            const SizedBox(height: 20),
            Text(
              '${event.dateStarting} | ${event.timeStarting}$endTime',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
            ),
            Text(event.teams, style: const TextStyle(fontSize: 20.0)),
            const SizedBox(height: 50),
            Image.network(event.iconUrl, height: 46.0),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                  'Gummi bears cupcake sesame snaps cupcake bonbon. Halvah muffin biscuit brownie bear claw cookie croissant. Sugar plum candy canes brownie topping pudding jelly-o chocolate cake lollipop.\n\nChocolate cake chupa chups shortbread apple pie chocolate bar jelly beans chocolate carrot cake danish. Lemon drops jujubes chocolate sesame snaps marshmallow. Sesame snaps sweet roll oat cake.'),
            )
          ],
        ),
      ),
    );
  }
}
