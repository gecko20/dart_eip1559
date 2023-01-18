import 'dart:io';
import 'package:eip1559/eip1559.dart';
import 'package:test/test.dart';

final infuraId = Platform.environment['INFURA_ID'] ?? '';

void main() {
  final url = 'https://mainnet.infura.io/v3/$infuraId';

  test(
    'getBlockByNumber',
    () async {
      final blockInfo = await getBlockByNumber(
        url,
        '0xd6c34e',
      );

      expect(
        blockInfo.timestamp.millisecondsSinceEpoch == 1643113026000,
        isTrue,
      );
      expect(
        blockInfo.timestamp.isUtc == true,
        isTrue,
      );
    },
    skip: infuraId.isEmpty
        ? 'Tests require the INFURA_ID environment variable'
        : null,
  );

  test(
    'Gas Estimation',
    () async {
      final rates = await getGasInEIP1559(
        url,
        block: '0xfa8925',
      );

      expect(rates[2].estimatedGas.toString(), '15363531999');
    },
    skip: infuraId.isEmpty
        ? 'Tests require the INFURA_ID environment variable'
        : null,
  );
}
