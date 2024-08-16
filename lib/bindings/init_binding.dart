import 'package:zingoshop/core/classes/crud.dart';

import 'package:get/get.dart';

class InitialAppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
