import 'package:flutter/material.dart';

class DetailPelangganPage extends StatelessWidget {
  final String nama;
  final String email;
  final String noHp;
  final String alamat;
  final String provinsi;
  final String kodePos;
  final String imageUrl;

  const DetailPelangganPage({
    Key? key,
    required this.nama,
    required this.email,
    required this.noHp,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
    required this.imageUrl,
  }) : super(key: key);

  InputDecoration _inputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Detail $nama'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(height: 16),
            Text(
              nama,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(email),
            Text(noHp),
            SizedBox(height: 24),

            Align(
              alignment: Alignment.centerLeft,
              child: Text('Alamat', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 8),
            TextField(
              controller: TextEditingController(text: alamat),
              readOnly: true,
              decoration: _inputDecoration(),
            ),
            SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Provinsi', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      TextField(
                        controller: TextEditingController(text: provinsi),
                        readOnly: true,
                        decoration: _inputDecoration(),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kode Pos', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      TextField(
                        controller: TextEditingController(text: kodePos),
                        readOnly: true,
                        decoration: _inputDecoration(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Selesai', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
