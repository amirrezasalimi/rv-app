import 'package:crv/shared/constants/config.dart';
import 'package:crv/shared/helpers/layout.dart';
import 'package:crv/shared/helpers/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TelegramButton extends StatelessWidget {
  const TelegramButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openLink(Config.telegram_link),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff35B2F9), borderRadius: BorderRadius.circular(8)),
        child: Pad(
          py: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Join Telegram",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Pad(
                pl: 1,
                child: SvgPicture.asset(
                  "assets/icons/telegram.svg",
                  width: 32,
                  height: 32,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
