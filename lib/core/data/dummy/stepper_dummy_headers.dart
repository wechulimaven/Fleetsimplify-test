import 'package:dagizo_app/shared/configs/assets.dart';

class InspectionModel {
  final String title;
  final String assetFile;
  final bool isAvailable;
  final int level;

  InspectionModel(
      {required this.title,
      required this.assetFile,
      required this.isAvailable,
      required this.level});
}

List<InspectionModel> headersList = [
  InspectionModel(
      title: 'Jack', isAvailable: false, level: 3, assetFile: Assets.jack),
  InspectionModel(
      title: 'Sparewheel',
      isAvailable: false,
      level: 3,
      assetFile: Assets.wheel),
  InspectionModel(
      title: 'Car radio',
      isAvailable: false,
      level: 3,
      assetFile: Assets.radio),
  InspectionModel(
      title: 'Headlight',
      isAvailable: false,
      level: 3,
      assetFile: Assets.headlight),
  InspectionModel(
      title: 'Submit',
      isAvailable: false,
      level: 3,
      assetFile: Assets.logoIcon),
];
