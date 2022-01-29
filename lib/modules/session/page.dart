import 'dart:ui';

import 'package:crv/modules/session/controller.dart';
import 'package:crv/shared/helpers/layout.dart';
import 'package:crv/shared/models/session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Session extends GetView<SessionPageController> {
  buildStatusItem(String title, Function() onTap, bool isActive) {
    return Pad(
      pr: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                  color: isActive ? Colors.blueAccent : Colors.white),
              color: Color(0xffECECEC)),
          child: Pad(
            px: 1.5,
            py: .5,
            child: Text(title),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
              "${controller.currentSession.value.key} - ${controller.currentSession.value.title}",
              style: TextStyle(color: Colors.black),
            )),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 24,
          color: Colors.black,
          onPressed: () => Get.close(1),
        ),
        actions: [
          IconButton(
              onPressed: () async => {
                    await Get.dialog(AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        content: Pad(
                          pt: 3,
                          pr: 3,
                          pl: 3,
                          pb: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Remove Session?",
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w500),
                              ),
                              Pad(
                                pt: 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text("Cancel")),
                                    TextButton(
                                        onPressed: controller.removeSession,
                                        child: Text("Remove"))
                                  ],
                                ),
                              )
                            ],
                          ),
                        )))
                  },
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(space(2)),
        physics: BouncingScrollPhysics(),
        children: [
          Obx(
            () => TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blueAccent)),
              onPressed: controller.showTargets,
              child: Pad(
                p: 1,
                child: Text(
                  controller.showTargetsPictures.value
                      ? "hide targets"
                      : "show targets",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Pad(
            pt: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Set your session status",
                  style: TextStyle(fontSize: 18),
                ),
                Pad(
                    pt: 1,
                    child: Obx(
                      () => Row(
                        children: [
                          Text(
                            "Status: ",
                            style: TextStyle(fontSize: 16),
                          ),
                          Pad(
                            pl: 1,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                buildStatusItem(
                                    "correct",
                                    () => controller
                                        .setStatus(SessionStatus.Correct),
                                    controller.currentSession.value.status ==
                                        SessionStatus.Correct),
                                buildStatusItem(
                                    "in progress",
                                    () => controller
                                        .setStatus(SessionStatus.inProgress),
                                    controller.currentSession.value.status ==
                                        SessionStatus.inProgress),
                                buildStatusItem(
                                    "wrong",
                                    () => controller
                                        .setStatus(SessionStatus.Wrong),
                                    controller.currentSession.value.status ==
                                        SessionStatus.Wrong)
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Pad(
            pt: 4,
            child: Obx(() => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      controller.currentSession.value.targets.length, (index) {
                    var target = controller.currentSession.value.targets[index];
                    return Pad(
                      pb: 4,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    color: Color(0xffF6A8FF),
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              Pad(
                                pl: 1.5,
                                child: Text(
                                  "${target.id} - ${target.title}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                          Pad(
                            pt: 3,
                            pl: 1.5,
                            child: AspectRatio(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                      image: new NetworkImage(
                                          target.picture ?? ""),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: new BackdropFilter(
                                    filter: new ImageFilter.blur(
                                        sigmaX:
                                            controller.showTargetsPictures.value
                                                ? 0.001
                                                : 30.0,
                                        sigmaY:
                                            controller.showTargetsPictures.value
                                                ? 0.001
                                                : 30.0),
                                    child: new Container(
                                      decoration: new BoxDecoration(
                                          color: Colors.white.withOpacity(
                                              controller
                                                      .showTargetsPictures.value
                                                  ? 0
                                                  : 0.6)),
                                    ),
                                  ),
                                ),
                              ),
                              aspectRatio: 16 / 14,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                )),
          )
        ],
      ),
    ));
  }
}
