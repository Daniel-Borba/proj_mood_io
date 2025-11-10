import 'package:flutter/material.dart';
import 'historico.dart';
import 'configuracoes.dart';
import 'anotacao.dart'; // Para o botão de adicionar

// Definição das telas internas que serão navegadas pelo BottomNavigationBar
class TelaConteudoHome extends StatelessWidget {
  const TelaConteudoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Saudação Personalizada
          const Text(
            'Olá, [Nome]',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          
          // Pergunta Principal
          const Text(
            'Como você está se sentindo hoje?',
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          const SizedBox(height: 30),

          // Seleção de Humor (Emojis) - Simples
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // Emojis de 😟 a 😁
              buildMoodEmoji(Icons.sentiment_very_dissatisfied, 'Péssimo'),
              buildMoodEmoji(Icons.sentiment_dissatisfied, 'Triste'),
              buildMoodEmoji(Icons.sentiment_neutral, 'Neutro'),
              buildMoodEmoji(Icons.sentiment_satisfied, 'Bom'),
              buildMoodEmoji(Icons.sentiment_very_satisfied, 'Ótimo'),
            ],
          ),
          const SizedBox(height: 40),

          // Seção Minhas Anotações
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Minhas Anotações',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Placeholder para Anotações Recentes
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Nenhuma anotação ainda.\nToque para adicionar.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  // Helper para criar os botões de emoji
  Widget buildMoodEmoji(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.deepPurple.withOpacity(0.1),
          child: Icon(icon, size: 30, color: Colors.deepPurple),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}


// Tela Principal que gerencia a navegação
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _indiceAtual = 0;

  final List<Widget> _telas = [
    const TelaConteudoHome(), // Tela de Conteúdo Home
    const TelaHistorico(),    // Tela de Histórico
    const TelaConfiguracoes(),// Tela de Configurações
  ];

  void _aoTocarItem(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood.io'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      
      // Corpo da tela atual
      body: _telas[_indiceAtual],

      // Botão Flutuante (para Novo Registro)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navega para a Tela de Anotação (Novo Registro)
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaAnotacao()),
          );
        },
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add, size: 30),
      ),

      // Barra de Navegação Inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: _aoTocarItem,
        selectedItemColor: Colors.deepPurple,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            activeIcon: Icon(Icons.analytics),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}