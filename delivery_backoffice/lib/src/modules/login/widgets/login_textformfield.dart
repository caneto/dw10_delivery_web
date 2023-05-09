import 'package:flutter/material.dart';

class LoginTextformfield extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String hintText;
  final void Function(String)? onFieldSubmitted;
  final ValueNotifier<bool> _obscureTextVN;

  LoginTextformfield({
    Key? key,
    required this.title,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.onFieldSubmitted,
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
              keyboardType: keyboardType,
              controller: controller,
              validator: validator,
              obscureText: obscureTextVNValue,
              onFieldSubmitted: onFieldSubmitted,
              decoration: InputDecoration(
                labelText: title,
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
