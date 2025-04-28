import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime(2101),
  );
  if (picked != null && picked != _selectedDate) {
    setState(() {
      _selectedDate = picked;
    });
  }
}

void _submitData() {
  if (_formKey.currentState?.validate() ?? false) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data Berhasil Disubmit')),
    );
  }
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
      backgroundColor: Colors.deepOrange,
      title: Text('Pendataan Barang'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),

    body: SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

Text('Tanggal Transaksi', style: TextStyle(fontWeight: FontWeight.bold)),
SizedBox(height: 8),
GestureDetector(
  onTap: () => _selectDate(context),
  child: AbsorbPointer(
    child: TextFormField(
      decoration: _inputDecoration('Tanggal Transaksi').copyWith(
        prefixIcon: Icon(Icons.calendar_today),
      ),
      controller: TextEditingController(
        text: _selectedDate == null
            ? ''
            : DateFormat('dd-MM-yyyy').format(_selectedDate!),
      ),
      validator: (value) => value == null || value.isEmpty ? 'Tanggal wajib diisi' : null,
    ),
  ),
),

DropdownButtonFormField<String>(
  value: _jenisTransaksi,
  decoration: _inputDecoration('Jenis Transaksi'),
  items: ['Pembelian', 'Penjualan'].map((item) {
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

DropdownButtonFormField<String>(
  value: _jenisBarang,
  decoration: _inputDecoration('Jenis Barang'),
  items: ['Carrier', 'Sleeping Bag', 'Tenda', 'Sepatu'].map((item) {
    return DropdownMenuItem(
      value: item,
      child: Text(item),
    );
  }).toList(),
  onChanged: (value) {
    setState(() {
      _jenisBarang = value;
    });
  },
  validator: (value) => value == null || value.isEmpty ? 'Pilih jenis barang' : null,
),

Row(
  children: [
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Jumlah Barang', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          TextFormField(
            controller: _jumlahController,
            decoration: _inputDecoration('Jumlah Barang'),
            keyboardType: TextInputType.number,
            validator: (value) => value == null || value.isEmpty ? 'Jumlah wajib diisi' : null,
          ),
        ],
      ),
    ),
    SizedBox(width: 12),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Harga Satuan', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          TextFormField(
            controller: _hargaController,
            decoration: _inputDecoration('Harga Satuan').copyWith(
              prefixText: 'Rp. ',
            ),
            keyboardType: TextInputType.number,
            validator: (value) => value == null || value.isEmpty ? 'Harga wajib diisi' : null,
          ),
        ],
      ),
    ),
  ],
),
