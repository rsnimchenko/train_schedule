import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  TextEditingController _controller;
  final String _textField;
  final Function _setTextField;
  final String _hintField;

  InputField(this._hintField, this._textField, this._setTextField) {
    _controller = TextEditingController();
    _controller.value = TextEditingValue(
      text: _textField,
      selection: TextSelection.fromPosition(
        TextPosition(offset: _textField.length),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      // initialValue: model.fieldSource,
      onChanged: (text) => _setTextField(text),
      decoration: InputDecoration(
        labelText: _hintField,
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(15),
          borderSide: new BorderSide(),
        ),
      ),
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      validator: (value) {
        if (value.isEmpty)
          return 'Поле не повинно бути порожнім';
        else
          return null;
      },
    );
  }
}