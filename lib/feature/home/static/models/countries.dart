// To parse this JSON data, do
//
//     final countries = countriesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Countries> countriesFromJson(String str) =>
    List<Countries>.from(json.decode(str).map((x) => Countries.fromJson(x)));

String countriesToJson(List<Countries> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Countries {
  final Name name;
  final List<String> tld;
  final String cca2;
  final String ccn3;
  final String cca3;
  final String cioc;
  final bool independent;
  final String status;
  final bool unMember;
  final Currencies currencies;
  // final Idd idd;
  final List<String> capital;
  final List<String> altSpellings;
  final String region;
  final String subregion;
  // final Languages languages;
  final Map<String, Translation> translations;
  // final List<int> latlng;
  final bool landlocked;
  // final List<String> borders;
  // final int area;
  // final Demonyms demonyms;
  final String flag;
  final Maps maps;
  final int population;
  // final Gini gini;
  final String fifa;
  // final Car car;
  final List<String> timezones;
  final List<String> continents;
  final Flags flags;
  // final CoatOfArms coatOfArms;
  final String startOfWeek;
  // final CapitalInfo capitalInfo;
  // final PostalCode postalCode;

  Countries({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    // required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    // required this.languages,
    required this.translations,
    // required this.latlng,
    required this.landlocked,
    // required this.borders,
    // required this.area,
    // required this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    // required this.gini,
    required this.fifa,
    // required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    // required this.coatOfArms,
    required this.startOfWeek,
    // required this.capitalInfo,
    // required this.postalCode,
  });

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        name: Name.fromJson(json["name"]),
        tld: List<String>.from(json["tld"].map((x) => x)),
        cca2: json["cca2"],
        ccn3: json["ccn3"],
        cca3: json["cca3"],
        cioc: json["cioc"],
        independent: json["independent"],
        status: json["status"],
        unMember: json["unMember"],
        currencies: getCurrencies(json["currencies"]),
        // idd: Idd.fromJson(json["idd"]),
        capital: List<String>.from(json["capital"].map((x) => x)),
        altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
        region: json["region"],
        subregion: json["subregion"],
        // languages: Languages.fromJson(json["languages"]),
        translations: Map.from(json["translations"]).map((k, v) =>
            MapEntry<String, Translation>(k, Translation.fromJson(v))),
        // latlng: List<int>.from(json["latlng"].map((x) => x)),
        landlocked: json["landlocked"],
        // borders: List<String>.from(json["borders"].map((x) => x)),
        // area: json["area"],
        // demonyms: Demonyms.fromJson(json["demonyms"]),
        flag: json["flag"],
        maps: Maps.fromJson(json["maps"]),
        population: json["population"],
        // gini: Gini.fromJson(json["gini"]),
        fifa: json["fifa"],
        // car: Car.fromJson(json["car"]),
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        continents: List<String>.from(json["continents"].map((x) => x)),
        flags: Flags.fromJson(json["flags"]),
        // coatOfArms: CoatOfArms.fromJson(json["coatOfArms"]),
        startOfWeek: json["startOfWeek"],
        // capitalInfo: CapitalInfo.fromJson(json["capitalInfo"]),
        // postalCode: PostalCode.fromJson(json["postalCode"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "tld": List<dynamic>.from(tld.map((x) => x)),
        "cca2": cca2,
        "ccn3": ccn3,
        "cca3": cca3,
        "cioc": cioc,
        "independent": independent,
        "status": status,
        "unMember": unMember,
        "currencies": currencies.toJson(),
        // "idd": idd.toJson(),
        "capital": List<dynamic>.from(capital.map((x) => x)),
        "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
        "region": region,
        "subregion": subregion,
        // "languages": languages.toJson(),
        "translations": Map.from(translations)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        // "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "landlocked": landlocked,
        // "borders": List<dynamic>.from(borders.map((x) => x)),
        // "area": area,
        // "demonyms": demonyms.toJson(),
        "flag": flag,
        "maps": maps.toJson(),
        "population": population,
        // "gini": gini.toJson(),
        "fifa": fifa,
        // "car": car.toJson(),
        "timezones": List<dynamic>.from(timezones.map((x) => x)),
        "continents": List<dynamic>.from(continents.map((x) => x)),
        "flags": flags.toJson(),
        // "coatOfArms": coatOfArms.toJson(),
        "startOfWeek": startOfWeek,
        // "capitalInfo": capitalInfo.toJson(),
        // "postalCode": postalCode.toJson(),
      };

  static getCurrencies(Map<String, dynamic> json) {

    final modifiedJson = {
      'name': json.entries.first.value['name'],
      'symbol': json.entries.first.value['symbol'],
      'code': json.keys.first,
    };

    final currencies = Currencies.fromJson(modifiedJson);

    return currencies;
  }
}

