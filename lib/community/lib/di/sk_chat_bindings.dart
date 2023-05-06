import 'package:get/get.dart';
import 'package:shehacks/community/lib/app/pages/chat/sk_chat_controller.dart';

class SKChatBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SKChatController());
  }
}
