part of eip1559;

class Block {
  Block({
    required this.baseFeePerGas,
    required this.timestamp,
    required this.number,
  });

  factory Block.fromJson(Map<String, dynamic> json) {
    final baseFeePerGas = json['baseFeePerGas'] as String?;
    final timestamp = json['timestamp'] as String;
    final number = json['number'] as String;

    return Block(
      baseFeePerGas: baseFeePerGas != null ? BigInt.parse(baseFeePerGas) : null,
      number: BigInt.parse(number),
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        int.parse(timestamp) * 1000,
        isUtc: true,
      ),
    );
  }

  Map<String, Object?> toJson() => {
        'number': number.toString(),
        'timestamp': timestamp,
        'baseFeePerGas': baseFeePerGas?.toRadixString(16),
      };

  @override
  String toString() => jsonEncode(toJson());

  final BigInt number;
  final BigInt? baseFeePerGas;
  final DateTime timestamp;
}
