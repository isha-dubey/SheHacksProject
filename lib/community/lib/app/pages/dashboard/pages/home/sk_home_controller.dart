import 'package:get/get.dart';
import 'package:shehacks/community/lib/src/generated/protos/me/slack/slackbase.pbgrpc.dart';

class SKHomeController extends GetxController {
  final SlackServiceClient serviceClient = Get.find();

  @override
  void onInit() {
    super.onInit();
  }
}
