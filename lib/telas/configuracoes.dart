import 'package:flutter/material.dart';

class TelaConfiguracoes extends StatelessWidget {
  const TelaConfiguracoes({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Configurações',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Opções de Configuração com ListTile
          buildConfigTile(context, 'Editar Perfil', Icons.person_outline, () {
            // Ação: navegar para a tela de edição de perfil
          }),
          const Divider(),
          buildConfigTile(context, 'Personalização de Cores', Icons.color_lens_outlined, () {
            // Ação: navegar para a tela de personalização
          }),
          const Divider(),
          // Configuração de Notificações com Switch
          ListTile(
            leading: const Icon(Icons.notifications_outlined, color: Colors.deepPurple),
            title: const Text('Notificações'),
            trailing: Switch(
              value: true, // Estado inicial ligado
              onChanged: (bool value) {
                // Ação para ligar/desligar notificações
              },
              activeColor: Colors.deepPurple,
            ),
            onTap: () {
              // Ação: navegar para as configurações de notificação
            },
          ),
          const Divider(),
          buildConfigTile(context, 'Exportar Dados', Icons.file_download_outlined, () {
            // Ação: exportar dados
          }),
          const Divider(),
          buildConfigTile(context, 'Sobre o App', Icons.info_outline, () {
            // Ação: navegar para a tela "Sobre o App"
          }),
          const Divider(),
        ],
      ),
    );
  }

  // Helper para criar os ListTiles
  Widget buildConfigTile(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}