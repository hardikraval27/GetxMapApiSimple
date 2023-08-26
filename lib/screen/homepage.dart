import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:putapi/controller/controllers.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: controller.isLoading.value
                ? CircularProgressIndicator()
                : Container(
                    margin: EdgeInsets.only(left: 150),
                    child: Column(
                      children: [
                        Text("${controller.putList.value.job}"),
                        Text("${controller.putList.value.name}"),
                        Text("${controller.putList.value.updatedAt}"),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
