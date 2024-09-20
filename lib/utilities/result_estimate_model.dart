class ResultEst {
  String consult;
  List<String> labs;
  ResultEst({
    required this.consult,
    required this.labs,
  });

  @override
  String toString() => 'ResultEst(consult: $consult, labs: $labs)';
}