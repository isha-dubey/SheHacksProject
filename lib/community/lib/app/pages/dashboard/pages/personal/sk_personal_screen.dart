import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shehacks/community/lib/app/pages/dashboard/widgets/side_menu_footer.dart';
import 'package:shehacks/community/lib/app/pages/set_status/sk_setstatus_screen.dart';

class SKPersonalScreen extends StatelessWidget {
  const SKPersonalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "You",
          style: GoogleFonts.notoSans(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: CustomScrollView(
        slivers: [
          const SizedBox(
            height: 8,
          ).sliverBox,
          profileYou().sliverBox,
          whatsStatus().sliverBox,
          footerItem(FooterOption(
                  Icons.notifications_off_outlined, "Pause Notifications"))
              .sliverBox,
          footerItem(FooterOption(Icons.no_accounts, "Set yourself as away"))
              .sliverBox,
          Divider().sliverBox,
          footerItem(FooterOption(Icons.bookmark_outline, "Saved items"))
              .sliverBox,
          footerItem(FooterOption(Icons.person_outline, "View profile"))
              .sliverBox,
          footerItem(FooterOption(Icons.phone_android, "Notifications"))
              .sliverBox,
          footerItem(FooterOption(Icons.settings_outlined, "Preferences"))
              .sliverBox,
        ],
      ),
    );
  }

  Widget whatsStatus() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      // TODO fix borders for theme.
      decoration: BoxDecoration(
          border: Border.all(color: Get.theme.dividerColor, width: 1),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        child: whatsYourStatus(),
        onTap: () {
          showStatusBottomSheet();
        },
      ),
    );
  }

  whatsYourStatus() {
    return Row(
      children: [
        const Icon(
          Icons.emoji_emotions_outlined,
        ).marginOnly(right: 8),
        Expanded(
          child: Text(
            "What's your status?",
            style: GoogleFonts.notoSans(textStyle: Get.textTheme.subtitle1),
          ),
        )
      ],
    ).paddingAll(12);
  }

  Widget profileYou() {
    return ListTile(
      leading: Container(
        child: const SizedBox(
          height: 56,
          width: 56,
        ),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: const DecorationImage(
                image: NetworkImage(
                    "https://ca.slack-edge.com/T02TLUWLZ-U2ZG961MW-2bda0fcef939-512")),
            borderRadius: BorderRadius.circular(8),
            color: Colors.brown),
      ),
      title: Text(
        "Anmol Verma",
        style: GoogleFonts.notoSans(textStyle: Get.textTheme.headline6),
      ),
      subtitle: Text("Active",
          style: GoogleFonts.notoSans(textStyle: Get.textTheme.subtitle1)),
    );
  }

  Widget footerItem(FooterOption e) {
    return Row(
      children: [
        Icon(
          e.icon,
        ).marginOnly(right: 16),
        Expanded(
          child: Text(e.name,
              style: GoogleFonts.notoSans(textStyle: Get.textTheme.subtitle1)),
        )
      ],
    ).paddingAll(4).marginOnly(left: 16, top: 16);
  }
}

showStatusBottomSheet() {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (context) {
        return DraggableScrollableSheet(
            initialChildSize: 0.8,
            maxChildSize: 0.9,
            minChildSize: 0.8,
            builder: (context, controller) {
              return SKSetStatusScreen(controller);
            });
      });
}
