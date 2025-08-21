import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova/core/cubit/locale_cubit.dart';
import 'package:nova/core/utils/app_colors.dart';

const Map<String, String> _langLabels = {'en': 'EN', 'ar': 'عربي'};

class DropDownLang extends StatelessWidget {
  const DropDownLang({super.key});

  @override
  Widget build(BuildContext context) {
    final currentCode = context.watch<LocaleCubit>().state.languageCode;

    return DropdownButton(
      menuWidth: 70,
      menuMaxHeight: 100,
      dropdownColor: AppColors.offWhite,
      underline: const SizedBox(),
      value: currentCode,
      items: _langLabels.keys
          .map(
            (code) =>
                DropdownMenuItem(value: code, child: Text(_langLabels[code]!)),
          )
          .toList(),

      onChanged: (value) {
        if (value == null) return;
        context.read<LocaleCubit>().setLocale(Locale(value));
      },
    );
  }
}
