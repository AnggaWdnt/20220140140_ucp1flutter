import 'package:flutter/material.dart';
import 'package:ucp1flutter_20220140140/detaildatapiketpage.dart';

class DataPiketPage extends StatefulWidget {
  final String namaLengkap;

  const DataPiketPage({super.key, required this.namaLengkap});

  @override
  State<DataPiketPage> createState() => _DataPiketPageState();
}

class _DataPiketPageState extends State<DataPiketPage> {
  late TextEditingController _namaController;
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _tugasController = TextEditingController();
  List<Map<String, String>> dataPiket = [];

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.namaLengkap);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _tanggalController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _tambahData() {
    if (_namaController.text.isNotEmpty &&
        _tanggalController.text.isNotEmpty &&
        _tugasController.text.isNotEmpty) {
      setState(() {
        dataPiket.add({
          'nama': _namaController.text,
          'tanggal': _tanggalController.text,
          'tugas': _tugasController.text,
        });
        _tugasController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Piket'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama Anggota'),
              SizedBox(height: 8),
              TextField(
                controller: _namaController,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text('Pilih Tanggal'),
              SizedBox(height: 8),
              TextField(
                controller: _tanggalController,
                readOnly: true,
                onTap: () => _selectDate(context),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                  hintText: 'Pilih Tanggal',
                ),
              ),
              SizedBox(height: 16),
              Text('Tugas Piket'),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _tugasController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Tugas Piket',
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _tambahData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                    child: Text('Tambah'),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Daftar Tugas Piket',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              dataPiket.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text('Belum ada Data'),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: dataPiket.length,
                      itemBuilder: (context, index) {
                        final item = dataPiket[index];
                        return Card(
                          child: ListTile(
                            title: Text(item['tugas'] ?? ''),
                            subtitle: Text(
                                '${item['nama']} - ${item['tanggal']}'),
                            trailing: Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailDataPiketPage(
                                    nama: item['nama'] ?? '',
                                    tanggal: item['tanggal'] ?? '',
                                    tugas: item['tugas'] ?? '',
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
