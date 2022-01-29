import 'package:crv/shared/constants/config.dart';
import 'package:crv/shared/helpers/layout.dart';
import 'package:crv/shared/helpers/url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Relab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openLink(Config.co_link),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/infinite-reality.png",
            width: 80,
            height: 40,
          ),
          Pad(
            pl: 1,
            child: Text(
              "Relab",
              style: TextStyle(
                  color: Color(0xffAD72DC),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}
