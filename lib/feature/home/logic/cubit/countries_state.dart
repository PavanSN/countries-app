part of 'countries_cubit.dart';

@immutable
sealed class CountriesState {}

final class CountriesInitial extends CountriesState {}

final class CountriesLoading extends CountriesState {}

final class CountriesLoaded extends CountriesState {
  final List<Countries> countryModel;

  CountriesLoaded(this.countryModel);
}

final class CountriesError extends CountriesState {
  final String message;

  CountriesError(this.message);
}
