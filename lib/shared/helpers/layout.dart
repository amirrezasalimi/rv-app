import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

double space(double? f) {
  return 8 * (f ?? 0);
}

class Pad extends StatelessWidget {
  final Widget child;
  final double? p;

  final double? px;
  final double? py;

  final double? pr;
  final double? pl;
  final double? pt;
  final double? pb;

  Pad(
      {required this.child,
      this.p,
      this.px,
      this.py,
      this.pl,
      this.pr,
      this.pt,
      this.pb});

  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry padding = EdgeInsetsDirectional.only(
      end: this.pr != null ? space(this.pr) : 0,
      start: this.pl != null ? space(this.pl) : 0,
      top: this.pt != null ? space(this.pt) : 0,
      bottom: this.pb != null ? space(this.pb) : 0,
    )
        .add(EdgeInsets.symmetric(
            horizontal: space(this.px), vertical: space(this.py)))
        .add(EdgeInsets.all(space(this.p)));

    return Padding(padding: padding, child: this.child);
  }
}
