import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  final String nama;
  final String level;
  final int nilaiLatihan;
  final int nilaiQuiz;
  final List<Color> colors;

  const EducationCard({
    required this.nama,
    required this.level,
    required this.nilaiLatihan,
    required this.nilaiQuiz,
    required this.colors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 470, // Lebar lebih besar
          margin: EdgeInsets.only(right: 20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colors.first.withOpacity(0.9),
                colors.last.withOpacity(1.0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: colors.last.withOpacity(0.8),
                blurRadius: 20,
                spreadRadius: 3,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                level,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.school, color: Colors.white70, size: 20),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Latihan",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "$nilaiLatihan",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.quiz, color: Colors.white70, size: 20),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Quiz",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "$nilaiQuiz",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        // Icon kanan atas (SD/SMP/SMA)
        Positioned(
          top: 15, // sedikit masuk
          right: 25, // sedikit masuk
          child: Icon(
            level.contains("Dasar")
                ? Icons.school
                : level.contains("Pertama")
                ? Icons.book
                : Icons.handshake,
            color: Colors.white.withOpacity(0.8),
            size: 40,
          ),
        ),
      ],
    );
  }
}
