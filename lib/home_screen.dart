import 'package:flutter/material.dart';
import 'add_medication_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    MedicationListPage(),
    DiaryPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'İlaçlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Günlük',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ayarlar',
          ),
        ],
      ),
    );
  }
}

// Dummy Sayfa Örnekleri:
class MedicationListPage extends StatefulWidget {
  @override
  _MedicationListPageState createState() => _MedicationListPageState();
}

class _MedicationListPageState extends State<MedicationListPage> {
  // Gelecekte burada eklenen ilaçları saklayabilirsiniz
  List<Map<String, String>> medications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İlaç Listesi'),
      ),
      body: medications.isEmpty
          ? Center(child: Text('Henüz ilaç eklenmedi.'))
          : ListView.builder(
              itemCount: medications.length,
              itemBuilder: (context, index) {
                final med = medications[index];
                return ListTile(
                  title: Text(med['name'] ?? ''),
                  subtitle: Text('Dozaj: ${med['dosage'] ?? ''}'),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // İlaç ekleme ekranına geçiş
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => AddMedicationScreen()),
          );
          // Geri dönüşte listeyi yenileyebilirsiniz (şimdilik dummy işlem)
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


class DiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Hasta Günlüğü (Dummy Data)'));
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Ayarlar (Dummy Data)'));
  }
}
