import 'package:crv/shared/components/Relab.dart';
import 'package:crv/shared/constants/config.dart';
import 'package:crv/shared/helpers/layout.dart';
import 'package:crv/shared/helpers/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Color(0xffF4F4F4),
      content: Pad(
          p: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About us",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Pad(
                pt: 1,
                child: Text(
                  '''as you know finding a target for crv may be hard for some people, because someone else must pick a target for them, we automate the way of making a session easily .
we have plan for future versions to add group crv targets and more!''',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ),
              Pad(
                pt: 1,
                child: Row(
                  children: [
                    Text(
                      "telegram : ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                    GestureDetector(
                      onTap: () => openLink(Config.telegram_link),
                      child: Text(
                        "channel link",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff35B2F9)),
                      ),
                    )
                  ],
                ),
              ),
              Pad(
                pt: 2,
                child: Center(
                  child: Relab(),
                ),
              )
            ],
          )),
    );
  }
}
