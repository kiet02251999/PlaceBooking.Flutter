import 'package:booking_place/src/utils/device_utils.dart';
import 'package:flutter/material.dart';

//

class BackgroundHeaderBox extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color color;

  const BackgroundHeaderBox({
    Key key,
    this.child,
    this.borderRadius = 20.0,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget current = child;

    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: borderRadius),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO( 207, 5, 211, 1),
                  Color.fromRGBO(236, 104, 77, 1)
                ],
              ),
            ),
            child: current,
          ),
          Positioned(
            bottom: -2,
            left: 0,
            child: Container(
              height: borderRadius,
              width: DeviceUtils.getScaledWidth(context, 1),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
