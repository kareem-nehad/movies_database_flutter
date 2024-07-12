// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "moviesScreen": {
    "moviesDatabase": "مكتبة الافلام",
    "search": "ابحث عن فيلم.."
  },
  "movieDetails": {
    "releaseDate": "تاريخ الاصدار: ",
    "overview": "نظرة عامة",
    "bookNow": "احجز الان",
    "otherPopular": "افلام مفضلة اخرى"
  },
  "drawer": {
    "changeTheme": "تغيير النمط",
    "contactUs": "اتصل بنا"
  }
};
static const Map<String,dynamic> en = {
  "moviesScreen": {
    "moviesDatabase": "Movies Database",
    "search": "Search for a movie.."
  },
  "movieDetails": {
    "releaseDate": "Release Date: ",
    "overview": "Overview",
    "bookNow": "Book now",
    "otherPopular": "Other Popular Movies"
  },
  "drawer": {
    "changeTheme": "Change theme",
    "contactUs": "Contact us"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
