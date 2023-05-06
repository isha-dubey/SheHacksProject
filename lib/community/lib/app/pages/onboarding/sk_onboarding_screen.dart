import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shehacks/community/lib/app/pages/onboarding/sk_input_workspace_name.dart';
import 'package:shehacks/community/lib/app/pages/onboarding/sk_onboarding_controller.dart';

class SKOnboardingScreen extends GetView<SKOnboardingController> {
  const SKOnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<SKOnboardingController>(),
        builder: (SKOnboardingController controller) {
          return onBoardingScaffold(controller);
        });
  }

  Scaffold onBoardingScaffold(SKOnboardingController controller) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
          child: ElevatedButton(
        onPressed: () {
          controller.createWorkspace();
        },
        child: Text("Create a Chiro",
            style: GoogleFonts.notoSans(
                textStyle:
                    Get.textTheme.headline6!.copyWith(color: Colors.white))),
      ).paddingAll(12)),
      body: onboardingBody(controller),
    );
  }

  Center onboardingBody(SKOnboardingController controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          avatarContainer(),
          Text("Sign in to ChiroChat",
              style: GoogleFonts.notoSans(textStyle: Get.textTheme.headline6)),
          SKInputWorkspaceName((name) {
            controller.workspaceName = name;
          }),
          const Divider().marginSymmetric(horizontal: 12, vertical: 8),
          Text("Direct Messages",
              style: GoogleFonts.notoSans(textStyle: Get.textTheme.headline6)),
        ],
      ),
    );
  }

  Widget avatarContainer() {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.only(right: 8),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: const DecorationImage(
                image: NetworkImage(
                    "https://avatars.slack-edge.com/2018-07-20/401750958992_1b07bb3c946bc863bfc6_88.png")),
            borderRadius: BorderRadius.circular(8)),
      ),
    ).marginOnly(bottom: 16);
  }
}
