import 'package:flutter/cupertino.dart';

class CircleTabIndicator extends Decoration {

  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
    :_painter = CirclePainter(color, radius);


  @override
  BoxPainter createBoxPainter([onChanged]) {
    // TODO: implement createBoxPainter
    return _painter;
  }
  
}

class CirclePainter extends BoxPainter{

  final Paint _paint;
  final double radius;

  CirclePainter(Color color, this.radius) 
    : _paint = Paint()
    ..color = color
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    
    final Offset circleOffset = offset + Offset(configuration.size.width / 2, configuration.size.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
  
}