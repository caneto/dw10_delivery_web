import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductTextformfield extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String hintText;
  final void Function(String)? onFieldSubmitted;
  final ValueNotifier<bool> _obscureTextVN;
  final List<TextInputFormatter>? inputFormatters;
  final int? minLines;
  final int? maxLines;
  final bool? alignLabelWithHint;

  ProductTextformfield({
    Key? key,
    required this.title,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.onFieldSubmitted, 
    this.inputFormatters, 
    this.minLines, this.maxLines, 
    this.alignLabelWithHint,
  })  : _obscureTextVN = ValueNotifier<bool>(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextVNValue, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              minLines: minLines,
              maxLines: maxLines,
              keyboardType: keyboardType,
              controller: controller,
              validator: validator,
              obscureText: obscureTextVNValue,
              onFieldSubmitted: onFieldSubmitted,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                labelText: title,
                alignLabelWithHint: alignLabelWithHint,
                labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  gapPadding: 0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  gapPadding: 0,
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  gapPadding: 0,
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                suffixIcon: obscureText
                    ? IconButton(
                        onPressed: () {
                          _obscureTextVN.value = !obscureTextVNValue;
                        },
                        icon: Icon(
                          obscureTextVNValue ? Icons.lock : Icons.lock_open,
                        ),
                      )
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }
}
