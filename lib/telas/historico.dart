import 'package:flutter/material.dart';
import '../dados_app.dart';

class TelaHistorico extends StatelessWidget {
  const TelaHistorico({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    final lista = DadosApp.registros;
    
    final totalRegistros = lista.length;
    
    final int felizes = lista.where((e) => e.humor == 'Feliz' || e.humor == 'Legal').length;
    final int tristes = lista.where((e) => e.humor == 'Triste' || e.humor == 'Estressado').length;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      appBar: AppBar(
        title: const Text(
          'Histórico', 
          style: TextStyle(color: Color(0xFF7E57C2), fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF7E57C2), Color(0xFF9575CD)]
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _infoCard("Total", "$totalRegistros"),
                  _infoCard("Positivos", "$felizes"),
                  _infoCard("Negativos", "$tristes"),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Atividades Recentes", 
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black87
                )
              ),
            ),
            
            const SizedBox(height: 10),

            Expanded(
              child: lista.isEmpty
                  ? Center(
                      child: Text(
                        "Nenhum dado para estatísticas.",
                        style: TextStyle(color: isDark ? Colors.grey[600] : Colors.grey[400]),
                      ),
                    )
                  : ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, index) {
                        final item = lista[index];
                        return Card(
                          elevation: 0,
                          color: isDark ? Colors.grey[900] : Colors.grey[50],
                          margin: const EdgeInsets.only(bottom: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: isDark ? Colors.grey[800]! : Colors.grey.shade200
                            ),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: const Color(0xFF7E57C2).withAlpha(30),
                              child: Text(
                                item.humor[0], 
                                style: const TextStyle(color: Color(0xFF7E57C2))
                              ),
                            ),
                            title: Text(
                              item.humor,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white : Colors.black87
                              )
                            ),
                            subtitle: Text(
                              item.data,
                              style: TextStyle(
                                color: isDark ? Colors.grey[400] : Colors.grey[600]
                              )
                            ),
                            trailing: item.observacao != null && item.observacao!.isNotEmpty 
                                ? Icon(Icons.comment, size: 16, color: isDark ? Colors.grey : Colors.grey[400]) 
                                : null,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String label, String valor) {
    return Column(
      children: [
        Text(valor, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.white70)),
      ],
    );
  }
}