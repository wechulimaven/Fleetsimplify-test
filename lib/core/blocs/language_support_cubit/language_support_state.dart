part of 'language_support_cubit.dart';

@immutable
abstract class LanguageSupportState extends Equatable {
  const LanguageSupportState();

  @override
  List<Object> get props => [];
}

class LanguageSupportInitial extends LanguageSupportState {}

class LanguageSupportLoading extends LanguageSupportState {}

class LanguageSupportLoaded extends LanguageSupportState {
  final String language;
  final bool hasCustomLanguage;

  const LanguageSupportLoaded(this.language, this.hasCustomLanguage);

  @override
  List<Object> get props => [language];
}
