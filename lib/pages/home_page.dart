import 'package:flutter/material.dart';

import '../enums/day.dart';
import '../routes/router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 1,
        length: Day.values.length,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 18,
            backgroundColor: const Color(0xFFF3F3F3),
            // * HEADER
            flexibleSpace: Container(
              color: const Color(0xFF171E31),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(
                  'assets/tvg.png',
                  alignment: Alignment.center,
                  height: 33.0,
                ),
              ),
            ),
            // * TAB BAR
            bottom: TabBar(
              tabAlignment: TabAlignment.center,
              padding: const EdgeInsets.only(right: 15.0),
              labelColor: const Color(0xFF26AEFB),
              indicatorColor: const Color(0xFF26AEFB),
              unselectedLabelColor: const Color(0xFF565F69),
              labelPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              tabs: List.generate(Day.values.length, (index) {
                return Text(
                  Day.values[index].name.toUpperCase(),
                  style: const TextStyle(fontSize: 10.0),
                );
              }),
            ),
          ),
          body: Navigator(
            key: navigatorKey,
            initialRoute: '/',
            onGenerateRoute: generateRoute,
          ),
        ),
      ),
    );
  }
}
