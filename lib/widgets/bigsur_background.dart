import 'package:flutter/material.dart';

class BigSurBackground extends StatefulWidget {
  const BigSurBackground({super.key});

  @override
  State<StatefulWidget> createState() => _BigSurBackgroundState();
}

class _BigSurBackgroundState extends State<BigSurBackground> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CustomPaint(
          painter: Layer8(width: size.width, height: size.height),
        ),
        CustomPaint(
          painter: Layer7(width: size.width, height: size.height),
        ),
        Opacity(
          opacity: 1,
          child: CustomPaint(
            painter: Layer6(width: size.width, height: size.height),
          )
        ),  
        CustomPaint(
          painter: Layer5(width: size.width, height: size.height),
        ),
        Opacity(
          opacity: 1,
          child: CustomPaint(
            painter: Layer4(width: size.width, height: size.height),
          )
        ),
        Opacity(
          opacity: 1,
          child: CustomPaint(
            painter: Layer3(width: size.width, height: size.height),
          )
        ),
        CustomPaint(
          painter: Layer2(width: size.width, height: size.height),
        )
      ],
    );
  }
}

class Layer1 extends CustomPainter {
  final double width;
  final double height;

  Layer1({
    required this.width,
    required this.height
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black.withOpacity(0.75)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final path = Path();
    path.moveTo(0, height * 0.68);
    path.quadraticBezierTo(width * 0.1, height * 0.8, width * 0.6, height);
    path.lineTo(0, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer2 extends CustomPainter {
  final double width;
  final double height;

  Layer2({
    required this.width,
    required this.height
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 229, 52, 68),
          Color.fromARGB(255, 87, 58, 114)
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.725, 0.9],
        transform: GradientRotation(5.75)
      ).createShader(Rect.fromCenter(center: Offset(width / 2,height / 2), width: width, height: height))
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final path = Path();
    path.moveTo(0, height * 0.42);
    path.quadraticBezierTo(width * 0.1, height * 0.66, width * 0.2, height * 0.65);
    path.quadraticBezierTo(width * 0.3, height * 0.67, width * 0.45, height * 0.75);
    path.quadraticBezierTo(width * 0.78, height * 1.0, width * 0.8, height);
    path.lineTo(width, height);
    path.lineTo(0, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer3 extends CustomPainter {
  final double width;
  final double height;

  Layer3({
    required this.width,
    required this.height
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color.fromARGB(255, 221, 72, 109), Color.fromARGB(255, 233, 106, 87)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.4, 0.6],
        transform: GradientRotation(0.3)
      ).createShader(Rect.fromCenter(center: Offset(width / 2,height / 2), width: width, height: height))
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final path = Path();
    path.lineTo(0, height * 0.24);
    path.quadraticBezierTo(width * 0.125, height * 0.16, width * 0.25, height * 0.3);
    path.quadraticBezierTo(width * 0.34, height * 0.42, width * 0.4, height * 0.42);
    path.quadraticBezierTo(width * 0.52, height * 0.455, width * 0.57, height * 0.52);
    path.quadraticBezierTo(width * 0.65, height * 0.615, width * 0.78, height * 0.63);
    path.quadraticBezierTo(width * 0.85, height * 0.63, width * 0.89, height * 0.68);
    path.quadraticBezierTo(width * 0.91, height * 0.71, width * 0.95, height * 0.8);
    path.quadraticBezierTo(width * 0.98, height * 0.84, width, height * 0.78);
    path.lineTo(width, height);
    path.lineTo(0, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer4 extends CustomPainter {
  final double width;
  final double height;

  Layer4({
    required this.width,
    required this.height
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color.fromARGB(255, 240, 165, 83), Color.fromARGB(255, 250, 212, 87)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.3, 0.5],
        transform: GradientRotation(0.24)
      ).createShader(Rect.fromCenter(center: Offset(width / 2,height / 2), width: width, height: height))
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final path = Path();
    path.moveTo(0, height * 0.3);
    path.quadraticBezierTo(width * 0.35, height * 0.5, width * 0.6, height * 0.5);
    path.quadraticBezierTo(width * 0.85, height * 0.54, width * 0.95, height * 0.6);
    path.quadraticBezierTo(width * 0.99, height * 0.62, width, height * 0.61);
    path.lineTo(width, height);
    path.lineTo(0, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer5 extends CustomPainter {
  final double width;
  final double height;

  Layer5({
    required this.width,
    required this.height
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 184, 200, 236), 
          Color.fromARGB(255, 229, 239, 250)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.32, 0.42],
        transform: GradientRotation(0.24)
      ).createShader(Rect.fromCenter(center: Offset(width / 2,height / 2), width: width, height: height))
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final path = Path();
    path.lineTo(0, height * 0.28);
    path.quadraticBezierTo(width * 0.2, height * 0.38, width * 0.5, height * 0.32);
    path.quadraticBezierTo(width * 0.58, height * 0.31, width * 0.6, height * 0.34);
    path.quadraticBezierTo(width * 0.61, height * 0.36, width * 0.63, height * 0.35);
    path.quadraticBezierTo(width * 0.69, height * 0.36, width * 0.76, height * 0.42);
    path.quadraticBezierTo(width * 0.85, height * 0.48, width * 0.92, height * 0.45);
    path.quadraticBezierTo(width * 0.98, height * 0.43, width, height * 0.45);
    
    path.lineTo(width, height);
    path.lineTo(0, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer6 extends CustomPainter {
  final double width;
  final double height;

  Layer6({
    required this.width,
    required this.height
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 141, 201, 248), 
          Color.fromARGB(255, 48, 105, 165)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.1, 0.8],
      ).createShader(Rect.fromCenter(center: Offset(width / 2,height / 2), width: width, height: height))
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final path = Path();
    path.quadraticBezierTo(width * 0.2, height * 0.2, width * 0.4, height * 0.2);
    path.quadraticBezierTo(width * 0.55, height * 0.2, width * 0.65, height * 0.3);
    path.quadraticBezierTo(width * 0.76, height * 0.4, width * 0.89, height * 0.38);
    path.quadraticBezierTo(width * 0.95, height * 0.37, width, height * 0.4);
    
    path.lineTo(width, height);
    path.lineTo(0, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer7 extends CustomPainter {
  final double width;
  final double height;

  Layer7({
    required this.width,
    required this.height
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 120, 181, 228), 
          Color.fromARGB(255, 56, 115, 179)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.35, 0.9],
      ).createShader(Rect.fromCenter(center: Offset(width / 2,height / 2), width: width, height: height))
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final path = Path();
    path.moveTo(0, height * 0.1);
    path.quadraticBezierTo(width * 0.3, height * 0.2, width * 0.5, height * 0.18);
    path.quadraticBezierTo(width * 0.66, height * 0.2, width * 0.8, height * 0.3);
    path.quadraticBezierTo(width * 0.9, height * 0.35, width, height * 0.325);

    path.lineTo(width, height);
    path.lineTo(0, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer8 extends CustomPainter {
  final double width;
  final double height;

  Layer8({
    required this.width,
    required this.height
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 141, 201, 248), 
          Color.fromARGB(255, 48, 105, 165)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.1, 0.8],
      ).createShader(Rect.fromCenter(center: Offset(width / 2,height / 2), width: width, height: height))
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final path = Path();
    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}