import 'package:get/get.dart';
import 'package:shehacks/community/lib/navigation/routes.dart';

class SKOnboardingController extends GetxController {
  var workspaceName = "";

  createWorkspace() {
    if (workspaceName.trim().isNotEmpty) {
      Get.offAllNamed(RouteNames.home);
    }
  }
}
