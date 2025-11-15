import 'package:flutter/material.dart';
import 'widgets/rumus_card.dart';
import 'widgets/latihan_quis_card.dart';
import 'widgets/education_card.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({required this.username, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool gridView = false;
  String searchText = "";
  int selectedIndex = 0;

  final List<Map<String, String>> rumusList = [
    {'judul': 'Luas Persegi', 'rumus': 's × s'},
    {'judul': 'Luas Persegi Panjang', 'rumus': 'p × l'},
    {'judul': 'Luas Segitiga', 'rumus': '½ × a × t'},
    {'judul': 'Luas Jajar Genjang', 'rumus': 'a × t'},
    {'judul': 'Luas Trapesium', 'rumus': '½ × (a + b) × t'},
    {'judul': 'Luas Belah Ketupat', 'rumus': '½ × d₁ × d₂'},
    {'judul': 'Luas Layang-Layang', 'rumus': '½ × d₁ × d₂'},
    {'judul': 'Keliling Persegi', 'rumus': '4 × s'},
    {'judul': 'Keliling Persegi Panjang', 'rumus': '2 × (p + l)'},
    {'judul': 'Keliling Segitiga', 'rumus': 'a + b + c'},
    {'judul': 'Keliling Lingkaran', 'rumus': '2 × π × r'},
    {'judul': 'Luas Lingkaran', 'rumus': 'π × r²'},
    {'judul': 'Volume Kubus', 'rumus': 's³'},
    {'judul': 'Volume Balok', 'rumus': 'p × l × t'},
    {'judul': 'Volume Prisma', 'rumus': 'Luas Alas × Tinggi'},
    {'judul': 'Volume Tabung', 'rumus': 'π × r² × t'},
    {'judul': 'Volume Limas', 'rumus': '⅓ × Luas Alas × Tinggi'},
    {'judul': 'Volume Kerucut', 'rumus': '⅓ × π × r² × t'},
    {'judul': 'Volume Bola', 'rumus': '⅘ × π × r³'},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredList = rumusList
        .where(
          (item) =>
              item['judul']!.toLowerCase().contains(searchText.toLowerCase()),
        )
        .toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'Hai, ${widget.username} 👋',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              gridView ? Icons.view_list_rounded : Icons.grid_view_rounded,
              color: Colors.white,
            ),
            onPressed: () => setState(() => gridView = !gridView),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        selectedItemColor: const Color.fromARGB(255, 12, 12, 12),
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: (value) => setState(() => selectedIndex = value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: "Materi",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_purple500),
            label: "Nilai",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),

            // HORIZONTAL SCROLL KARTU PENDIDIKAN
            SizedBox(
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20),
                children: [
                  EducationCard(
                    nama: widget.username,
                    level: "Sekolah Dasar",
                    colors: [Colors.red.shade400, Colors.red.shade200],
                    nilaiLatihan: 85,
                    nilaiQuiz: 90,
                  ),
                  EducationCard(
                    nama: widget.username,
                    level: "Sekolah Menengah Pertama",
                    colors: [Colors.blue.shade400, Colors.blue.shade200],
                    nilaiLatihan: 88,
                    nilaiQuiz: 92,
                  ),
                  EducationCard(
                    nama: widget.username,
                    level: "Sekolah Menengah Atas",
                    colors: [
                      Color(0xFF4A4A4A), // Abu-abu tua elegan
                      Color(0xFF1E1E1E), // Dark grey hampir hitam
                      Colors.black, // Hitam pekat
                    ],

                    nilaiLatihan: 90,
                    nilaiQuiz: 95,
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // SEARCH BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                onChanged: (value) => setState(() => searchText = value),
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Cari rumus...",
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon: Icon(Icons.search, color: Colors.white70),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // LATIHAN & QUIZ
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: LatihanQuizCard(title: "Latihan", onTap: () {}),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: LatihanQuizCard(title: "Quiz", onTap: () {}),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),

            // RUMUS
            Row(
              children: [
                Expanded(child: Divider(color: Colors.white24)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Rumus", style: TextStyle(color: Colors.white70)),
                ),
                Expanded(child: Divider(color: Colors.white24)),
              ],
            ),
            SizedBox(height: 10),

            // LIST / GRID RUMUS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 400),
                child: gridView
                    ? GridView.builder(
                        padding: EdgeInsets.only(top: 10),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) => RumusCard(
                          judul: filteredList[index]['judul']!,
                          rumus: filteredList[index]['rumus']!,
                          isgrid: true,
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.only(top: 10),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) => RumusCard(
                          judul: filteredList[index]['judul']!,
                          rumus: filteredList[index]['rumus']!,
                          isgrid: false,
                        ),
                      ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
