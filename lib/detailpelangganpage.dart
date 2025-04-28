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
