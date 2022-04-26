import 'package:flutter/material.dart';
import 'package:neon_button/custom_painter.dart';

class NeonButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const NeonButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<NeonButton> createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton> {
  final Color clrNeon = const Color.fromRGBO(255, 20, 189, 1);
  late bool isHovered;

  @override
  void initState() {
    isHovered = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: CustomPaint(
              foregroundPainter: MyPainter(clrNeon),
              isComplex: true,
              willChange: false,
              child: AnimatedContainer(
                curve: Curves.linear,
                duration: const Duration(milliseconds: 100),
                decoration: BoxDecoration(
                  color: !isHovered ? Colors.transparent : clrNeon,
                  border: Border.all(
                    color: clrNeon,
                    style: BorderStyle.solid,
                    width: 0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: !isHovered ? 32 : 255,
                      spreadRadius: 0,
                      blurStyle: BlurStyle.outer,
                      color: clrNeon,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 64),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      color: !isHovered ? clrNeon : Colors.black,
                      fontSize: 92,
                      fontWeight: FontWeight.bold,
                      shadows: !isHovered
                          ? [
                              Shadow(
                                blurRadius: 12,
                                color: clrNeon,
                              ),
                            ]
                          : null,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 150,
          child: Transform(
            child: AnimatedContainer(
              curve: Curves.linear,
              duration: Duration(milliseconds: 100),
              width: 375,
              height: 200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: !isHovered
                        ? clrNeon.withAlpha(175)
                        : clrNeon.withAlpha(255),
                    blurRadius: 100,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
            alignment: FractionalOffset.center,
            transform: Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
              ..scale(1, 0.35)
              ..setEntry(3, 2, 0.002)
              ..rotateX(-1.20),
          ),
        ),
      ],
    );
  }
}
