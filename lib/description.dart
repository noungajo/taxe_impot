import 'package:flutter/material.dart';
import 'package:taxe/andaal_extension.dart';

import 'descrption_style.dart';

// ignore: must_be_immutable
class Description extends StatefulWidget {
  Description(this.titre, this.description, {super.key});
  String titre;
  String description;
  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
            top: size.width * 0.03,
            bottom: size.width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  widget.titre.toString().toCapitalized(),
                  style: itemtitlestyle,
                ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Text(
                widget.description.toCapitalized(),
                style: itemdescritionstyle,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
