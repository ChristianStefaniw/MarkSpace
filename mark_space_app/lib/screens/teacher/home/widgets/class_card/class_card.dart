import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mark_space_app/utils/services/deserialization/deserialize.dart';
import 'package:provider/provider.dart';

import 'package:mark_space_app/modules/models/classes/preview_class.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'package:mark_space_app/screens/teacher/home/widgets/carousel/carousel_items.dart';
import 'package:mark_space_app/utils/ui/animations/scale_transition.dart'
as MyScaleTransition;
import 'package:mark_space_app/config/routes/routes.dart';


class ClassCard extends StatefulWidget {
  final PreviewClass previewClassData;

  ClassCard({Key key, @required this.previewClassData}) : super(key: key);

  @override
  _ClassCardState createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  ClassCardScreenItems _classCardScreenItems;

  @override
  void initState() {
    super.initState();
    _classCardScreenItems =
    new ClassCardScreenItems(this.widget.previewClassData);
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )
      ..forward();
    _animation = MyScaleTransition
        .ScaleTransition(_controller)
        .animation;
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
    return ScaleTransition(
      scale: _animation,
      child: Center(
        child: Card(
          child: MaterialButton(
            onPressed: () async {
              context.showLoaderOverlay();
              Provider
                  .of<ClassDataProvider>(context, listen: false)
                  .classData =
              await Deserialize.selectClass(
                  this.widget.previewClassData.id);

              Navigator.pushNamed(context, TEACHERS_CLASS);

              context.hideLoaderOverlay();
            },
            child: CarouselSlider(
              options: CarouselOptions(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 3,
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
