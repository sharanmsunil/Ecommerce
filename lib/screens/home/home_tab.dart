import 'package:flutter/material.dart';
import 'homeall_tab.dart';
import 'jordan_tab.dart';

class Home_Tab extends StatefulWidget {
  const Home_Tab({super.key});

  @override
  State<Home_Tab> createState() => _Home_TabState();
}

class _Home_TabState extends State<Home_Tab> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'All Shoes',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          indicatorWeight: 4,
          tabs: <Widget>[
            Tab(
              child: Text('All'),
            ),
            Tab(
              child: Text('Lifestyle'),
            ),
            Tab(
              child: Text('Jordan'),
            ),
            Tab(
              child: Text('Running'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  <Widget>[
          Home_AllTab(),
          Center(
              child: Text(
            'Lifestyle',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
          Jordan_Tab(),
          Center(
              child: Text(
                'Running',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}


