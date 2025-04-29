import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; // Untuk format tanggal lokal
import 'package:ucp1flutter_20220140140/loginpage.dart'; // Pastikan huruf besar kecil nama file benar

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null); // Format tanggal Indonesia
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Tambahkan constructor const

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hilangkan label debug merah
      title: 'Aplikasi Pendataan Barang', // Judul aplikasi
      home: const LoginPage(), // Pakai huruf besar di LoginPage (standar class Flutter PascalCase)
    );
  }
}
