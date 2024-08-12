import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:ecommercecourse/core/functions/validate_auth_inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustonTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData? iconData;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AuthInputType? inputType;
  final bool? obscureText;
  final void Function()? onIconTap;
  const CustonTextFormAuth({
    super.key,
    this.inputType,
    this.iconData,
    this.obscureText,
    this.onIconTap,
    required this.hinttext,
    required this.labeltext,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppSpacing.addEdgeInsetsOnly(bottom: h20),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText ?? false,
        keyboardType: inputType == AuthInputType.phone
            ? TextInputType.phone
            : TextInputType.text,
        decoration: InputDecoration(
            errorMaxLines: 3,
            hintText: hinttext,
            hintStyle: TextStyle(fontSize: s16.sp),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: AppSpacing.addEdgeInsetsSymmetric(
                vertical: p4, horizontal: p28),
            label: Container(
                margin: AppSpacing.addEdgeInsetsSymmetric(horizontal: m8),
                child: Text(
                  labeltext,
                  style: TextStyle(fontSize: s16.sp),
                )),
            suffixIcon: inputType == AuthInputType.password
                ? GestureDetector(
                    onTap: onIconTap,
                    child: obscureText == false
                        ? const Icon(Icons.lock_open_outlined)
                        : const Icon(Icons.lock_outlined),
                  )
                : Icon(iconData),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(r20))),
      ),
    );
  }
}
