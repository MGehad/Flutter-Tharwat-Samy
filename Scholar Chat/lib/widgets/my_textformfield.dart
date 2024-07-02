import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final Function(String)? onChanged;
  final IconData icon;

  const MyTextFormField(
      {Key? key, required this.labelText, this.onChanged, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (!(value!.contains('@')) ||
            !(value.contains('.com')) ||
            value.contains('@.')) {
          return 'Write correct email';
        } else if (value.isEmpty) {
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
  final Function(String)? onChanged;

  const MyPasswordFormField({
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
