import 'package:flutter/material.dart';
import '../models/registro_humor.dart';
import '../dados_app.dart';
import 'anotacao.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  List<RegistroHumor> get registros => DadosApp.registros;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Olá, ${DadosApp.getPrimeiroNome()}",
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF7E57C2)),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Como você está se sentindo hoje?",
                        style: TextStyle(fontSize: 16, color: isDark ? Colors.grey[400] : Colors.grey[600]),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: isDark ? Colors.grey[800] : Colors.grey[300],
                    child: const Icon(Icons.person, color: Colors.white),
                  )
                ],
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _emojiIcon('😄', isDark), _emojiIcon('😎', isDark), _emojiIcon('😐', isDark), _emojiIcon('😡', isDark), _emojiIcon('😢', isDark),
                ],
              ),
              const SizedBox(height: 30),

              Text("Minhas Anotações", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87)),
              const SizedBox(height: 10),

              Expanded(
                child: registros.isEmpty
                    ? Center(child: Text("Seu diário está vazio.\nComece agora!", textAlign: TextAlign.center, style: TextStyle(color: isDark ? Colors.grey[600] : Colors.grey[400])))
                    : ListView.builder(
                        itemCount: registros.length,
                        itemBuilder: (context, index) {
                          final item = registros[index];
                          
                          String resumoTexto = item.observacao ?? '';
                          if (resumoTexto.length > 30) {
                            resumoTexto = "${resumoTexto.substring(0, 30)}...";
                          }

                          return Card(
                            elevation: 0,
                            color: isDark ? Colors.grey[900] : Colors.grey[50],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey.shade200)),
                            margin: const EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              onTap: () => _mostrarDetalhes(item, index),
                              leading: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(color: isDark ? Colors.grey[800] : Colors.white, borderRadius: BorderRadius.circular(10)),
                                child: Text(_getEmoji(item.humor), style: const TextStyle(fontSize: 20)),
                              ),
                              title: Text(item.data, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: isDark ? Colors.white : Colors.black87)),
                              subtitle: Text(
                                resumoTexto,
                                style: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[600]),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF7E57C2),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: _abrirTelaNovoRegistro,
      ),
    );
  }


  void _mostrarDetalhes(RegistroHumor item, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Text(_getEmoji(item.humor), style: const TextStyle(fontSize: 30)),
              const SizedBox(width: 10),
              Text(item.humor),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Data: ${item.data}", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              const SizedBox(height: 15),
              const Text("Anotação:", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(item.observacao != null && item.observacao!.isNotEmpty ? item.observacao! : "Sem observações."),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Voltar", style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7E57C2)),
              onPressed: () {
                Navigator.pop(context);
                _abrirTelaEdicao(item, index);
              },
              child: const Text("Editar", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  Future<void> _abrirTelaNovoRegistro() async {
    final novo = await Navigator.push(context, MaterialPageRoute(builder: (c) => const TelaAnotacao()));
    if (novo != null) {
      setState(() => DadosApp.registros.insert(0, novo));
    }
  }

  Future<void> _abrirTelaEdicao(RegistroHumor item, int index) async {
    final editado = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (c) => TelaAnotacao(registroParaEditar: item))
    );

    if (editado != null) {
      setState(() {
        DadosApp.registros[index] = editado;
      });
    }
  }

  Widget _emojiIcon(String emoji, bool isDark) {
    return GestureDetector(
      onTap: _abrirTelaNovoRegistro,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[800] : Colors.white,
          border: Border.all(color: isDark ? Colors.grey[700]! : Colors.grey.shade300),
          shape: BoxShape.circle,
        ),
        child: Text(emoji, style: const TextStyle(fontSize: 28)),
      ),
    );
  }

  String _getEmoji(String humor) {
    switch (humor) {
      case 'Feliz': return '😄';
      case 'Legal': return '😎';
      case 'Normal': return '😐';
      case 'Estressado': return '😡';
      case 'Triste': return '😢';
      default: return '❓';
    }
  }
}