import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mark_space_app/config/routes/routes.dart';

import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/utils/ui/animations/scale_transition.dart'
    as MyScaleTransition;
import 'package:mark_space_app/widgets/teacher/home/carousel/carousel_items.dart';

class ClassCard extends StatefulWidget {
  final ClassData theClass;

  ClassCard({Key key, @required this.theClass}) : super(key: key);

  @override
  _ClassCardState createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
    _animation = MyScaleTransition.ScaleTransition(_controller).animation;
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ClassCardScreenItems _classCardScreenItems =
        new ClassCardScreenItems(this.widget.theClass);
    return ScaleTransition(
      scale: _animation,
      child: Center(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
                context,
                TEACHERS_CLASS_ROUTE,
                arguments: this.widget.theClass
            );
          },
          child: Card(
            child: CarouselSlider(
              options: CarouselOptions(height: MediaQuery.of(context).size.height/3, enlargeCenterPage: true),
              items: [
                _classCardScreenItems.first(),
                _classCardScreenItems.second(),
                _classCardScreenItems.third()
              ].map(
                (item) {
                  return Builder(
                    builder: (_) {
                      return item;
                    },
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
