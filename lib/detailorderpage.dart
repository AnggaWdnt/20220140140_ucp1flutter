import 'package:ucp1flutter_20220140140/homepage.dart';
import 'package:flutter/material.dart';

class DetailOrderPage extends StatelessWidget {
  final String Namanggota;
  final String Tanggalpiket;
  final String Tugaspiket;
  final String namaLengkap;
  final String email;

  const DetailOrderPage({
    super.key,
    required this.Namanggota,
    required this.Tanggalpiket,
    required this.Tugaspiket,
    required this.namaLengkap,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Data Piket')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Anggota: $Namanggota'),
            Text('Tanggal Piket: $Tanggalpiket'),
            Text('Tugas Piket: $Tugaspiket'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        namaLengkap: namaLengkap,
                        email: email,
                      ),
                    ),
                    (route) => false,
                  );
                },
                child: const Text(
                  'Selesai',
                  style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
