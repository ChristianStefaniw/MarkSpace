import 'package:flutter/material.dart';

class BootstrapContainer extends StatelessWidget {
  BootstrapContainer({
    Key key,
    @required this.children,
    this.fluid = false,
    this.decoration,
    this.padding,
  }) : super(key: key);

  final bool fluid;

  final BoxDecoration decoration;

  final List<Widget> children;

  final EdgeInsets padding;


  double _getMaxWidth(double width) {
    if (this.fluid) {
      return width;
    }

    return bootstrapMaxWidthNonFluid(width);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = _getMaxWidth(constraints.maxWidth);

        Widget widget = Container(
          width: width,
          decoration: decoration,
          child: Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            children: children,
          ),
        );

        if (padding != null) {
          widget = Padding(
            padding: padding,
            child: widget,
          );
        }

        return Align(
          alignment: Alignment.topCenter,
          child: widget,
        );
      },
    );
  }
}


double bootstrapMaxWidthNonFluid(double width) {
  if (width >= 1200) {
    return 1140;
  }
  if (width >= 992) {
    return 960;
  }
  if (width >= 768) {
    return 720;
  }
  if (width >= 576) {
    return 540;
  }
  return width;
}