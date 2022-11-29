import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dagizo_app/core/data/local/shared_preference_helper.dart';

import '../../data/dummy/stepper_dummy_headers.dart';

part 'inspection_state.dart';

class InspectionCubit extends Cubit<InspectionState> {
  final SharedHelper sharedPreferenceService;

  InspectionCubit(this.sharedPreferenceService) : super(InspectionInitial());

  Future<void> saveStatus() async {
    try {
      await sharedPreferenceService.saveBool(isStarted, true);
      final String encodedData = InspectionModel.encode(inspectionList);
      await sharedPreferenceService.saveString(inspections, encodedData);
      // await Future.delayed(const Duration(seconds: 2));
      emit(const InspectionSuccess(message: 'Step Saved'));
    } catch (e) {
      Fimber.e(e.toString());
      emit(const InspectionError(error: 'Failed to save'));
    }
  }

  Future<void> checkStatus() async {
    //add initialization logic here if any
    try {
      var status = await sharedPreferenceService.getBool(isStarted);
      if (status != null && status) {
        emit(const InspectionStatus(isStarted: true));
      } else {
        emit(const InspectionStatus(isStarted: false));
      }
    } catch (e) {
      Fimber.e(e.toString());
      emit(const InspectionError(error: 'An error occured geting the data'));
    }
  }

  Future<void> saveProgress(List<InspectionModel> inspectionList) async {
    try {
      final String encodedData = InspectionModel.encode(inspectionList);
      await sharedPreferenceService.saveString(inspections, encodedData);
      // await Future.delayed(const Duration(seconds: 2));
      emit(const InspectionSuccess(message: 'Step Saved'));
    } catch (e) {
      Fimber.e(e.toString());
      emit(const InspectionError(error: 'Failed to save'));
    }
  }

  Future<void> getSavedProgress() async {
    try {
      await sharedPreferenceService.saveBool(isStarted, true);
      await Future.delayed(const Duration(seconds: 2));
      emit(const InspectionSuccess(message: 'Step Saved'));
    } catch (e) {
      Fimber.e(e.toString());
      emit(const InspectionError(error: 'Failed to save'));
    }
  }

  Future<List<InspectionModel>?> getSavedProgressList() async {
    try {
      var status = await sharedPreferenceService.getBool(isStarted);
      if (status != null && status) {
        var data = await sharedPreferenceService.getString(inspections);
        final List<InspectionModel> progress =
            InspectionModel.decode(data ?? '');
        // emit(InspectionResults(inspections: progress));
        return progress;
      }
    } catch (e) {
      Fimber.e(e.toString());
      emit(const InspectionError(error: 'Failed to save'));
    }
    return null;
  }
}
