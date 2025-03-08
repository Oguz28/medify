import 'package:flutter/material.dart';

class AddMedicationScreen extends StatefulWidget {
  @override
  _AddMedicationScreenState createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  final _formKey = GlobalKey<FormState>();
  String? medicationName;
  String? dosage;
  TimeOfDay? selectedTime;

  // Zaman seçimi için fonksiyon
  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _saveMedication() {
    if (_formKey.currentState!.validate() && selectedTime != null) {
      _formKey.currentState!.save();
      // Burada verileri kaydedebilir veya Firebase Firestore entegrasyonuna geçiş yapabilirsiniz.
      // Şimdilik basitçe geri dönelim.
      Navigator.of(context).pop();
    } else {
      // Zaman seçilmemişse uyarı verin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lütfen ilaç zamanını seçin.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni İlaç Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'İlaç Adı',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Lütfen ilaç adını girin.' : null,
                onSaved: (value) => medicationName = value,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Dozaj',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Lütfen dozaj bilgisini girin.' : null,
                onSaved: (value) => dosage = value,
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text(
                  selectedTime != null
                      ? 'Seçilen Zaman: ${selectedTime!.format(context)}'
                      : 'Zaman Seçin',
                ),
                trailing: Icon(Icons.access_time),
                onTap: () => _pickTime(context),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saveMedication,
                child: Text('Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
