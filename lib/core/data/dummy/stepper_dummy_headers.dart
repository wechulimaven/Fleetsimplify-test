import 'dart:convert';

import 'package:dagizo_app/shared/configs/assets.dart';

class InspectionModel {
  String title;
  String assetFile;
  bool? isAvailable;
  int level;
  int index;

  InspectionModel(
      {required this.title,
      required this.assetFile,
      this.isAvailable,
      required this.index,
      required this.level});

  factory InspectionModel.fromJson(Map<String, dynamic> json) {
    return InspectionModel(
      title: json['title'] as String,
      assetFile: json['assetFile'] as String,
      isAvailable:
          json['isAvailable'] != null ? json['isAvailable'] as bool : null,
      level: json['level'] as int,
      index: json['index'] as int,
    );
  }

  static Map<String, dynamic> toMap(InspectionModel inspectionModel) => {
        'title': inspectionModel.title,
        'assetFile': inspectionModel.assetFile,
        'level': inspectionModel.level,
        'isAvailable': inspectionModel.isAvailable,
        'index': inspectionModel.index,
      };

  static String encode(List<InspectionModel> inspection) => json.encode(
        inspection
            .map<Map<String, dynamic>>(
                (inspection) => InspectionModel.toMap(inspection))
            .toList(),
      );

  static List<InspectionModel> decode(String inspection) =>
      (json.decode(inspection) as List<dynamic>)
          .map<InspectionModel>((item) => InspectionModel.fromJson(item))
          .toList();
}

List<InspectionModel> inspectionList = [
  InspectionModel(
    title: 'Jack',
    // isAvailable: false,
    level: 3,
    assetFile: Assets.jack,
    index: 1,
  ),
  InspectionModel(
      title: 'Sparewheel',
      isAvailable: true,
      level: 3,
      index: 2,
      assetFile: Assets.wheel),
  InspectionModel(
      title: 'Car radio',
      // isAvailable: false,
      level: 3,
      index: 3,
      assetFile: Assets.radio),
  InspectionModel(
      title: 'Headlight',
      // isAvailable: false,
      level: 3,
      index: 4,
      assetFile: Assets.headlight),
  InspectionModel(
      title: 'Submit',
      // isAvailable: false,
      level: 3,
      index: 5,
      assetFile: Assets.logoIcon),
];



// ...


