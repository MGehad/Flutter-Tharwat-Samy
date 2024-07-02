import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String labelText;
  Function(String)? onChanged;
  IconData icon;

  MyTextFormField(
      {Key? key, required this.labelText, this.onChanged, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff85fce6),
          ),
        ),
        prefixIcon: Icon(
          icon,
          color: const Color(0xff85fce6),
        ),
      ),
    );
  }
}

class MyPasswordFormField extends StatefulWidget {
  Function(String)? onChanged;

  MyPasswordFormField({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  State<MyPasswordFormField> createState() => _MyPasswordFormFieldState();
}

class _MyPasswordFormFieldState extends State<MyPasswordFormField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscured,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      onChanged: widget.onChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelText: 'password',
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff85fce6),
            ),
          ),
          prefixIcon: const Icon(
            Icons.password,
            color: Color(0xff85fce6),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscured = !isObscured;
              });
            },
            icon: Icon(
              Icons.remove_red_eye,
              color: (isObscured == true)
                  ? const Color(0xff006D84)
                  : const Color(0xff85fce6),
            ),
          )),
    );
  }
}
