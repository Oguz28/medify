import 'package:flutter/material.dart';

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
class MedicationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('İlaç Listesi (Dummy Data)'));
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
