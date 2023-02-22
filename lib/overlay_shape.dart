import 'package:flutter/material.dart';
import 'package:flutter_camera_overlay/model.dart';

class OverlayShape extends StatelessWidget {
  const OverlayShape(this.model, {Key? key}) : super(key: key);

  final OverlayModel model;

  @override
  Widget build(BuildContext context) {
    late double width;
    var media = MediaQuery.of(context);
    var size = media.size;
    if (model.widthTimes == null) {
      width = media.orientation == Orientation.portrait ? size.shortestSide * .9 : size.longestSide * .5;
    } else {
      width = media.orientation == Orientation.portrait
          ? size.shortestSide * model.widthTimes!
          : size.longestSide * model.widthTimes!;
    }

    double ratio = model.ratio as double;
    double height = width / ratio;
    double radius = model.cornerRadius == null ? 0 : model.cornerRadius! * height;

    return Stack(
      children: [
        Align(
            alignment: Alignment.center,
            child: Container(
              width: width,
              height: width / ratio,
              decoration: ShapeDecoration(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                      side: const BorderSide(width: 4, color: Color(0xFF717171)))),
            )),
        ColorFiltered(
          colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.srcOut),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: width,
                    height: width / ratio,
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(radius)),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
