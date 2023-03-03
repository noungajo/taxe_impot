import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxe/andaal_extension.dart';
import 'package:taxe/description.dart';

import 'controller.dart';

// ignore: must_be_immutable
class CheckboxImpot extends StatefulWidget {
  CheckboxImpot({super.key, required this.index});
  int index;
  @override
  State<CheckboxImpot> createState() => _CheckboxImpotState();
}

class _CheckboxImpotState extends State<CheckboxImpot> {
  bool isChecked = false;
  Controller controller = Get.find<Controller>();
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("text_annonc_info_selection".tr),
          content: Text(
              '${controller.impots[widget.index].tr}  : ${controller.documentation[widget.index].subStringPerso().tr}'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text("dialog_cancel".tr),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text("dialog_valid".tr),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Description(
                            controller.impots[widget.index].tr,
                            controller.documentation[widget.index].tr)));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: controller.selectedTaxe[widget.index],
          onChanged: (bool? value) {
            setState(() {
              controller.selectedTaxe[widget.index] = value!;
            });
          },
        ),
        InkWell(
            onTap: () => _dialogBuilder(context),
            child: Text(controller.impots[widget.index].tr)),
      ],
    );
  }
}
