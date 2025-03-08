import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMedicationScreen extends StatefulWidget {
  const AddMedicationScreen({Key? key}) : super(key: key);

  @override
  _AddMedicationScreenState createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  final _formKey = GlobalKey<FormState>();
  String? medicationName;
  String? dosage;
  TimeOfDay? selectedTime;

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

  Future<void> _saveMedication() async {
    if (_formKey.currentState!.validate() && selectedTime != null) {
      _formKey.currentState!.save();
      await FirebaseFirestore.instance.collection('medications').add({
        'name': medicationName,
        'dosage': dosage,
        'time': '${selectedTime!.hour}:${selectedTime!.minute}',
        'createdAt': FieldValue.serverTimestamp(),
      });
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen ilaç zamanını seçin.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yeni İlaç Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'İlaç Adı',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Lütfen ilaç adını girin.'
                    : null,
                onSaved: (value) => medicationName = value,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Dozaj',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Lütfen dozaj bilgisini girin.'
                    : null,
                onSaved: (value) => dosage = value,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text(
                  selectedTime != null
                      ? 'Seçilen Zaman: ${selectedTime!.format(context)}'
                      : 'Zaman Seçin',
                ),
                trailing: const Icon(Icons.access_time),
                onTap: () => _pickTime(context),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saveMedication,
                child: const Text('Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
