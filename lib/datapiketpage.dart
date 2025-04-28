import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _namaController = TextEditingController(text: "Admin");
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _tugasController = TextEditingController();
  List<Map<String, String>> dataPiket = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), 
      firstDate: DateTime(2000), 
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _tanggalController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _tambahData() {
    if (_namaController.text.isNotEmpty &&
        _tanggalController.text.isNotEmpty &&
        _tugasController.text.isNotEmpty) {
      setState(() {
        dataPiket.add({
          'nama': _namaController.text,
          'tanggal': _tanggalController.text,
          'tugas': _tugasController.text,
        });
        _tugasController.clear(); 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Piket Gudang'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama Anggota'),
              SizedBox(height: 8),
              TextField(
                controller: _namaController,
                readOnly: true, // Biar tidak bisa diedit
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),