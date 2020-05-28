import 'package:flutter/material.dart';

class NestTabPage extends StatefulWidget {
  NestTabPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NestTabPageState createState() => _NestTabPageState();
}

class _NestTabPageState extends State<NestTabPage>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TabBarView(
        children: <Widget>[
          NestedTabBar(),
          Center(child: Text("Email")),
          Center(child: Text("Settings")),
        ],
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          indicatorColor: Colors.teal,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.black54,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.email)),
            Tab(icon: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  @override
  State createState() => NestedTabBarState();
}

class NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: Colors.teal,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: <Widget>[
            Tab(text: "One"),
            Tab(text: "Two"),
            Tab(text: "Three"),
            Tab(text: "Four"),
            Tab(text: "Five"),
          ],
        ),
        Container(
          height: screenHeight * 0.7,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blueAccent,),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.orangeAccent,
                ),
                child: RaisedButton(
                  child: Text('상세 페이지'),
                  onPressed: () {
                    // Navigator.pushNamed(context, DetailPage.routeName, arguments: "이것은 파라미터")
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.greenAccent,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.indigoAccent,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
