import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Task"),
        backgroundColor: Colors.blueGrey,
      ),
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(Icons.home_filled),
      ),
    );
  }
}
