import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class InputWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final String Function(String) validator;
  final void Function(String) onSaved;
  final void Function(String) onFieldSubmitted;
  final bool isLoading;
  final bool obscureText;
  final void Function() onTapObscureText;

  const InputWidget({
    @required this.hintText,
    @required this.prefixIcon,
    @required this.focusNode,
    @required this.keyboardType,
    @required this.onFieldSubmitted,
    @required this.onSaved,
    @required this.textInputAction,
    @required this.validator,
    @required this.isLoading,
    this.obscureText = false,
    this.onTapObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: TextFormField(
        textInputAction: textInputAction,
        validator: validator,
        keyboardType: keyboardType,
        focusNode: focusNode,
        onSaved: onSaved,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText,
        toolbarOptions: const ToolbarOptions(
          copy: true,
          paste: true,
          cut: true,
          selectAll: true,
        ),
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(prefixIcon),
            suffixIcon: Visibility(
              visible: onTapObscureText != null,
              child: IconButton(
                icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: onTapObscureText,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
