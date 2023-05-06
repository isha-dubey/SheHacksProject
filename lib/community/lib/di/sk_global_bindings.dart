import 'package:get/get.dart';
import 'package:shehacks/community/lib/data/grpc/sk_grpc_client.dart';
import 'package:shehacks/community/lib/src/generated/protos/me/slack/slackbase.pbgrpc.dart';

class SKGlobalBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SKGrpcClient());
    final SlackServiceClient serviceClient =
        SlackServiceClient(Get.find<SKGrpcClient>().grpcClientChannel());
    Get.put(serviceClient);
  }
}
