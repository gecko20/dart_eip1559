import 'dart:io';
import 'package:eip1559/eip1559.dart';
import 'package:test/test.dart';

final infuraId = Platform.environment["INFURA_ID"];

void main() {
  final url = 'https://mainnet.infura.io/v3/$infuraId';
  test('Gas Estimation', () async {
    final rates = await getGasInEIP1559(
      url,
      block: '0xfa8925',
    );

    expect(rates[2].estimatedGas.toString(), '15363531999');
  });
}
