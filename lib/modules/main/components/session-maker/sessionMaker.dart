import 'package:crv/shared/helpers/layout.dart';
import 'package:crv/shared/models/session-target.dart';
import 'package:crv/shared/models/session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SessionMaker extends StatefulWidget {
  final bool isLoading;
  final Function(SessionItem session) onAdd;

  SessionMaker({required this.onAdd, this.isLoading = false, Key? key})
      : super(key: key);

  @override
  _SessionMakerState createState() => _SessionMakerState();
}

class _SessionMakerState extends State<SessionMaker> {
  final TextEditingController textController = TextEditingController();
  final TextEditingController titleTextController = TextEditingController();

  List<SessionTarget> targets = [];

  add() {
    setState(() {
      final target = SessionTarget();
      target.title = textController.text;
      targets.add(target);
      textController.text = "";
    });
  }

  delete(int index) {
    setState(() {
      targets.removeAt(index);
    });
  }

  changeTitle(int index, String value) {
    setState(() {
      targets[index].title = value;
    });
  }

  make() {
    setState(() {
      final session = SessionItem();
      session.targets = targets;
      session.title = titleTextController.text;
      widget.onAdd(session);
      targets.clear();
      titleTextController.text = "";
      textController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade100, blurRadius: 4, spreadRadius: 3)
          ]),
      child: Pad(
          px: 2,
          py: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Session Maker",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
/*                  GestureDetector(
                    onTap: () => {},
                    child: SvgPicture.asset(
                      "assets/icons/question.svg",
                      width: 32,
                      height: 32,
                    ),
                  )*/
                ],
              ),
              Pad(
                  pt: 2,
                  child: TextField(
                    controller: titleTextController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Title',
                    ),
                  )),
              Pad(
                pt: 3,
                pb: 1,
                child: Text(
                  "Options",
                  textAlign: TextAlign.left,
                ),
              ),
              Column(
                children: List.generate(targets.length, (index) {
                  return Pad(
                      px: 1,
                      pb: 2,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 18,
                            child: Pad(
                                pt: 1.5,
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ),
                          Flexible(
                            child: TextFormField(
                              initialValue: targets[index].title,
                              onChanged: (value) => changeTitle(index, value),
                              style: TextStyle(fontSize: 12, height: 2.0),
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  isDense: true),
                            ),
                            flex: 8,
                          ),
                          Flexible(
                              child: Pad(
                                  pt: 2,
                                  pl: 1,
                                  child: GestureDetector(
                                    onTap: () => delete(index),
                                    child: Icon(Icons.close),
                                  )))
                        ],
                      ));
                }),
              ),
              Pad(
                  px: 1,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: textController,
                          style: TextStyle(fontSize: 12, height: 2.0),
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(), isDense: true),
                        ),
                        flex: 9,
                      ),
                      Flexible(
                          child: Pad(
                              pt: 2,
                              pl: 1,
                              child: GestureDetector(
                                onTap: add,
                                child: Icon(Icons.add_outlined),
                              )))
                    ],
                  )),
              Pad(
                pt: 4,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Get.theme.primaryColor)),
                  onPressed: widget.isLoading==false?make:null,
                  child: Text(
                    "make${widget.isLoading?"...":""}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
