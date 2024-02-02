import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../enums/day.dart';
import '../models/sport_event.dart';
import '../routes/router.dart';
import 'avatar_league_widget.dart';

class EventListWidget extends StatelessWidget {
  const EventListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: List.generate(Day.values.length, (index) {
        final future = Future.delayed(const Duration(seconds: 2), () async {
          final jsonString = await rootBundle.loadString('assets/sport_events.json');
          List<dynamic> result = jsonDecode(jsonString)['sportEvents'];
          return result.map((e) => SportEvent.fromJson(e)).toList();
        });

        return FutureBuilder(
          future: future,
          builder: (context, snap) {
            if (snap.hasData) {
              final data = snap.data;
              if (data != null) {
                final events = data.where((element) => element.dateStarting.toLowerCase() == Day.values[index].name.toLowerCase()).toList();

                if (events.isEmpty) {
                  return Center(child: Text('No events ${Day.values[index].name}'.toUpperCase()));
                }

                return ListView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  children: List.generate(events.length, (i) {
                    final event = events.elementAt(i);
                    String endTime = '';
                    if (event.sportType.toLowerCase() == 'football') {
                      endTime = ' - ${int.parse(event.timeStarting.split(':')[0]) + 2}:${event.timeStarting.split(':')[1]}';
                    }

                    return ListTile(
                      leading: Image.network(
                        event.iconUrl,
                        loadingBuilder: (context, child, loadingProgress) {
                          print(loadingProgress);
                          if (loadingProgress == null) {
                            return child;
                          }
                          return CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.red,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                : null,
                          );
                        },
                      ),
                      title: Text(
                        '${event.dateStarting} | ${event.timeStarting}$endTime',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                      ),
                      subtitle: Text(event.teams, style: const TextStyle(fontSize: 20.0)),
                      trailing: AvatarLeagueWidget(league: event.league),
                      onTap: () => navigatorKey.currentState!.pushNamed(routeDetail, arguments: event),
                    );
                  }),
                );
              }
              return const Center(child: Text('No data'));
            } else if (snap.hasData) {
              return Center(child: Text(snap.error.toString()));
            }
            return const CircularProgressIndicator.adaptive();
          },
        );
      }),
    );
  }
}
