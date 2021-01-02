import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:mark_space_app/modules/models/classes/preview_class.dart';
import 'package:mark_space_app/utils/services/classes/deserialize_classes_units_students.dart';
import 'package:mark_space_app/utils/ui/animations/scale_transition.dart'
    as MyScaleTransition;
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/widgets/teacher/home/carousel/carousel_items.dart';


class ClassCard extends StatefulWidget {
  final PreviewClass previewClassData;

  ClassCard({Key key, @required this.previewClassData}) : super(key: key);

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
        new ClassCardScreenItems(this.widget.previewClassData);
    return ScaleTransition(
      scale: _animation,
      child: Center(
        child: Card(
          child: MaterialButton(
            onPressed: () async {
              context.showLoaderOverlay();
              Navigator.pushNamed(context, TEACHERS_CLASS_ROUTE,
                  arguments:
                      await DeserializeClassesUnitsStudents.selectClass(this.widget.previewClassData.id));
              context.hideLoaderOverlay();
            },
            child: CarouselSlider(
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 3,
                  enlargeCenterPage: true),
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
