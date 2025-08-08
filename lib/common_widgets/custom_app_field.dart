import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finance_house/core/validations/field_validators.dart';

class CustomAppField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final TextStyle? textStyle;
  final Function(String) onChange;
  final VoidCallback? onClearBtnClick;
  final VoidCallback? onFieldClick;
  final bool isValid;
  final bool isDisabled;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final double? radius;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color disabledColor;
  final Color validColor;
  final Color inValidColor;
  final List<BoxShadow>? boxShadow;
  final BorderType borderType;
  final Color borderColor;
  final FieldValidator? validator;
  final EdgeInsets? contentPadding;
  final EdgeInsets? labelPadding;
  final AutovalidateMode? validationMode;
  final String? label;
  const CustomAppField({
    super.key,
    required this.controller,
    required this.hint,
    required this.onChange,
    this.isValid = true,
    this.onClearBtnClick,
    this.onFieldClick,
    this.inputFormatter,
    this.keyboardType,
    this.maxLength,
    this.radius,
    this.suffixIcon,
    this.label,
    this.prefixIcon,
    this.maxLines,
    this.hintTextStyle,
    this.textStyle,
    this.validator,
    this.boxShadow,
    this.contentPadding,
    this.labelTextStyle,
    this.labelPadding,
    this.borderType = BorderType.underline,
    this.isDisabled = false,
    this.validationMode=AutovalidateMode.onUnfocus,
    this.disabledColor = const Color(0xFFD9DAE1),
    this.validColor = const Color(0xFFFFFFFF),
    this.inValidColor = const Color(0xFFF5F6FA),
    this.borderColor = const Color(0xFF506BE3),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Row(
            children: [
              Padding(
                  padding: labelPadding ?? EdgeInsets.zero,
                  child: Text(
                    label!,
                    style: labelTextStyle ?? TextStyle(fontSize: 12.sp, color: Colors.grey),
                  )),
              if (validator!=null)
                Text(
                  "  *",
                  style: TextStyle(fontSize: 14.sp, color: Colors.red),
                )
            ],
          ),
        Container(
          decoration: BoxDecoration(
            color: isDisabled
                ? disabledColor
                : isValid
                    ? validColor
                    : inValidColor,
            borderRadius: BorderRadius.circular(radius ?? 10.r),
            boxShadow: boxShadow,
          ),
          child: TextFormField(
            controller: controller,
            readOnly: isDisabled,
            onTap: onFieldClick,
            maxLength: maxLength,
            maxLines: maxLines,
            autovalidateMode: validationMode,
            keyboardType: keyboardType,
            onChanged: onChange,
            validator: validator != null
                ? (value) => validator!.validate(value ?? '')
                : null,
            inputFormatters: inputFormatter,
            style: textStyle,
            decoration: InputDecoration(
              hintText: hint,
              enabledBorder: _getInputBorder(),
              focusedBorder: _getFocusedBorder(),
              disabledBorder: _getBorder(Colors.grey),
              errorBorder: _getBorder(Colors.red.withAlpha(100)),
              focusedErrorBorder: _getBorder(Colors.red),
              border: InputBorder.none,
              hintStyle: hintTextStyle,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              alignLabelWithHint: true,
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(vertical: 16.h, horizontal: 0.w),
            ),
          ),
        ),
      ],
    );
  }

  InputBorder _getInputBorder() {
    switch (borderType) {
      case BorderType.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: borderColor.withAlpha(100), width: 1),
        );
      case BorderType.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor.withAlpha(100), width: 1),
        );
      case BorderType.none:
        return InputBorder.none;
      default:
        return InputBorder.none;
    }
  }

  InputBorder _getFocusedBorder() {
    switch (borderType) {
      case BorderType.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: borderColor, width: 1.2),
        );
      case BorderType.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1.2),
        );
      case BorderType.none:
        return InputBorder.none;
      default:
        return InputBorder.none;
    }
  }

  InputBorder _getBorder(Color borderColor) {
    switch (borderType) {
      case BorderType.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: borderColor, width: 1.0),
        );
      case BorderType.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1.0),
        );
      case BorderType.none:
        return InputBorder.none;
      default:
        return InputBorder.none;
    }
  }
}

enum BorderType {
  outlined,
  underline,
  none,
}

