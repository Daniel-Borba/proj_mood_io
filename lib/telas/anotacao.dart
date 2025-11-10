import 'package:flutter/material.dart';

class TelaAnotacao extends StatelessWidget {
  const TelaAnotacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Registro'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context), // Botão 'X' para fechar
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Seleção de Humor (Emojis)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Emojis de 😟 a 😁
                buildMoodEmoji(Icons.sentiment_very_dissatisfied),
                buildMoodEmoji(Icons.sentiment_dissatisfied),
                buildMoodEmoji(Icons.sentiment_neutral, isSelected: true), // Exemplo selecionado
                buildMoodEmoji(Icons.sentiment_satisfied),
                buildMoodEmoji(Icons.sentiment_very_satisfied),
              ],
            ),
            const SizedBox(height: 30),

            // Campo de Texto para Anotações
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Escreva como foi seu dia...',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Tags/Atividades
            const Text(
              'Adicionar Tags/Atividades',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                buildActivityTag('trabalho', Icons.work),
                const SizedBox(width: 15),
                buildActivityTag('amigos', Icons.people_outline),
                const SizedBox(width: 15),
                buildActivityTag('exercício', Icons.directions_run, isSelected: true), // Exemplo selecionado
              ],
            ),
            const SizedBox(height: 50),

            // Botão Salvar Registro
            ElevatedButton(
              onPressed: () {
                // Ação de Salvar Registro e voltar
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Salvar Registro', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  // Helper para os Emojis
  Widget buildMoodEmoji(IconData icon, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isSelected
            ? Border.all(color: Colors.deepPurple, width: 2)
            : null,
      ),
      child: Icon(icon,
          size: 40, color: isSelected ? Colors.deepPurple : Colors.black38),
    );
  }

  // Helper para as Tags de Atividade
  Widget buildActivityTag(String label, IconData icon, {bool isSelected = false}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: isSelected ? Colors.deepPurple : Colors.grey.shade200,
          child: Icon(icon, size: 20, color: isSelected ? Colors.white : Colors.black54),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: isSelected ? Colors.deepPurple : Colors.black54)),
      ],
    );
  }
}