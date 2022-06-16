import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:rest_api_practice2/models/post_model.dart';

class MyHomePageController extends GetxController {
  var myPostList = <PostModel>[].obs;

  @override
  void onInit() {
    _getRestApi();
    super.onInit();
  }

  void _getRestApi() async {
    Dio _dio = Dio();
    var myUrl = "https://jsonplaceholder.typicode.com/posts";

    var mapParameter = {
      "userName": "Manik",
      "userId": "101",
      "userAddress": "Cumilla",
      "userPhone": "01629994330",
    };

    var headerMap = {
      "userName": "Manik",
      "userId": "101",
      "userAddress": "Cumilla",
      "userPhone": "01629994330",
    };

    try {
      EasyLoading.show();
      var response = await _dio.get(
        myUrl,
        queryParameters: mapParameter,
        options: Options(headers: headerMap),
      );

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        var myData = response.data as List;
        var myReceiveList = myData.map((e) => PostModel.fromJson(e)).toList();
        myPostList.value.addAll(myReceiveList);
      } else {
        print("Data Not Found");
      }
    } catch (e) {
      print(e);
    }
  }
}
