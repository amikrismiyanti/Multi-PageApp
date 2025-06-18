import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String topic = ModalRoute.of(context)!.settings.arguments as String;

    String getDescription(String title) {
      switch (title) {
        case 'Latihan Matematika':
          return 'Kerjakan soal-soal untuk mengasah logika berhitung. 📐';
        case 'Video Bahasa Inggris':
          return 'Belajar Bahasa Inggris lewat video interaktif. 🎧';
        case 'Sejarah Kemerdekaan':
          return 'Pelajari perjuangan para pahlawan kemerdekaan. 🇮🇩';
        case 'Tips Belajar Efektif':
          return 'Temukan cara belajar yang menyenangkan & efisien. 📚';
        case 'Motivasi Harian':
          return 'Kutipan semangat untuk memulai hari penuh makna. 💡';
        case 'Target Belajar Minggu Ini':
          return 'Rancang dan capai target belajarmu! 📈';
        default:
          return 'Topik ini belum memiliki deskripsi khusus.';
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Detail Topik')),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.teal.shade50,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.book_rounded, size: 60, color: Colors.teal.shade700),
              SizedBox(height: 20),
              Text(topic,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal.shade700)),
              SizedBox(height: 15),
              Text(
                getDescription(topic),
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back),
                label: Text('Kembali'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade400,
                  foregroundColor: Colors.indigo.shade900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
