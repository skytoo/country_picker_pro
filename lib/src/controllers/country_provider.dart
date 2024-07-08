import 'package:collection/collection.dart';
import '../country.dart';
import '../res/country_json.dart';

/// A class that provides access to country data.
class CountryProvider {
  final List<Country> _countries;

  /// Constructs a new [CountryProvider] and initializes the list of countries.
  CountryProvider()
      : _countries =
            countryCodes.map((country) => Country.from(json: country)).where((c)=>c.region == "Africa").toList();

  /// Returns a list of all countries.
  List<Country> getAll() {
    return _countries;
  }

  /// Finds a country by its country code.
  ///
  /// Returns `null` if no country is found with the given code.
  Country? findByCode(String? code) {
    final uppercaseCode = code?.toUpperCase();
    return _countries
        .firstWhereOrNull((country) => country.countryCode == uppercaseCode && country.region == "Africa");
  }

  Country? findByRegion(String? region) {
    return _countries
        .firstWhereOrNull((country) => country.region == Africa);
  }

  /// Finds a country by its name.
  ///
  /// Returns `null` if no country is found with the given name.
  Country? findByName(String? name) {
    return _countries.firstWhereOrNull((country) => country.name == name && country.region == "Africa");
  }

  /// Finds a list of countries by their country codes.
  ///
  /// Returns a list of countries corresponding to the input codes.
  List<Country> findCountriesByCode(List<String> codes) {
    final List<String> _codes =
        codes.map((code) => code.toUpperCase()).toList();
    final List<Country> countries = [];
    for (final code in _codes) {
      final Country? country = findByCode(code);
      if (country != null) {
        countries.add(country);
      }
    }
    return countries;
  }

  List<Country> findCountriesByRegion(List<String> region) {
    final List<String> _codes =
    region.map((code) => code).toList();
    final List<Country> countries = [];
    for (final code in _codes) {
      final Country? country = findByRegion(code);
      if (country != null) {
        countries.add(country);
      }
    }
    return countries;
  }
}
