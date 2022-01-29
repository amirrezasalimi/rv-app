import 'package:crv/shared/constants/routes.dart';
import 'package:crv/shared/helpers/layout.dart';
import 'package:crv/shared/models/session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryItem extends StatelessWidget {
  final SessionItem session;
  const HistoryItem({required this.session, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        Get.toNamed(Routes.SESSION, arguments: [session.key]);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Pad(
            px: 2,
            py: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 25,
                      child: Text(
                        "${session.key}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          session.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        Text("local | ${this.session.targets.length} targets")
                      ],
                    ),
                    Pad(
                        pl: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffF6A8FF),
                              borderRadius: BorderRadius.circular(4)),
                          child: Pad(
                            px: 1,
                            py: 1,
                            child: Text(
                              "+1 exp",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ))
                  ],
                ),
                Icon(Icons.arrow_forward_ios_outlined)
              ],
            )),
      ),
    );
  }
}
