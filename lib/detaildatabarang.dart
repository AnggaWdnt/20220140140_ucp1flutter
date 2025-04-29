import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Untuk format tanggal dan format uang

class DetailBarangPage extends StatelessWidget {
  final String jenisTransaksi;
  final String jenisBarang;
  final int jumlahBarang;
  final int hargaSatuan;
  final DateTime tanggal;

  const DetailBarangPage({
    Key? key,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlahBarang,
    required this.hargaSatuan,
    required this.tanggal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int totalHarga = jumlahBarang * hargaSatuan;
    final dateFormat = DateFormat('EEEE, d MMMM yyyy', 'id_ID');
    final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0);

    return Scaffold(
      backgroundColor: Color(0xFFFEF6F4),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text('Data Berhasil Disimpan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  detailRow('Tanggal', dateFormat.format(tanggal)),
                  detailRow('Jenis Transaksi', jenisTransaksi),
                  detailRow('Jenis Barang', jenisBarang),
                  detailRow('Jumlah Barang', jumlahBarang.toString()),
                  detailRow('Jenis Harga Satuan', currencyFormat.format(hargaSatuan)),
                  detailRow('Total Harga', currencyFormat.format(totalHarga)),
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: Size(300, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Selesai', style: TextStyle(fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }

  Widget detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
