import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            flexibleSpace: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            unselectedLabelColor: Colors.black87,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.redAccent),
                            tabs: [
                              Tab(
                                text: "APP",
                              ),
                              Tab(
                                text: "Game",
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          Container(
            color: Colors.brown[50],
            child: Center(
              child: Text("App"),
            ),
          ),
          Center(
            child: Text("Game"),
          ),
        ]),
      ),
    );
  }
}

//TabBarView(children: [
//            Container(
//              color: Colors.brown[50],
//              child: Center(
//                child: Text("App"),
//              ),
//            ),
//            Center(
//              child: Text("Game"),
//            ),
//          ]),

//Padding(
//              padding: const EdgeInsets.only(top: 25),
//              child: Column(
//                children: [
//                  TabBar(
//                      indicatorSize: TabBarIndicatorSize.tab,
//                      unselectedLabelColor: Colors.black87,
//                      indicator: BoxDecoration(
//                          borderRadius: BorderRadius.circular(50),
//                          color: Colors.redAccent),
//                      tabs: [
//                        Tab(
//                          text: "APP",
//                        ),
//                        Tab(
//                          text: "Game",
//                        ),
//                      ]),
//                ],
//              ),
//            ),
