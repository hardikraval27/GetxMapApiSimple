import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/model_put.dart';

class HomeController extends GetxController {
  var putList = myput().obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchput();
  }

  Future<void> fetchput() async {
    Map body = {"name": "morpheus", "job": "zion resident"};

    final response =
        await http.post(Uri.parse('https://reqres.in/api/users/2'), body: body);
    final responsed = jsonDecode(response.body);

    if (response.statusCode == 201) {
      putList.value = myput.fromJson(responsed);
      isLoading.value = false;
      update();
    } else {
      Get.snackbar("title", "message");
    }
  }
}
