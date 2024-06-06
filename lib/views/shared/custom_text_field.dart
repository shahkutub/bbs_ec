/* created by Aqib
created date: 26/9/2023

updated by Aqib @ 27/09/23 11.37 (changed logic with obscureText)

This is a base reusable text field widget */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/dimensions.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.leading,
      this.trailing,
      this.isPassword,
      required this.controller,
      required this.hintText,
      this.focusNode,
      this.nextFocus,
      this.elevation = 2.0,
      this.inputType,
      this.inputAction,
      this.onChanged,
      this.onSubmit,
      required this.maxLines,
      this.capitalization,
      this.textAlign,
      this.isNumber,
      this.obscureText,
      this.textHeight,
      required this.title,
      this.maxLength,
      this.readOnly});

  final Widget? leading;
  final Widget? trailing;
  final bool? isPassword;
  final double elevation;
  final TextEditingController controller;
  final String hintText;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final bool? obscureText;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final ValueChanged<String>? onChanged;
  final Function? onSubmit;
  final int maxLines;
  final TextCapitalization? capitalization;
  final TextAlign? textAlign;
  final bool? isNumber;
  final String title;
  final double? textHeight;
  final int? maxLength;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: Dimensions.PADDING_SIZE_LARGE,
          child: Text(
            title,
            style: TextStyle(
                fontFamily: 'NotoSanB',
                fontSize: Dimensions.fontSizeLarge,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        ),
        Material(
          elevation: elevation,
          borderRadius:
              const BorderRadius.all(Radius.circular(Dimensions.RADIUS_SMALL)),
          child: Container(
            height: textHeight ?? 56,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              color: Theme.of(context).primaryColor.withOpacity(0.05),
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_SMALL),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: leading ?? const SizedBox.shrink(),
                ),
                Expanded(
                  child: TextField(
                    maxLength: maxLength,
                    maxLines: maxLines,
                    readOnly: readOnly ?? false,
                    controller: controller,
                    focusNode: focusNode,
                    textAlign: textAlign ?? TextAlign.start,
                    enabled: true,
                    style: TextStyle(
                        fontFamily: 'NotoSanB',
                        fontSize: Dimensions.fontSizeLarge),
                    textInputAction:
                        nextFocus == null ? TextInputAction.done : inputAction,
                    keyboardType:
                        isNumber != null ? TextInputType.number : inputType,
                    cursorColor: Theme.of(context).primaryColor,
                    textCapitalization:
                        capitalization ?? TextCapitalization.none,
                    autofocus: false,
                    obscureText: (isPassword != null && isPassword!)
                        ? (obscureText != null && obscureText!)
                            ? true
                            : false
                        : false,
                    inputFormatters: isNumber != null
                        ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
                        : null,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.RADIUS_SMALL),
                        borderSide:
                            const BorderSide(style: BorderStyle.none, width: 0),
                      ),
                      isDense: true,
                      hintText: hintText,
                      fillColor:
                          Theme.of(context).primaryColor.withOpacity(0.0),
                      hintStyle: TextStyle(
                          fontFamily: 'NotoSanB',
                          fontSize: Dimensions.fontSizeLarge,
                          color: Theme.of(context).hintColor),
                      filled: true,
                    ),
                    onSubmitted: (text) => nextFocus != null
                        ? FocusScope.of(context).requestFocus(nextFocus)
                        : onSubmit != null
                            ? onSubmit!(text)
                            : null,
                    onChanged: onChanged,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: trailing ?? const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
