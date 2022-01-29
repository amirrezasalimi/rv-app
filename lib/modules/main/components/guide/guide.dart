import 'package:crv/shared/helpers/layout.dart';
import 'package:flutter/material.dart';

class Guide extends StatelessWidget {
  const Guide({Key? key}) : super(key: key);

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
                "Guide",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Pad(
                pt: 1,
                child: Text('Add Soon'),
              )
            ],
          )),
    );
  }
}
