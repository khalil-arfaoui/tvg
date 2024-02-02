import 'package:flutter/material.dart';

import '../models/sport_event.dart';
import '../pages/event_detail_page.dart';
import '../widgets/event_list_widget.dart';

const routeHome = '/';
const routeDetail = '/detail';

final navigatorKey = GlobalKey<NavigatorState>();

MaterialPageRoute<dynamic> generateRoute(RouteSettings settings) {
  late Widget page;
  if (settings.name == routeHome) {
    page = const EventListWidget();
  } else if (settings.name == routeDetail) {
    page = EventDetailPage(event: settings.arguments as SportEvent);
  } else {
    throw Exception('Unknown route: ${settings.name}');
  }

  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}
