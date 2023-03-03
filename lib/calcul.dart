import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class FacturationSuivantButton extends StatefulWidget {
  const FacturationSuivantButton({
    Key? key,
  }) : super(key: key);

  @override
  State<FacturationSuivantButton> createState() =>
      _FacturationSuivantButtonState();
}

class _FacturationSuivantButtonState extends State<FacturationSuivantButton> {
  Controller controller = Get.find<Controller>();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (controller.language.value == "fr") {
          controller.language.value = "en";
        } else {
          controller.language.value = "fr";
        }
        controller.changeLanguage(
            controller.language.value, controller.language.value);
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(100, 25),
        backgroundColor: const Color(0xffE2122E),
        maximumSize: const Size(120, 30),
        // onPrimary: Colors.black,
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
      child: //Padding(
          // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          //child:
          Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'calcul'.tr,
            style: const TextStyle(
                letterSpacing: 2,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          )
        ],
      ),
      // )
    );
  }
}
