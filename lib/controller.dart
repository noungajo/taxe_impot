import 'dart:ui';

import 'package:get/get.dart';

class Controller extends GetxController {
  RxString language = "fr".obs;
  void changeLanguage(var param1, var param2) {
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
  }

  // liste des impôts
  List<String> impots = ['cac', 'irpp', 'tc', 'crtv', 'cf'];
  List selectedTaxe = [false, false, false, false, false];
  List retenues = [
    "CNPS",
    "Avances exceptionnelles",
    "Retenues sur cession",
    "Saisie",
    "Acompte sur salaire",
    "Cotisation syndicale"
  ];
  List<String> documentation = [
    "doc_cac",
    "doc_irpp",
    "doc_taxe_communal",
    "doc_crtv",
    "doc_taxe_foncier"
  ];
  List selectedRevenur = [false, false, false, false, false, false];
}
