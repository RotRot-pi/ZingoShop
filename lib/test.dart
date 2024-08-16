import 'package:zingoshop/controller/test_controller.dart';
import 'package:zingoshop/view/widgets/handeling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<TestController>(builder: (controller) {
            return HandelingDataView(
                requestStatus: controller.requestStatus,
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: ((context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${controller.data}",
                          ),
                          const Divider()
                        ],
                      )),
                ));
          })),
    );
  }
}
