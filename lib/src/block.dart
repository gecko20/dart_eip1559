part of eip1559;

/// Simple block information.
class Block {
  /// The constructor.
  Block({
    required this.baseFeePerGas,
    required this.timestamp,
    required this.number,
  });

  /// Creates [Block] from JSON data.
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

  /// Converts a [Block] to JSON map.
  Map<String, Object?> toJson() => {
        'number': number.toString(),
        'timestamp': timestamp,
        'baseFeePerGas': baseFeePerGas?.toRadixString(16),
      };

  @override
  String toString() => jsonEncode(toJson());

  /// Block Number.
  final BigInt number;

  /// Base fee per gas.
  final BigInt? baseFeePerGas;

  /// Timestamp of the [Block].
  final DateTime timestamp;
}
