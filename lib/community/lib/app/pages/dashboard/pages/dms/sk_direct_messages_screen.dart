import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shehacks/community/lib/app/pages/dashboard/pages/dms/sk_dm_item.dart';
import 'package:shehacks/community/lib/app/pages/dashboard/pages/home/widgets/sk_home_jumpto.dart';

class SKDirectMessagesScreen extends StatelessWidget {
  const SKDirectMessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Get.theme.primaryColor,
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Direct Messages",
          style: GoogleFonts.notoSans(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: CustomScrollView(
        slivers: [
          const SKHomeJumpTo().sliverBox,
          const SKDirectMessageItem().sliverBox,
          const SKDirectMessageItem().sliverBox,
          const SKDirectMessageItem().sliverBox,
          const SKDirectMessageItem().sliverBox,
          const SKDirectMessageItem().sliverBox,
          const SKDirectMessageItem().sliverBox,
          const SKDirectMessageItem().sliverBox,
          const SKDirectMessageItem().sliverBox,
          const SKDirectMessageItem().sliverBox,
          const SKDirectMessageItem().sliverBox,
          const SKDirectMessageItem().sliverBox,
          const SKDirectMessageItem().sliverBox,
          const SKDirectMessageItem().sliverBox,
          const SKDirectMessageItem().sliverBox,
        ],
      ),
    );
  }
}
