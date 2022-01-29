import 'package:crv/modules/main/components/about-us/about-us.dart';
import 'package:crv/modules/main/components/history-item/history-item.dart';
import 'package:crv/modules/main/components/session-maker/sessionMaker.dart';
import 'package:crv/modules/main/controller.dart';
import 'package:crv/shared/components/telegram-button.dart';
import 'package:crv/shared/helpers/layout.dart';
import 'package:crv/shared/helpers/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Main extends GetView<MainController> {
  buildAppBar() {
    return PreferredSize(
        child: Pad(
            px: 2,
            py: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/icon_appbar.png",
                      width: 40,
                      height: 40,
                    ),
                    Pad(
                        pl: 1,
                        child: Text(
                          "Rv Assistant",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 24),
                        ))
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.dialog(
                    AboutUs(),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/question.svg",
                    width: 32,
                    height: 32,
                  ),
                )
              ],
            )),
        preferredSize: Size.fromHeight(40 + space(4)));
  }

  buildResourceItem(String title, String link) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
              color: Get.theme.primaryColor,
              borderRadius: BorderRadius.circular(4)),
        ),
        Pad(
          child: GestureDetector(
            onTap: () => openLink(link),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
            ),
          ),
          pl: 1,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(right: space(2), left: space(2)),
          children: [
            Text("Resource",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            Pad(
                pt: 1,
                child: Column(
                  children: [
                    buildResourceItem("reddit",
                        "https://www.reddit.com/r/remoteviewing/wiki/index"),
                    buildResourceItem(
                        "discord server", "https://discord.gg/XhuddrkQVK"),
                  ],
                  mainAxisSize: MainAxisSize.min,
                )),
            Pad(
              py: 3,
              child: TelegramButton(),
            ),
            Pad(
                child: AspectRatio(
                  aspectRatio: 16 / 3.5,
                  child: Image.asset(
                    "assets/images/global_banner.png",
                    fit: BoxFit.fill,
                  ),
                ),
                pb: 3),
            Obx(() => SessionMaker(
                isLoading: controller.isAddSessionLoading.value,
                onAdd: controller.add)),
            Pad(
              pt: 4,
              pb: 3,
              child: Text(
                "Session History",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
            Obx(() => Column(
                  children: List.generate(
                      controller.sessionsController.sessionsHistory.length,
                      (index) => Pad(
                            pb: 1,
                            child: HistoryItem(
                              session: controller
                                  .sessionsController.sessionsHistory[index],
                            ),
                          )),
                ))
          ],
        ),
      ),
    );
  }
}
