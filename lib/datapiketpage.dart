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
                readOnly: true, 
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
               Text('Pilih Tanggal'),
              SizedBox(height: 8),
              TextField(
                controller: _tanggalController,
                readOnly: true,
                onTap: () => _selectDate(context),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                  hintText: 'Pilih Tanggal',
                ),
              ),
              SizedBox(height: 16),
              Text('Tugas Piket'),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _tugasController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Tugas Piket',
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                    ElevatedButton(
                    onPressed: _tambahData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                    child: Text('Tambah'),
                  ),
                ],
              ),
              SizedBox(height: 24),