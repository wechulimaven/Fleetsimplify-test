import '../../../shared/configs/assets.dart';

class ChipsData {
  final String label;
  final String asset;
  final bool selected;

  ChipsData(this.label, this.asset, this.selected);
}

List<ChipsData> chipList = [
  ChipsData('Calculate', Assets.calc, false),
  ChipsData('Inspect Car', Assets.inspect, false),
  ChipsData('Accept terms', Assets.terms, false),
];
