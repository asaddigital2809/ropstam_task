import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ropstam_task/utils/app_colors.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  final int? maxLine;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  final bool isPhoneNumber;
  final bool isValidator;
  final String? validatorMessage;
  final Color? fillColor;
  final TextCapitalization capitalization;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String? initialValue;
  final bool isEnabled;
  final int? maxLength;
  final Function(String)? onChanged;
  const CustomTextField(
      {Key? key, this.controller,
        this.hintText,
        this.textInputType,
        this.maxLine,
        this.focusNode,
        this.nextNode,
        this.textInputAction,
        this.isPhoneNumber = false,
        this.isValidator = false,
        this.validatorMessage,
        this.suffixIcon,
        this.capitalization = TextCapitalization.none,
        this.fillColor,
        this.prefixIcon,
        this.initialValue,
        this.isEnabled = true,
        this.maxLength,
        this.onChanged
      }) : super(key: key);

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border:
        Border.all(color: AppColors.TEXT_FIELD_INPUT_DISABLE_BORDER),
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1)) // changes position of shadow
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLine ?? 1,
        textCapitalization: capitalization,
        maxLength: isPhoneNumber ? 10 : maxLength,
        focusNode: focusNode,
        keyboardType: textInputType ?? TextInputType.text,
        //keyboardType: TextInputType.number,
        initialValue: initialValue,
        enabled: isEnabled,
        textInputAction: textInputAction ?? TextInputAction.next,
        onFieldSubmitted: (v) {
          if (nextNode == null) {
            FocusManager.instance.primaryFocus?.unfocus();
          } else {
            FocusScope.of(context).requestFocus(nextNode);
          }
        },
        onChanged: onChanged,
        //autovalidate: true,
        inputFormatters: [
          isPhoneNumber
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter
        ],
        validator: (input) {
          if (input!.isEmpty) {
            if (isValidator) {
              return validatorMessage ?? "";
            }
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText ?? '',
          filled: fillColor != null,
          prefixIcon: prefixIcon ?? null,
          suffixIcon: suffixIcon,
          fillColor: fillColor,
          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
          isDense: true,
          counterText: '',

          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(17)),

          errorStyle: TextStyle(
              color: Colors.red[400],
              fontWeight: FontWeight.bold,
              fontSize: 13,
              height: 2),
          // errorBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: ColorResources.getRed(context)),
          //     borderRadius: BorderRadius.circular(25)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}