import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shehacks/community/lib/app/pages/dashboard/pages/home/widgets/sk_history_channel_item.dart';

class SKGroupChannelsWidget extends StatelessWidget {
  final bool canStart;
  final String title;

  const SKGroupChannelsWidget(
      {Key? key, required this.canStart, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: buildTitleRow(),
      initiallyExpanded: true,
      children: channels(),
    );
  }

  Row buildTitleRow() {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.notoSans(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        canStart
            ? const Icon(
                Icons.add,
                color: Colors.grey,
              )
            : Container()
      ],
    );
  }

  List<Widget> channels() {
    return [
      const SKHistoryChannel(isPrivate: true),
      const SKHistoryChannel(
        isPrivate: false,
      ),
      const SKHistoryChannel(isPrivate: true),
      const SKHistoryChannel(
        isPrivate: false,
      ),
      const SKHistoryChannel(isPrivate: true),
      const SKHistoryChannel(
        isPrivate: false,
      ),
      const SKHistoryChannel(isPrivate: true),
      const SKHistoryChannel(
        isPrivate: false,
      ),
      const SKHistoryChannel(isPrivate: true),
      const SKHistoryChannel(
        isPrivate: false,
      ),
    ];
  }
}