// class CapitalInfo {
//   final List<double> latlng;

//   CapitalInfo({
//     required this.latlng,
//   });

//   factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
//         latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
//       );

//   Map<String, dynamic> toJson() => {
//         "latlng": List<dynamic>.from(latlng.map((x) => x)),
//       };
// }

// class Car {
//   final List<String> signs;
//   final String side;

//   Car({
//     required this.signs,
//     required this.side,
//   });

//   factory Car.fromJson(Map<String, dynamic> json) => Car(
//         signs: List<String>.from(json["signs"].map((x) => x)),
//         side: json["side"],
//       );

//   Map<String, dynamic> toJson() => {
//         "signs": List<dynamic>.from(signs.map((x) => x)),
//         "side": side,
//       };
// }

// class CoatOfArms {
//   final String png;
//   final String svg;

//   CoatOfArms({
//     required this.png,
//     required this.svg,
//   });

//   factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
//         png: json["png"],
//         svg: json["svg"],
//       );

//   Map<String, dynamic> toJson() => {
//         "png": png,
//         "svg": svg,
//       };
// }

class Currencies {
  final String name;
  final String symbol;
  final String code;

  Currencies({
    required this.name,
    required this.symbol,
    required this.code,
  });

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        name: json["name"],
        symbol: json["symbol"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
        "code": code,
      };
}

// class Demonyms {
//   final Eng eng;
//   final Eng fra;

//   Demonyms({
//     required this.eng,
//     required this.fra,
//   });

//   factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
//         eng: Eng.fromJson(json["eng"]),
//         fra: Eng.fromJson(json["fra"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "eng": eng.toJson(),
//         "fra": fra.toJson(),
//       };
// }

// class Eng {
//   final String f;
//   final String m;

//   Eng({
//     required this.f,
//     required this.m,
//   });

//   factory Eng.fromJson(Map<String, dynamic> json) => Eng(
//         f: json["f"],
//         m: json["m"],
//       );

//   Map<String, dynamic> toJson() => {
//         "f": f,
//         "m": m,
//       };
// }

class Flags {
  final String png;
  final String svg;
  // final String alt;

  Flags({
    required this.png,
    required this.svg,
    // required this.alt,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
        // alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        // "alt": alt,
      };
}

// class Gini {
//   final double the2016;

//   Gini({
//     required this.the2016,
//   });

//   factory Gini.fromJson(Map<String, dynamic> json) => Gini(
//         the2016: json["2016"]?.toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "2016": the2016,
//       };
// }

// class Idd {
//   final String root;
//   final List<String> suffixes;

//   Idd({
//     required this.root,
//     required this.suffixes,
//   });

//   factory Idd.fromJson(Map<String, dynamic> json) => Idd(
//         root: json["root"],
//         suffixes: List<String>.from(json["suffixes"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "root": root,
//         "suffixes": List<dynamic>.from(suffixes.map((x) => x)),
//       };
// }

// class Languages {
//   final String deu;

//   Languages({
//     required this.deu,
//   });

//   factory Languages.fromJson(Map<String, dynamic> json) => Languages(
//         deu: json["deu"],
//       );

//   Map<String, dynamic> toJson() => {
//         "deu": deu,
//       };
// }

class Maps {
  final String googleMaps;
  final String openStreetMaps;

  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
      );

  Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
      };
}

class Name {
  final String common;
  final String official;
  // final NativeName nativeName;

  Name({
    required this.common,
    required this.official,
    // required this.nativeName,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        // nativeName: NativeName.fromJson(json["nativeName"]),
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        // "nativeName": nativeName.toJson(),
      };
}

class NativeName {
  final Translation deu;

  NativeName({
    required this.deu,
  });

  factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
        deu: Translation.fromJson(json["deu"]),
      );

  Map<String, dynamic> toJson() => {
        "deu": deu.toJson(),
      };
}

class Translation {
  final String official;
  final String common;

  Translation({
    required this.official,
    required this.common,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };
}

// class PostalCode {
//   final String format;
//   final String regex;

//   PostalCode({
//     required this.format,
//     required this.regex,
//   });

//   factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
//         format: json["format"],
//         regex: json["regex"],
//       );

//   Map<String, dynamic> toJson() => {
//         "format": format,
//         "regex": regex,
//       };
// }
