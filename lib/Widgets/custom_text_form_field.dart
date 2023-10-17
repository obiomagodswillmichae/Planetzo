import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:planet_b/Utils/page_service.dart';

import '../Styles/colors.dart';

class CustomTextFormFieldController extends GetxController {
  var obscureText = false.obs;
  var wasValidated = false.obs;
}

class CustomTextFormField extends StatelessWidget {
  final CustomTextFormFieldController _controller =
      CustomTextFormFieldController();

  final String labelText;
  final String? hintText;
  final TextStyle? style;
  final bool obscureText, obscureTextWithToggle, readOnly;
  final GestureTapCallback? onTap;
  final TextEditingController? controller;
  // final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Widget? leadingIcon;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  final bool filled;
  final BorderRadius? borderRadius;
  final Widget? trailling;
  final double? verticalPadding;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool border;
  final Widget? leading;
  final Function(String)? onSubmitted;
  final bool enabled;
  final bool prefixIconConstrained;
  final bool isRequired;

  CustomTextFormField({
    Key? key,
    required this.labelText,
    this.isRequired = false,
    this.hintText,
    this.style,
    this.obscureText = false,
    this.obscureTextWithToggle = false,
    this.readOnly = false,
    this.onTap,
    this.leadingIcon,
    this.controller,
    // this.inputType,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.minLines,
    this.maxLines,
    this.filled = true,
    this.borderRadius,
    this.trailling,
    this.verticalPadding,
    this.focusNode,
    this.textInputAction,
    this.onSubmitted,
    this.border = true,
    this.leading,
    this.enabled = true,
    this.prefixIconConstrained = true,
  }) : super(key: key) {
    _controller.obscureText.value = obscureTextWithToggle || obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText.isNotEmpty) ...[
          Row(
            children: [
              Text(
                labelText.capitalizeFirst!,
                style: PageService.labelStyle
              ),
              
            ],
          ),
          const SizedBox(height: 6),
        ],
        Obx(
          () => ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(15),
            child: TextFormField(
              onFieldSubmitted: (e) => onSubmitted!(e),
              textInputAction: textInputAction,
              focusNode: focusNode,
              cursorColor: AppColor.primaryColor,
              maxLines: maxLines ?? 1,
              keyboardType: keyboardType,
              style: style,
              controller: controller,
              validator: (value) {
                if (validator == null) return null;
                _controller.wasValidated.value = true;
                return validator!(value);
              },
              autovalidateMode: _controller.wasValidated.value
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              inputFormatters: inputFormatters,
              obscureText: _controller.obscureText.value,
              readOnly: readOnly,
              onTap: onTap,
              onChanged: onChanged,
              decoration: InputDecoration(
                prefixIcon: leadingIcon,
                prefixIconConstraints: prefixIconConstrained
                    ? Theme.of(context).visualDensity.effectiveConstraints(
                          const BoxConstraints(
                            minWidth: kMinInteractiveDimension,
                            minHeight: kMinInteractiveDimension,
                          ),
                        )
                    : const BoxConstraints(minWidth: 0, minHeight: 0),
                // prefixIconConstraints:
                //     const BoxConstraints(minWidth: 0, minHeight: 0),
                hintText: hintText,
                filled: filled,
                enabled: enabled,
                hintStyle: TextStyle(
                            fontSize: 16,
                            color: AppColor.black,
                            fontWeight: FontWeight.w600),
                enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xffF5F5F5)),
                ),
                errorBorder: !border
                    ? InputBorder.none
                    : OutlineInputBorder(
                        borderRadius:
                            borderRadius ?? BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Color(0xffF5F5F5)),
                      ),
                border: !border
                    ? InputBorder.none
                    : OutlineInputBorder(
                        borderRadius:
                            borderRadius ?? BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Color(0xffF5F5F5)),
                      ),
                focusedBorder: !border
                    ? InputBorder.none
                    : OutlineInputBorder(
                        borderRadius:
                            borderRadius ?? BorderRadius.circular(10),
                        borderSide:  const BorderSide(color: Color(0xffF5F5F5)),
                      ),
                suffixIcon: obscureTextWithToggle
                    ? IconButton(
                        onPressed: () => _controller.obscureText.toggle(),
                        icon: Icon(
                          _controller.obscureText.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColor.primaryColor,
                        ),
                      )
                    : trailling,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: verticalPadding ?? 13,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
