import 'package:flutter/material.dart';

class LatihanQuizCard extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const LatihanQuizCard({required this.title, required this.onTap});

  @override
  _LatihanQuizCardState createState() => _LatihanQuizCardState();
}

class _LatihanQuizCardState extends State<LatihanQuizCard>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  bool _isGlowing = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95;
      _isGlowing = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
      _isGlowing = false;
    });
    widget.onTap();
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
      _isGlowing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: Duration(milliseconds: 150),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: _isGlowing
                ? [
                    BoxShadow(
                      color: const Color.fromARGB(
                        255,
                        246,
                        246,
                        247,
                      ).withOpacity(0.6),
                      blurRadius: 25,
                      spreadRadius: 5,
                    ),
                  ]
                : [],
          ),
          child: Card(
            color: Colors.grey[900],
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.white10, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
