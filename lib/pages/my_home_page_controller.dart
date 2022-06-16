import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rest_api_practice2/controllers/my_home_page_controller.dart';

class MyHomePage extends GetView<MyHomePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest Api Practice2"),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.myPostList.length ?? 0,
          itemBuilder: (context, index) => ListTile(
            title: Text("${controller.myPostList[index].title}"),
            subtitle: Text("${controller.myPostList[index].id}"),
          ),
        ),
      ),
    );
  }
}
