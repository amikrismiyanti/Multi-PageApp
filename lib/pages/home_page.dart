import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> items = [
    'Latihan Matematika',
    'Video Bahasa Inggris',
    'Sejarah Kemerdekaan',
    'Tips Belajar Efektif',
    'Motivasi Harian',
    'Target Belajar Minggu Ini',
  ];

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Konfirmasi Logout'),
        content: Text('Yakin ingin keluar dari aplikasi?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _confirmLogout(context),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.amber.shade100,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Halo Amii 👋",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                SizedBox(height: 5),
                Text("Yuk, lanjut belajar hari ini 💪",
                    style: TextStyle(fontSize: 16, color: Colors.indigo.shade900)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: items.length,
              itemBuilder: (context, index) => Card(
                color: Colors.amber.shade100,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal.shade700,
                    child: Icon(Icons.star, color: Colors.white),
                  ),
                  title: Text(
                    items[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo.shade900,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal.shade700),
                  onTap: () {
                    Navigator.pushNamed(context, '/detail', arguments: items[index]);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
