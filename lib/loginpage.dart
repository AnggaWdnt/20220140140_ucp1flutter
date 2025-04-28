import 'package:flutter/material.dart';
import 'package:ucp1flutter_20220140140/homepage.dart';
import 'package:ucp1flutter_20220140140/registerpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SELAMAT DATANG KEMBALI',
                style: TextStyle(fontSize: 28, color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              SizedBox(height: 8),
              Text(
                'Masukkan alamat email yang valid',
                style: TextStyle(fontSize: 12, color: const Color.fromARGB(255, 128, 128, 128)),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              Text(
                'Masukkan password yang kuat',
                style: TextStyle(fontSize: 12, color: const Color.fromARGB(255, 128, 128, 128)),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(500, 50), 
                  backgroundColor: const Color.fromARGB(255, 255, 119, 0), 
                  foregroundColor: Colors.white, 
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                }, 
                child: Text('Belum punya akun? Daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}