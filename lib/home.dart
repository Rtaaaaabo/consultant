import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = List<Tab>.generate(10, (int index) {
    return Tab(
      child: Text('$index番目'),
    );
  });

  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: tabs.length, vsync: this, initialIndex: 0);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('たすけあい'),
          bottom: TabBar(
            tabs: tabs,
            isScrollable: true,
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2.0,
            indicatorPadding:
                EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
            labelColor: Colors.white,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((tab) {
            return _createTab(tab);
          }).toList(),
        ));
  }

  Widget _createTab(Tab tab) {
    return const Center(
      child: Text(
        "10 min Rest Time",
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
