import 'models/registro_humor.dart';

class DadosApp {
  static List<Map<String, String>> usuarios = [
    {'nome': 'Daniel Cezar', 'email': 'teste@fmu.br', 'senha': '123'}
  ];

  static Map<String, String>? usuarioLogado;

  static List<RegistroHumor> registros = [];

  static String getPrimeiroNome() {
    if (usuarioLogado == null) return "Visitante";
    String nomeCompleto = usuarioLogado!['nome']!;
    return nomeCompleto.split(' ')[0];
  }
}