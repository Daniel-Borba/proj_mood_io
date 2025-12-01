import 'package:flutter/material.dart';
import 'principal.dart';
import 'cadastro.dart';
import '../dados_app.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  void _fazerLogin() {
    final email = _emailController.text.trim();
    final senha = _senhaController.text.trim();

    if (email.isEmpty || senha.isEmpty) {
      _mostrarErro("Por favor, informe e-mail e senha.");
      return;
    }

    try {
      final usuarioEncontrado = DadosApp.usuarios.firstWhere(
        (user) => user['email'] == email && user['senha'] == senha,
      );

      DadosApp.usuarioLogado = usuarioEncontrado;
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TelaPrincipal()),
      );

    } catch (e) {
      _mostrarErro("Credenciais inválidas ou usuário não cadastrado.");
    }
  }

  void _mostrarErro(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.mood, size: 80, color: Color(0xFF7E57C2)),
              const SizedBox(height: 10),
              const Text('Mood.io', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF7E57C2))),
              const SizedBox(height: 50),

              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: _senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                ),
              ),
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7E57C2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: _fazerLogin,
                  child: const Text('Entrar', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              
              const SizedBox(height: 20),

              TextButton(
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (c) => const TelaCadastro()));
                },
                child: const Text('Não tem conta? Cadastre-se', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}