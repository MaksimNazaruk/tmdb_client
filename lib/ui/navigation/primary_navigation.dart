import 'package:flutter/material.dart';

class PrimaryScreenDescriptor {
  final Widget screen;
  final Tab tab;

  PrimaryScreenDescriptor(this.screen, this.tab);
}

class PrimaryNavigation extends StatelessWidget {
  final List<PrimaryScreenDescriptor> primaryScreens;

  const PrimaryNavigation({
    Key key,
    @required this.primaryScreens,
  }) : super(key: key);

  @override
  Widget build(Object context) {
    return DefaultTabController(
      length: primaryScreens.length,
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
              children: primaryScreens.map((e) => e.screen).toList(),
            ),
          ),
          TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: primaryScreens.map((e) => e.tab).toList(),
          ),
        ],
      ),
    );
  }
}
