import 'package:flutter/material.dart';
import 'package:nova/core/utils/app_colors.dart';

const List<String> _lang = ['en', 'ar'];

class DropDownLang extends StatefulWidget {
  const DropDownLang({super.key});

  @override
  State<DropDownLang> createState() => _DropDownLangState();
}

class _DropDownLangState extends State<DropDownLang> {
  String dropDownValue = _lang.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      menuWidth: 70,
      menuMaxHeight: 100,
      dropdownColor: AppColors.lightGray,
      underline: const SizedBox(),
      value: dropDownValue,
      items: _lang
          .map<DropdownMenuItem<String>>(
            (String val) => DropdownMenuItem(value: val, child: Text(val)),
          )
          .toList(),
      onChanged: (val) => setState(() {
        dropDownValue = val!;
      }),
    );
  }
}
