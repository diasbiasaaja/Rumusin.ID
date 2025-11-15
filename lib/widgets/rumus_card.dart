import 'package:flutter/material.dart';

class RumusCard extends StatefulWidget {
  final String judul;
  final String rumus;
  final bool isgrid;

  const RumusCard({
    required this.judul,
    required this.rumus,
    this.isgrid = false,
  });

  @override
  _RumusCardState createState() => _RumusCardState();
}

class _RumusCardState extends State<RumusCard>
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
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
      _isGlowing = false;
    });
  }

  // ======================= ICON SIMPLE =======================
  IconData getIcon(String judul) {
    judul = judul.toLowerCase();

    if (judul.contains("persegi") && !judul.contains("panjang")) {
      return Icons.crop_square; // kotak
    }
    if (judul.contains("persegi panjang")) {
      return Icons.rectangle_outlined;
    }
    if (judul.contains("segitiga")) {
      return Icons.change_history;
    }
    if (judul.contains("lingkaran")) {
      return Icons.circle_outlined;
    }
    if (judul.contains("kubus")) {
      return Icons.view_in_ar;
    }
    if (judul.contains("balok")) {
      return Icons.view_in_ar_outlined;
    }
    if (judul.contains("prisma")) {
      return Icons.account_balance;
    }
    if (judul.contains("tabung")) {
      return Icons.category_outlined;
    }
    if (judul.contains("limas")) {
      return Icons.change_history;
    }
    if (judul.contains("kerucut")) {
      return Icons.celebration;
    }
    if (judul.contains("bola")) {
      return Icons.sports_soccer;
    }

    return Icons.functions; // default icon
  }
  // ===========================================================

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Rumus: ${widget.rumus}'),
            duration: Duration(seconds: 1),
          ),
        );
      },
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
                      color: Colors.white.withOpacity(0.6),
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
              child: widget.isgrid
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          getIcon(widget.judul),
                          size: 35,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.judul,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          widget.rumus,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.judul,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          widget.rumus,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
