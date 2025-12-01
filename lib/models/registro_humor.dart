class RegistroHumor {
  int? id;
  String data;
  String humor; // ex: "Feliz", "Triste"
  String? observacao;

  RegistroHumor({
    this.id,
    required this.data,
    required this.humor,
    this.observacao,
  });

  // Converte objeto para mapa (para salvar no BD)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data': data,
      'humor': humor,
      'observacao': observacao,
    };
  }

  // Converte mapa para objeto (para ler do BD)
  factory RegistroHumor.fromMap(Map<String, dynamic> map) {
    return RegistroHumor(
      id: map['id'],
      data: map['data'],
      humor: map['humor'],
      observacao: map['observacao'],
    );
  }
}