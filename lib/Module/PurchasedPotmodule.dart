// chit_model.dart

class ChitResponse {
  final bool error;
  final List<Chit> availableChits;

  ChitResponse({required this.error, required this.availableChits});

  // Factory constructor to create a ChitResponse from JSON
  factory ChitResponse.fromJson(Map<String, dynamic> json) {
    var chitsList = json['available_chits'] as List;
    List<Chit> chitItems = chitsList.map((chit) => Chit.fromJson(chit)).toList();

    return ChitResponse(
      error: json['error'],
      availableChits: chitItems,
    );
  }
}

class Chit {
  final String chitPotName;
  final int amount;

  Chit({required this.chitPotName, required this.amount});

  // Factory constructor to create a Chit from JSON
  factory Chit.fromJson(Map<String, dynamic> json) {
    return Chit(
      chitPotName: json['Chit_pot_name'],
      amount: json['Amount'],
    );
  }
}
