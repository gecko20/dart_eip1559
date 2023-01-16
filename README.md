[![pub package](https://img.shields.io/pub/v/eip1559.svg)](https://pub.dartlang.org/packages/eip1559)

EIP-1559 Ethereum and Web3 market fee and gas estimation.

## Getting Started

In your `pubspec.yaml` file add:

``` yaml
dependencies:
  eip1559: any
```

Then, in your code import and use the package:

``` dart
import 'package:eip1559/eip1559.dart';

const infuraId = 'YOUR_INFURA_ID';

void main() {
  const url = 'https://mainnet.infura.io/v3/$infuraId';
  var rates = getGasInEIP1559(url);
  print(rates);
}
```
