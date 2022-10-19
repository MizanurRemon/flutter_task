import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_task/Model/Details_response.dart';
import 'package:flutter_task/Model/User_response.dart';
import 'package:flutter_task/const/Urls.dart';

var dio = Dio();

class APiServices {
  Future<DetailsResponse> getDetails(String id) async {
    Response response = await dio.get("${Urls().BASE_URL}todos/$id");

    if (response.statusCode == 200) {
      // print(response.data);
      DetailsResponse detailsResponse = DetailsResponse.fromJson(response.data);

      //print(detailsResponse.data.toString());
      return detailsResponse;
    } else {
      throw Exception('Failed to fetch.');
    }
  }

  Future<List<UserResponse>> getToDoList(String page, String limit) async {
    final response = await dio.get("${Urls().BASE_URL}todos",
        queryParameters: {"page": page, "limit": limit});

    //print("page: ${page} limit: ${limit}" + response.statusCode.toString());
    if (response.statusCode == 200) {
      List jsonResponse = response.data;
      print(response.data);
      return jsonResponse.map((data) => UserResponse.fromJson(data)).toList();
      //final List<dynamic> data = response.data;
      //return data.map((dynamic e) => UserResponse.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load from API');
    }
  }
}
