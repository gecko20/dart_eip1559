part of eip1559;

class FeeHistory {
  const FeeHistory(
    this.baseFeePerGas,
    this.oldestBlock,
    this.gasUsedRatio,
    this.reward,
  );

  final BigInt oldestBlock;
  final List<BigInt> baseFeePerGas;
  final List<double> gasUsedRatio;
  final List<List<BigInt>>? reward;
}
