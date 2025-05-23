import 'package:flutter/material.dart';
import 'detailpelangganpage.dart';


class DataPelangganPage extends StatefulWidget {
  const DataPelangganPage({Key? key}) : super(key: key);

  @override
  _DataPelangganPageState createState() => _DataPelangganPageState();
}

class _DataPelangganPageState extends State<DataPelangganPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _provinsiController = TextEditingController();
  final TextEditingController _kodePosController = TextEditingController();

 void _simpanData() {
  if (_formKey.currentState?.validate() ?? false) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPelangganPage(
          nama: _namaController.text,
          email: _emailController.text,
          noHp: _noHpController.text,
          alamat: _alamatController.text,
          provinsi: _provinsiController.text,
          kodePos: _kodePosController.text,
          imageUrl: 'assets/images/cat.jpg', 
        ),
      ),
    );
  }
}

void _resetForm() {
  _formKey.currentState?.reset();
  _namaController.clear();
  _emailController.clear();
  _noHpController.clear();
  _alamatController.clear();
  _provinsiController.clear();
  _kodePosController.clear();
}



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
        backgroundColor: const Color.fromARGB(255, 50, 88, 255),
        title: Text('Data Pelanggan'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: _inputDecoration('Nama Cust'),
                validator: (value) => value == null || value.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _emailController,
                      decoration: _inputDecoration('Email'),
                      validator: (value) => value == null || value.isEmpty ? 'Email tidak boleh kosong' : null,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _noHpController,
                      decoration: _inputDecoration('No Hp'),
                      validator: (value) => value == null || value.isEmpty ? 'No HP tidak boleh kosong' : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              TextFormField(
                controller: _alamatController,
                decoration: _inputDecoration('Alamat'),
                validator: (value) => value == null || value.isEmpty ? 'Alamat tidak boleh kosong' : null,
              ),
              SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _provinsiController,
                      decoration: _inputDecoration('Provinsi'),
                      validator: (value) => value == null || value.isEmpty ? 'Provinsi tidak boleh kosong' : null,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _kodePosController,
                      decoration: _inputDecoration('Kode Pos'),
                      validator: (value) => value == null || value.isEmpty ? 'Kode Pos tidak boleh kosong' : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _simpanData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 50, 88, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                     child: const Text(
                       'Simpan',
                      style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                       color: Colors.white, 
                     ),
                    ),
                  ),
              ),
              SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: _resetForm,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 50, 88, 255),
                    side: BorderSide(color: const Color.fromARGB(255, 50, 88, 255)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Reset', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
