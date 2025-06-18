import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  bool _obscureText = true;

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (username.trim().isEmpty || password.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data tidak boleh kosong!')),
        );
        return;
      }

      // Autentikasi dummy
      if (username == 'amii' && password == '1234') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login berhasil!')),
        );

        // Navigasi ke home tanpa bisa kembali ke login
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Username atau password salah!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: Text('Login'),
        elevation: 0,
        backgroundColor: Colors.teal.shade700,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: Center(
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.school, size: 60, color: Colors.teal),
                    SizedBox(height: 16),
                    Text(
                      'Selamat Datang, Amii!',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal.shade700),
                    ),
                    Text(
                      'Masukkan data login untuk melanjutkan belajar 🎓',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onSaved: (value) => username = value!,
                      validator: (value) => value!.isEmpty ? 'Username wajib diisi' : null,
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      obscureText: _obscureText,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onSaved: (value) => password = value!,
                      validator: (value) => value!.isEmpty ? 'Password wajib diisi' : null,
                    ),
                    SizedBox(height: 25),
                    ElevatedButton.icon(
                      onPressed: _login,
                      icon: Icon(Icons.login),
                      label: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade700,
                        minimumSize: Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
