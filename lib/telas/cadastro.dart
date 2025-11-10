import 'package:flutter/material.dart';
import 'login.dart';

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crie sua conta no Mood.io'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Ícone (Emoji de Humor)
              const Icon(Icons.sentiment_satisfied_alt, size: 80, color: Colors.deepPurple),
              const SizedBox(height: 48),

              // Campo Nome
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 20),

              // Campo E-mail
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 20),

              // Campo Senha
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 30),

              // Botão Cadastrar
              ElevatedButton(
                onPressed: () {
                  // Ação de Cadastro (Poderia navegar para a Home ou de volta para Login)
                  // Por simplicidade, volta para Login.
                   Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const TelaLogin()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Cadastrar', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),

              // Link Entrar
              TextButton(
                onPressed: () {
                  // Navega de volta para a Tela de Login
                  Navigator.pop(context); 
                },
                child: const Text(
                  'Já tem conta? Entrar',
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}