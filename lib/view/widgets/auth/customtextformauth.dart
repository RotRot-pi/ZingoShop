import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/core/functions/validate_auth_inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustonTextFormAuth extends StatefulWidget {
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
  State<CustonTextFormAuth> createState() => _CustonTextFormAuthState();
}

class _CustonTextFormAuthState extends State<CustonTextFormAuth> {
  late FocusNode _focusNode;
  bool isTaped = false;
  @override
  void initState() {
    _focusNode = FocusNode()..addListener(() => isTapedFunc());
    super.initState();
  }

  isTapedFunc() {
    print("Has Focus: ${_focusNode.hasFocus}");
    print("Is Taped:$isTaped");
    setState(() {
      isTaped = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppSpacing.addEdgeInsetsOnly(bottom: h20),
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        validator: widget.validator,
        obscureText: widget.obscureText ?? false,
        keyboardType: widget.inputType == AuthInputType.phone
            ? TextInputType.phone
            : TextInputType.text,
        cursorColor: AppColors.primaryColor,
        cursorHeight: 24.h,
        style: const TextStyle(
            color: AppColors.black, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            errorMaxLines: 3,
            hintText: widget.hinttext,
            hintStyle: TextStyle(
              fontSize: s16.sp,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: AppSpacing.addEdgeInsetsSymmetric(
                vertical: p4, horizontal: p28),
            label: Container(
                margin: AppSpacing.addEdgeInsetsSymmetric(horizontal: m8),
                child: Text(
                  widget.labeltext,
                  style: TextStyle(
                      fontSize: s16.sp,
                      color:
                          isTaped ? AppColors.primaryColor : AppColors.black),
                )),
            suffixIcon: widget.inputType == AuthInputType.password
                ? GestureDetector(
                    onTap: widget.onIconTap,
                    child: widget.obscureText == false
                        ? Icon(Icons.lock_open_outlined,
                            color: isTaped
                                ? AppColors.primaryColor
                                : AppColors.black)
                        : Icon(Icons.lock_outlined,
                            color: isTaped
                                ? AppColors.primaryColor
                                : AppColors.black),
                  )
                : Icon(
                    widget.iconData,
                    color: isTaped ? AppColors.primaryColor : AppColors.black,
                  ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(r20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(r20),
              borderSide:
                  BorderSide(color: AppColors.primaryColor, width: 2.5.w),
            )),
      ),
    );
  }
}
