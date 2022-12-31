import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/src/models/iso_code.dart';

import '../models/country.dart';

class CountryCodeChip extends StatelessWidget {
  final Country country;
  final bool showFlag;
  final bool showDialCode;
  final TextStyle textStyle;
  final EdgeInsets padding;
  final double flagSize;
  final TextDirection? textDirection;

  CountryCodeChip({
    Key? key,
    required IsoCode isoCode,
    this.textStyle = const TextStyle(),
    this.showFlag = true,
    this.showDialCode = true,
    this.padding = const EdgeInsets.all(20),
    this.flagSize = 20,
    this.textDirection,
  })  : country = Country(isoCode, ''),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showFlag) ...[
          CountryFlags.flag(
            country.isoCode.name,
            width: flagSize / 3 * 4,
            height: flagSize,
          ),
          const SizedBox(width: 8),
        ],
        if (showDialCode)
          Text(
            country.displayCountryCode,
            style: textStyle,
            textDirection: textDirection,
          ),
        const Icon(
          Icons.chevron_right_outlined,
          color: Color(0xffAAAAAA),
        ),
      ],
    );
  }
}
