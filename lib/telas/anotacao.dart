import 'package:flutter/material.dart';
import '../models/registro_humor.dart';

class TelaAnotacao extends StatefulWidget {
  final RegistroHumor? registroParaEditar;

  const TelaAnotacao({super.key, this.registroParaEditar});

  @override
  State<TelaAnotacao> createState() => _TelaAnotacaoState();
}

class _TelaAnotacaoState extends State<TelaAnotacao> {
  final _formKey = GlobalKey<FormState>();
  final _observacaoController = TextEditingController();
  
  final Map<String, String> _humores = {
    'Feliz': '😄', 'Legal': '😎', 'Normal': '😐', 'Estressado': '😡', 'Triste': '😢',
  };
  
  String? _humorSelecionado;

  @override
  void initState() {
    super.initState();
    if (widget.registroParaEditar != null) {
      _humorSelecionado = widget.registroParaEditar!.humor;
      _observacaoController.text = widget.registroParaEditar!.observacao ?? '';
    }
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      final dataFinal = widget.registroParaEditar != null 
          ? widget.registroParaEditar!.data 
          : _gerarDataAtual();

      final novoRegistro = RegistroHumor(
        id: widget.registroParaEditar?.id,
        data: dataFinal,
        humor: _humorSelecionado!,
        observacao: _observacaoController.text,
      );

      Navigator.pop(context, novoRegistro);
    }
  }

  String _gerarDataAtual() {
    final agora = DateTime.now();
    return "${agora.day}/${agora.month} - ${agora.hour}:${agora.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final titulo = widget.registroParaEditar == null ? 'Novo Registro' : 'Editar Registro';

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      appBar: AppBar(
        title: Text(titulo, style: TextStyle(color: isDark ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  value: _humorSelecionado,
                  dropdownColor: isDark ? Colors.grey[800] : Colors.white,
                  decoration: InputDecoration(
                    labelText: "Humor",
                    labelStyle: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[600]),
                    filled: true,
                    fillColor: isDark ? Colors.grey[900] : Colors.grey[100],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                  ),
                  style: TextStyle(color: isDark ? Colors.white : Colors.black, fontSize: 16),
                  items: _humores.entries.map((entry) {
                    return DropdownMenuItem(value: entry.key, child: Row(children: [Text(entry.value, style: const TextStyle(fontSize: 24)), const SizedBox(width: 10), Text(entry.key)]));
                  }).toList(),
                  onChanged: (v) => setState(() => _humorSelecionado = v),
                  validator: (v) => v == null ? 'Por favor, escolha um humor' : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _observacaoController,
                  maxLines: 5,
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Observações (Opcional)',
                    labelStyle: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[600]),
                    alignLabelWithHint: true,
                    filled: true,
                    fillColor: isDark ? Colors.grey[900] : Colors.grey[100],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _salvar,
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7E57C2)),
                    child: const Text('Salvar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}