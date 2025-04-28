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

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              email,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            Text(
              noHp,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 24),
            TextFormField(
              initialValue: alamat,
              readOnly: true,
              decoration: _inputDecoration('Alamat'),
            ),
            SizedBox(height: 16),
                Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: provinsi,
                    readOnly: true,
                    decoration: _inputDecoration('Provinsi'),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    initialValue: kodePos,
                    readOnly: true,
                    decoration: _inputDecoration('Kode Pos'),
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
  