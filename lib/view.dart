import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'calcul.dart';
import 'checkbox.dart';
import 'controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'descrption_style.dart';

class TaxeImpot extends StatefulWidget {
  const TaxeImpot({super.key});

  @override
  State<TaxeImpot> createState() => _TaxeImpotState();
}

class _TaxeImpotState extends State<TaxeImpot> {
  Controller controller = Get.find<Controller>();

  bool show = false;
  TextEditingController montantController = TextEditingController();
  var items = ["Français", "Englais"];
  var dropValue = "Français";
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("title_app".tr),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  buttonWidth: 100,
                  items: items
                      .map((item) =>
                          DropdownMenuItem(value: item, child: Text(item)))
                      .toList(),
                  value: dropValue,
                  onChanged: (value) {
                    final param = value!.toLowerCase().substring(0, 2);
                    controller.changeLanguage(param, param);
                    dropValue = value;
                  },
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 19,
                  iconEnabledColor: const Color.fromARGB(255, 3, 3, 3),
                  iconDisabledColor: const Color.fromARGB(255, 240, 232, 232),
                  itemHeight: 40,
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              /*
              
formulaire pour la saisie du salaire donc on aimerait calculer la taxe
              */
              salaireField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              /*
les checkbox, les forms, les résultats
              */
              Container(
                color: Colors.white,
                height: height * 0.45,
                child: SingleChildScrollView(
                    child: Column(
                  children: List.generate(controller.impots.length, (index) {
                    return CheckboxImpot(
                      index: index,
                    );
                  }),
                )),
              ),

              Text(
                montantController.text,
                style: drawerStyle,
              ),
              // les taxes et leur valeur
              ...List.generate(controller.impots.length, (index) {
                return show ? Text("Il y ayra les valeur ici") : Container();
              }),
              SizedBox(height: height * 0.11, child: FacturationSuivantButton())
            ],
          ),
        ),
      ),
    );
  }

  TextField buildTextField() {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(style: BorderStyle.none)),
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.grey),
        labelText: "Name",
        hintText: "Field",
      ),
      onChanged: (value) {
        print(value);
      },
    );
  }

  TextField buildNumberField() {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(style: BorderStyle.none)),
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.grey),
        labelText: "Le label",
        hintText: "Le hint",
      ),
      controller: TextEditingController(text: ""),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onChanged: (value) {},
    );
  }

  Widget salaireField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.08,
      child: TextFormField(
        onChanged: (email) {
          //registerController.checkEmail(email);
        },
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black,
        validator: (value) {
          if (value!.isEmpty) {
            return "validator_message".tr;
          }
          return null;
        },
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: montantController,
        obscureText: false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 8, bottom: 8, top: 8),
          hintText: "hint_text_valeur_entre".tr,
          hintStyle: searchStyle,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffAEAEAE), width: 1.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffAEAEAE), width: 1.0),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffAEAEAE), width: 1.0),
          ),
          suffixIcon: const Icon(
            Icons.money,
            color: Colors.red,
          ),
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
/*
SizedBox(
                          width: size.width * 0.6,
                          height: size.height * 0.08,
                          child: TextFormField(
                            onChanged: (email) {
                              //registerController.checkEmail(email);
                            },
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            validator: (value) {
                              final check = validateEmail(value);

                              if (check != "") {
                                emailValidator.value = check;
                              } else {
                                emailValidator.value = "";
                              }
                              return null;
                            },
                            controller: emailController,
                            obscureText: false,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 8, bottom: 8, top: 8),
                              hintText: hint_text_email,
                              hintStyle: textField,
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffAEAEAE), width: 1.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffAEAEAE), width: 1.0),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffAEAEAE), width: 1.0),
                              ),
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        Obx(
                          () => emailValidator.value == "" ||
                                  emailValidator.value == "1"
                              ? Container()
                              : SizedBox(
                                  width: size.width * 0.6,
                                  child: Text(
                                    emailValidator.value,
                                    style: errorStyle,
                                  ),
                                ),
                        ),*/