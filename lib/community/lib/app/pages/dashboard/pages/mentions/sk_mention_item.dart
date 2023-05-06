import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shehacks/community/lib/app/pages/dashboard/pages/mentions/sk_emoji_image.dart';

class SKMentionItem extends StatelessWidget {
  const SKMentionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SKEmojiImage(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: mentionText()),
                  Text("57m",
                          style: GoogleFonts.notoSans(
                              textStyle: Get.textTheme.caption))
                      .paddingOnly(left: 8)
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              Text(
                "Anmol Verma",
                style: GoogleFonts.notoSans(
                    textStyle: Get.textTheme.subtitle1!
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
              Text(
                  "@here I will be on PTO tomorrow. Please let me know if there's something needed from me",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.notoSans(
                      textStyle: Get.textTheme.subtitle2!
                          .copyWith(fontWeight: FontWeight.w400))),
              Text(
                "👍🏽 1",
                style: GoogleFonts.notoColorEmojiCompat(
                    textStyle: Get.textTheme.subtitle2),
              )
            ],
          ).paddingAll(8),
        )
      ],
    );
  }

  Widget mentionText() {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "Carl Jules ",
          style: GoogleFonts.notoSans(
              fontWeight: FontWeight.bold,
              color: Get.textTheme.subtitle1!.color!)),
      TextSpan(
          text: "reacted in",
          style: GoogleFonts.notoSans(color: Get.textTheme.subtitle1!.color!)),
      TextSpan(
          text: " 🔒 prj-someproject-int",
          style: GoogleFonts.notoSans(
              fontWeight: FontWeight.bold,
              color: Get.textTheme.subtitle1!.color!))
    ]));
  }
}
