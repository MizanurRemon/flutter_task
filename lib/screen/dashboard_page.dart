import 'package:flutter/material.dart';
import 'package:flutter_task/APIServices.dart';
import 'package:flutter_task/Model/User_response.dart';
import 'package:flutter_task/screen/details_page.dart';

import '../const/MyTransition.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var value = 10.0;
  var itemID;
  var page = "1", limit = "10";

  @override
  void initState() {
    // TODO: implement initState
    //APiServices().getToDoList("1", "10");
    super.initState();
  }

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
    /*return Center(
      child: ElevatedButton(
          onPressed: () {
            itemID = "2";
            MyTransition(context: context).push(DetailsPage(itemID));
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(value),
                //side: BorderSide(color: Colors.red),
              ),
            ),
          ),
          child: const Text("Go To next")),
    );*/
    return Container(
      color: Colors.grey.shade100,
      padding: EdgeInsets.all(value),
      child: FutureBuilder<List<UserResponse>>(
        future: APiServices().getToDoList(page, limit),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<UserResponse>? data = snapshot.data as List<UserResponse>;
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: Card(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(value),
                          width: MediaQuery.of(context).size.width - 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "UserID: ${data[index].userId.toString()}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "ID: ${data[index].id.toString()}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                    flex: 1,
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.transparent,
                              ),
                              Text(
                                "title: ${data[index].title.toString()}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Checkbox(
                          value: data[index].completed,
                          onChanged: null,
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.all(Colors.black),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      itemID = data[index].id.toString();
                      MyTransition(context: context).push(DetailsPage(itemID));
                    });
                  },
                );
              },
              itemCount: data.length,
            );
          }

          return Center(child: const CircularProgressIndicator(),);
        },
      ),
    );
  }
}
