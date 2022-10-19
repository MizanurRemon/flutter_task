import 'package:flutter_task/APIServices.dart';
import 'package:flutter_task/Model/User_response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class TodosController extends GetxController {
  var users = <UserResponse>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchList();
  }

  fetchList() async {
    APiServices().getToDoList("1", "10").then((value) {
      print("datas " + value.toString());
      return users.value = value;
    });


  }
}
