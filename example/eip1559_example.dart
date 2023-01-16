import 'dart:io';
import 'package:eip1559/eip1559.dart';

final infuraId = Platform.environment["INFURA_ID"];

void main() {
  final url = 'https://mainnet.infura.io/v3/$infuraId';
  var rates = getGasInEIP1559(url);
  print(rates);
}
