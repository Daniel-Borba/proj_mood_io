import 'package:flutter/material.dart';

class TelaEdicaoAnotacao extends StatelessWidget {
  const TelaEdicaoAnotacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Registro'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '15 de Outubro',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),

            // Emoji de Humor
            Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  border: null,
                ),
                child: const Icon(Icons.sentiment_satisfied,
                    size: 80, color: Colors.deepPurple),
              ),
            ),
            const SizedBox(height: 30),

            // Anotação Completa
            const Text(
              'Dia ótimo! Consegui terminar o projeto e saí com amigos. Foi um momento de muita felicidade e alívio após o estresse do trabalho.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            // Tags/Atividades
            const Text(
              'Tags/Atividades',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            Row(
              children: <Widget>[
                buildActivityTag('trabalho', true),
                const SizedBox(width: 10),
                buildActivityTag('amigos', true),
                const SizedBox(width: 10),
                buildActivityTag('exercício', false),
              ],
            ),
            const SizedBox(height: 50),

            // Botões de Ação
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Botão Editar
                OutlinedButton(
                  onPressed: () {
                    // Ação de Editar (simplesmente volta para este exemplo)
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    foregroundColor: Colors.deepPurple,
                    side: const BorderSide(color: Colors.deepPurple),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Editar', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(width: 20),

                // Botão Excluir
                ElevatedButton(
                  onPressed: () {
                    // Ação de Excluir (volta para o Histórico)
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Excluir', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper para as Tags de Atividade
  Widget buildActivityTag(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepPurple.withOpacity(0.1) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        border: isSelected ? Border.all(color: Colors.deepPurple) : null,
      ),
      child: Text(label, style: TextStyle(color: isSelected ? Colors.deepPurple : Colors.black87)),
    );
  }
}