import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1flutter_20220140140/detaildatabarang.dart'; 

class DataBarangPage extends StatefulWidget {
  const DataBarangPage({Key? key}) : super(key: key);

  @override
  _DataBarangPageState createState() => _DataBarangPageState();
}

class _DataBarangPageState extends State<DataBarangPage> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _selectedDate;
  String? _jenisTransaksi;
  String? _jenisBarang;

  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  final Map<String, int> hargaBarang = {
    'Carrier': 500000,
    'Sleeping Bag': 200000,
    'Tenda': 750000,
    'Sepatu': 300000,
  };

  void _submitData() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data Berhasil Disubmit')),
      );
      _resetForm();
    }
  }

  void _resetForm() {
    setState(() {
      _selectedDate = null;
      _jenisTransaksi = null;
      _jenisBarang = null;
      _tanggalController.clear();
      _jumlahController.clear();
      _hargaController.clear();
    });
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    );
  }

  @override
  void dispose() {
    _tanggalController.dispose();
    _jumlahController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _tanggalController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  String _formatCurrency(int number) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Pendataan Barang'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tanggal Transaksi', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickDate,
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _tanggalController,
                    decoration: _inputDecoration('Tanggal Transaksi').copyWith(
                      prefixIcon: const Icon(Icons.calendar_today),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'Tanggal wajib diisi' : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: _jenisTransaksi,
                decoration: _inputDecoration('Jenis Transaksi'),
                items: ['Barang Masuk', 'Barang Keluar'].map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _jenisTransaksi = value;
                  });
                },
                validator: (value) => value == null || value.isEmpty ? 'Pilih jenis transaksi' : null,
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: _jenisBarang,
                decoration: _inputDecoration('Jenis Barang'),
                items: hargaBarang.keys.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _jenisBarang = value;
                    if (value != null) {
                      _hargaController.text = _formatCurrency(hargaBarang[value]!);
                    }
                  });
                },
                validator: (value) => value == null || value.isEmpty ? 'Pilih jenis barang' : null,
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Jumlah Barang', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _jumlahController,
                          decoration: _inputDecoration('Jumlah Barang'),
                          keyboardType: TextInputType.number,
                          validator: (value) => value == null || value.isEmpty ? 'Jumlah wajib diisi' : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Harga Satuan', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _hargaController,
                          decoration: _inputDecoration('Harga Satuan'),
                          enabled: false, // Tetap tidak bisa diketik manual
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              ElevatedButton(
  onPressed: () {
  if (_formKey.currentState?.validate() ?? false) {
    final tanggal = _selectedDate!;
    final jenisTransaksi = _jenisTransaksi!;
    final jenisBarang = _jenisBarang!;
    final jumlahBarang = int.tryParse(_jumlahController.text) ?? 0;
    
    final hargaText = _hargaController.text.replaceAll('Rp', '').replaceAll('.', '').trim();
    final hargaSatuan = int.tryParse(hargaText) ?? 0;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailBarangPage(
          tanggal: tanggal,
          jenisTransaksi: jenisTransaksi,
          jenisBarang: jenisBarang,
          jumlahBarang: jumlahBarang,
          hargaSatuan: hargaSatuan,
        ),
      ),
    );
  }
},

  child: Text('Submit'),
),

            ],
          ),
        ),
      ),
    );
  }
}
