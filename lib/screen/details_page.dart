import 'package:flutter/material.dart';
import 'package:flutter_task/APIServices.dart';
import 'package:flutter_task/Model/Details_response.dart';

import '../const/MyTextStyle.dart';

class DetailsPage extends StatefulWidget {
  var itemID;

  DetailsPage(this.itemID);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var pageTitle = "Details";
  var userID = "", id = "", title = "";
  var status;
  var itemID;
  var value = 10.0;
  DetailsResponse detailsResponse = DetailsResponse();

  @override
  void initState() {
    // TODO: implement initState
    itemID = widget.itemID;

    print("id $itemID");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  buildBody(BuildContext context) {
    return FutureBuilder<DetailsResponse>(
        future: APiServices().getDetails(itemID),
        builder: (context, snapshot) {
          //print("model data ${detailsResponse.title}");

          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              padding: EdgeInsets.all(value),
              child: Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(value),
                            color: Colors.blueGrey,
                            child: Center(
                              child: Text(
                                "UserID: ${snapshot.data?.userId.toString()}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(value),
                            color: Colors.deepPurple,
                            child: Center(
                              child: Text(
                                "ID: ${snapshot.data?.id.toString()}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.transparent,
                    ),
                    Container(
                      padding: EdgeInsets.all(value),
                      child: Row(
                        children: [
                          Text(
                            "title: ${snapshot.data?.title.toString()}",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Checkbox(
                                value: snapshot.data?.completed,
                                onChanged: null,
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.all(Colors.black),
                              ),
                              //Text(status ? "Completed" : "Not Completed")
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        });
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: Text(pageTitle, style: MyTextStyle().appbarText()),
      backgroundColor: Colors.blueGrey,
    );
  }
}
