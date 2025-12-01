import 'package:flutter/material.dart';
import '../theme_controller.dart';

class TelaConfiguracoes extends StatefulWidget {
  const TelaConfiguracoes({super.key});

  @override
  State<TelaConfiguracoes> createState() => _TelaConfiguracoesState();
}

class _TelaConfiguracoesState extends State<TelaConfiguracoes> {
  bool _lembreteDiario = true;

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeController.instance.isDark.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text("Preferências", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF7E57C2))),
          const SizedBox(height: 10),
          
          SwitchListTile(
            title: const Text('Lembrete Diário'),
            subtitle: const Text('Receber aviso para registrar humor às 20h'),
            value: _lembreteDiario,
            activeTrackColor: const Color(0xFF7E57C2),
            onChanged: (bool valor) {
              setState(() => _lembreteDiario = valor);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(valor ? "Lembrete ativado!" : "Lembrete desativado."), duration: const Duration(seconds: 1)),
              );
            },
          ),
          
          const Divider(),
          const Text("Aparência", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF7E57C2))),
          const SizedBox(height: 10),

          SwitchListTile(
            title: const Text('Modo Escuro'),
            subtitle: const Text('Alternar entre tema claro e escuro'),
            value: isDark,
            activeTrackColor: const Color(0xFF7E57C2),
            onChanged: (bool valor) {
              ThemeController.instance.toggle();
              setState(() {});
            },
          ),
          const Divider(),
          const ListTile(leading: Icon(Icons.info_outline), title: Text('Versão'), subtitle: Text('1.0.0 Beta')),
          const ListTile(leading: Icon(Icons.code), title: Text('Desenvolvido por'), subtitle: Text('Daniel Borba')),
        ],
      ),
    );
  }
}