part of 'inspection_cubit.dart';

abstract class InspectionState extends Equatable {
  const InspectionState();

  @override
  List<Object> get props => [];
}

class InspectionInitial extends InspectionState {}

class InspectionStatus extends InspectionState {
  final bool isStarted;

  const InspectionStatus({this.isStarted = false});
}

class InspectionResults extends InspectionState {
  final List<InspectionModel>? inspections;

  const InspectionResults({this.inspections});
}

class InspectionSuccess extends InspectionState {
  final String? message;

  const InspectionSuccess({this.message});
}

class InspectionError extends InspectionState {
  final String? error;

  const InspectionError({this.error});
}
