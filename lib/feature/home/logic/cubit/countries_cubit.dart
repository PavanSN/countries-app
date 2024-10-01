import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:credit_saison/feature/home/static/country_endpoints.dart';
import 'package:credit_saison/feature/home/static/models/countries.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'countries_state.dart';

// URL 1: https://restcountries.com/v3.1/translation/germany
// URL 2: https://restcountries.com/v3.1/translation/india
// URL 3: https://restcountries.com/v3.1/translation/israel
// URL 4: https://restcountries.com/v3.1/translation/lanka
// URL 5: https://restcountries.com/v3.1/translation/italy
// URL 6: https://restcountries.com/v3.1/translation/china
// URL 7: https://restcountries.com/v3.1/translation/korea

enum Regions {
  all,
  germany,
  india,
  israel,
  lanka,
  italy,
  china,
  korea;

  String getEndpoint() {
    switch (this) {
      case Regions.germany:
        return 'germany';
      case Regions.india:
        return 'india';
      case Regions.israel:
        return 'israel';
      case Regions.lanka:
        return 'lanka';
      case Regions.italy:
        return 'italy';
      case Regions.china:
        return 'china';
      case Regions.korea:
        return 'korea';
      default:
        return '';
    }
  }

  static List<String> getAllCountryNames() {
    return [
      'All',
      'Germany',
      'India',
      'Israel',
      'Lanka',
      'Italy',
      'China',
      'Korea'
    ];
  }
}

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(CountriesInitial());

  late List<Countries> countriesModel = [];

  fetchCountries({required Regions region}) async {
    try {
      if (region == Regions.all) {
        getAllCountries();
        return;
      }

      emit(CountriesLoading());

      countriesModel.clear();

      final url =
          '${CountryEndpoints.translationEndpoint}/${region.getEndpoint()}';

      final res = await http.get(Uri.parse(url));

      final modifiedRes = json.decode(res.body) as List;

      countriesModel.add(Countries.fromJson(modifiedRes.first));

      emit(CountriesLoaded(countriesModel));
    } catch (e) {
      emit(CountriesError(e.toString()));
      print(e);
    }
  }

  getAllCountries() async {
    try {
      emit(CountriesLoading());
      countriesModel.clear();

      final _baseEndpoint = '${CountryEndpoints.translationEndpoint}/';

      final res = await http
          .get(Uri.parse(_baseEndpoint + Regions.germany.getEndpoint()));
      final modifiedRes = json.decode(res.body) as List;
      countriesModel.add(Countries.fromJson(modifiedRes.first));

      final res1 = await http
          .get(Uri.parse(_baseEndpoint + Regions.india.getEndpoint()));
      final modifiedRes1 = json.decode(res1.body) as List;
      countriesModel.add(Countries.fromJson(modifiedRes1.first));

      final res2 = await http
          .get(Uri.parse(_baseEndpoint + Regions.israel.getEndpoint()));
      final modifiedRes2 = json.decode(res2.body) as List;
      countriesModel.add(Countries.fromJson(modifiedRes2.first));

      final res3 = await http
          .get(Uri.parse(_baseEndpoint + Regions.lanka.getEndpoint()));
      final modifiedRes3 = json.decode(res3.body) as List;
      countriesModel.add(Countries.fromJson(modifiedRes3.first));

      final res4 = await http
          .get(Uri.parse(_baseEndpoint + Regions.italy.getEndpoint()));
      final modifiedRes4 = json.decode(res4.body) as List;
      countriesModel.add(Countries.fromJson(modifiedRes4.first));

      final res5 = await http
          .get(Uri.parse(_baseEndpoint + Regions.china.getEndpoint()));
      final modifiedRes5 = json.decode(res5.body) as List;
      countriesModel.add(Countries.fromJson(modifiedRes5.first));

      final res6 = await http
          .get(Uri.parse(_baseEndpoint + Regions.korea.getEndpoint()));
      final modifiedRes6 = json.decode(res6.body) as List;
      countriesModel.add(Countries.fromJson(modifiedRes6.first));

      emit(CountriesLoaded(countriesModel));
    } catch (e) {
      print(e);
    }
  }

  clearData() {
    countriesModel.clear();
  }
}
