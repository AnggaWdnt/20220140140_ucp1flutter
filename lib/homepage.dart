import 'package:flutter/material.dart';
import 'package:ucp1flutter_20220140140/orderpage.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header profile
            Container(
              color: Colors.deepOrange,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/admin.png'), // Gambar admin, sesuaikan path
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat Datang',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        'Admin',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                    },
                    icon: Icon(Icons.logout, color: Colors.white),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
             // Banner Promosi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.red[100],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/banneriklan.jpg', 
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

              child: Text('Data Piket')
            ),
          ],
          
        ),
      ),
    );
  }
}