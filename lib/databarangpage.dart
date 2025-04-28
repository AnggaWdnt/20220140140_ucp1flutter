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
