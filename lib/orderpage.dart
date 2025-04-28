import 'package:ucp1flutter_20220140140/detailorderpage.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController makananController = TextEditingController();
  final TextEditingController minumanController = TextEditingController();
  final TextEditingController jumlahMakananController = TextEditingController();
  final TextEditingController jumlahMinumanController = TextEditingController();
  int totalHarga = 0;

  void calculateTotalPrice() {
    int jumlahMakanan = int.tryParse(jumlahMakananController.text) ?? 0;
    int jumlahMinuman = int.tryParse(jumlahMinumanController.text) ?? 0;

    setState(() {
      totalHarga = (jumlahMakanan * 32000) + (jumlahMinuman * 5000);
    });
  }

  @override
  
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text('DATA PIKET')),
      body: Form(
        key: _formKey,
        child: Column(
          spacing: 16,
          children: [
            SizedBox(height: 5),
              TextFormField(
                controller: makananController,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukan Nama Anda';
                  }
                  return null;
                },
              ),
           SizedBox(height: 1),
              TextFormField(
                controller: minumanController,
                decoration: InputDecoration(
                  labelText: 'Tanggal Piket',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukan Tanggal Piket';
                  }
                  return null;
                },
              ),
            SizedBox(height: 8),
              TextFormField(
                controller: jumlahMakananController,
                decoration: InputDecoration(
                  labelText: 'Tugas Piket',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukan Tugas Piket';
                  }
                  return null;
                },
              ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(400, 50), 
                  backgroundColor: const Color.fromARGB(255, 255, 119, 0), 
                  foregroundColor: Colors.white, 
                ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  calculateTotalPrice();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                        (context) => DetailOrderPage(
                          jumlahMakanan: jumlahMakananController.text,
                          jumlahMinuman: jumlahMinumanController.text,
                          makanan: makananController.text,
                          minuman: minumanController.text,
                          totalHarga: totalHarga,
                        ), 
                    ),
                  );
                }
              } ,
              child: Text('Tambah Data'),
            ),
          ],
        )
      ),
    );
  }
}