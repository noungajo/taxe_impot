import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxe/controller.dart';

import 'dictionnaire.dart';
import 'view.dart';

void main() {
  runApp(const MyApp());
  Get.put(Controller());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // It is not mandatory to use named routes, but dynamic urls are interesting.
      initialRoute: '/taxeimpot',
      defaultTransition: Transition.native,
      translations: MyTranslations(),
      locale: const Locale('fr',
          'FR'), //Get.deviceLocale : pour que la première langue soit celle du téléphone
      getPages: [
        //Simple GetPage
        GetPage(name: '/taxeimpot', page: () => const TaxeImpot()),
        // GetPage with custom transitions and bindings
      ],
    );
  }
}
