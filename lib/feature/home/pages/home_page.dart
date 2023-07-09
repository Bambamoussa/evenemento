import 'package:evenemento/core/style/style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            bottom: TabBar(
              isScrollable: true,
              indicatorWeight: 3,
              indicatorColor: AppTheme.lightGreenLightTheme.indicatorColor,
              tabs: const [
                RepeatTab(label: "Tout"),
                RepeatTab(label: "Musique"),
                RepeatTab(label: "Sport"),
                RepeatTab(label: "Voyage"),
                RepeatTab(label: "Divertissement"),
              ],
            ),
          ),
          body: const TabBarView(children: [
            Center(
              child: Text("All"),
            ),
            Center(
              child: Text("Musique"),
            ),
            Center(
              child: Text("Sport"),
            ),
            Center(
              child: Text("Voyage"),
            ),
            Center(
              child: Text("Divertissement"),
            ),
          ]),
        ));
  }
}

class RepeatTab extends StatelessWidget {
  final String label;
  const RepeatTab({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
      ),
    );
  }
}
