import 'package:flutter/material.dart';

class DropdownButtonFormFieldWidget<T> extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T) onChanged;
  final bool isLoading;
  final FocusNode focusNode;
  final String Function(T) validator;
  final void Function(T) onSaved;

  const DropdownButtonFormFieldWidget({
    @required this.prefixIcon,
    @required this.value,
    @required this.items,
    @required this.onChanged,
    @required this.hintText,
    @required this.isLoading,
    @required this.focusNode,
    @required this.onSaved,
    @required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: DropdownButtonFormField<T>(
        onSaved: onSaved,
        validator: validator,
        focusNode: focusNode,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(prefixIcon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        value: value,
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
