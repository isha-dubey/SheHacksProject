import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shehacks/community/lib/app/pages/dashboard/controller/sl_dashboard_controller.dart';
import 'package:shehacks/community/lib/app/pages/dashboard/widgets/side_menu_footer.dart';
import 'package:shehacks/community/lib/src/generated/protos/me/slack/slackbase.pbgrpc.dart';

class SLHomeSide extends GetView<SLDashboardController> {
  const SLHomeSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<SLDashboardController>(),
      builder: (controller) {
        return Scaffold(
          appBar: workspaces(),
          body: organizationsList(),
        );
      },
    );
  }

  AppBar workspaces() {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: Text(
        "Workspaces",
        style: GoogleFonts.notoSans(
            textStyle: Get.textTheme.headline5!.copyWith(color: Colors.white),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  organizationsList() {
    return CustomScrollView(
      slivers: [
        StreamBuilder<SKUserWorkspaces>(
          builder: (context, data) {
            if (data.data != null) {
              return ListView(
                shrinkWrap: true,
                children: (data.data as SKUserWorkspaces)
                    .workspace
                    .map((e) => GestureDetector(
                          child: organizationRow(e),
                          onTap: () {
                            controller.toggleDrawer();
                          },
                        ))
                    .toList(),
              ).sliverBox;
            }
            print(data);
            return GestureDetector(
              child: organizationRow(),
              onTap: () {
                controller.toggleDrawer();
              },
            ).sliverBox;
          },
          stream: Get.find<SlackServiceClient>().getWorkspaces(Empty()),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: SideMenuFooter(
            options: [
              FooterOption(Icons.add_circle_outline, "Add a Workspace"),
              FooterOption(Icons.settings_outlined, "Preferences"),
              FooterOption(Icons.help_outline, "Help")
            ],
          ),
        ),
      ],
    );
  }

  Row organizationRow([SKWorkspace? workspace]) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 8, top: 16),
          width: 72,
          height: 72,
          decoration: outerDecoration(),
          child: organizationLogo(workspace),
        ),
        Expanded(
          child: orgDetails(workspace),
        )
      ],
    );
  }

  ListTile orgDetails([SKWorkspace? workspace]) {
    return ListTile(
      title: Text(
        workspace?.name ?? "mutualmobile",
        style: GoogleFonts.notoSans(
            fontWeight: FontWeight.bold, textStyle: Get.textTheme.headline6),
      ),
      subtitle: Text(
        workspace?.subdomain ?? "mutualmobile.slack.com",
        style: GoogleFonts.notoSans(textStyle: Get.textTheme.subtitle2),
      ),
      trailing: const Icon(
        Icons.more_horiz,
        color: Colors.white,
      ),
    );
  }

  Container organizationLogo([SKWorkspace? workspace]) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: 64,
      height: 64,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
              image: NetworkImage(workspace?.imageUrl ??
                  "https://avatars.slack-edge.com/2018-07-20/401750958992_1b07bb3c946bc863bfc6_88.png")),
          borderRadius: BorderRadius.circular(12)),
    );
  }

  BoxDecoration outerDecoration() {
    return BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Get.theme.dividerColor, width: 3),
        borderRadius: BorderRadius.circular(16));
  }
}
