import 'package:crv/shared/constants/config.dart';
import 'package:crv/shared/helpers/layout.dart';
import 'package:crv/shared/components/Relab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Splash extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            heightFactor: 0.8,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    FractionallySizedBox(
                      child: Image.asset("assets/images/crv_logo.png"),
                      widthFactor: 0.6,
                    ),
                    Pad(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Rv Assistant",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Get.theme.primaryColor,
                                    fontWeight: FontWeight.bold)),
                            Pad(
                              pl: 1,
                              child: Text("v ${Config.version}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ],
                        ),
                        pt: 2)
                  ],
                ),
                Pad(child: Relab(), pb: 4)
              ],
            ),
          ),
        )
      ],
    )));
  }
}
