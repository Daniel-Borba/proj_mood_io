import 'package:flutter/material.dart';
import 'edicao_anotacao.dart';

class TelaHistorico extends StatelessWidget {
  const TelaHistorico({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Histórico de Humor',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Botões de Filtro
          Row(
            children: <Widget>[
              buildFilterButton('Semana', false),
              const SizedBox(width: 10),
              buildFilterButton('Mês', true), // Mês selecionado no design
              const SizedBox(width: 10),
              buildFilterButton('Personalizado', false),
            ],
          ),
          const SizedBox(height: 30),

          // Gráfico Placeholder (Substituiria por um pacote como fl_chart)
          Container(
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const Text(
              '[GRÁFICO DE LINHA - FL_CHART]',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          const SizedBox(height: 30),

          // Lista de Registros Anteriores
          const Text(
            'Registros Recentes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Cartões de Registro (Exemplos)
          buildRegistroCard(context, '15 de Outubro de 2023', 'Dia ótimo! Consegui terminar o projeto e saí com amigos.', Icons.sentiment_satisfied_alt),
          const SizedBox(height: 10),
          buildRegistroCard(context, '13 de Outubro de 2023', 'Um dia um pouco cansativo, mas produtivo improvisando no tema.', Icons.sentiment_neutral),
          const SizedBox(height: 10),
          // Adicione mais cards conforme necessário
        ],
      ),
    );
  }

  // Helper para os botões de filtro
  Widget buildFilterButton(String text, bool isSelected) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.deepPurple : Colors.grey.shade200,
        foregroundColor: isSelected ? Colors.white : Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
      child: Text(text),
    );
  }

  // Helper para os cartões de registro
  Widget buildRegistroCard(BuildContext context, String data, String resumo, IconData emoji) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: () {
          // Navega para a Tela de Edição/Visualização
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaEdicaoAnotacao()),
          );
        },
        leading: Icon(emoji, color: Colors.deepPurple, size: 30),
        title: Text(data, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(resumo, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}