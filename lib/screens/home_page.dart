import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/my_tab_bar.dart';
import 'package:flutter_app/widgets/recent_chats.dart';

import '../app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.kPrimaryColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        title: Text('Nice Chat', style: MyTheme.kAppTitle),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt))],
        elevation: 0,
      ),
      backgroundColor: MyTheme.kPrimaryColor,
      body: Column(
        children: [

          MyTabBar(tabController: tabController),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: TabBarView(
                controller: tabController,
                children: [
                  Column(
                    children: [
                      RecentChats(),
                    ],
                  ),
                  Center(
                    child: Text('Status'),
                  ),
                  Center(
                    child: Text('Call'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
