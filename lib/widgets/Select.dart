import 'package:flutter/material.dart';

class InputSelect extends StatefulWidget {
  final String hintText;
  final Future<List<String>> options;
  final Function(String) onChanged;

  InputSelect({
    required this.hintText,
    required this.options,
    required this.onChanged,
  });

  @override
  _InputSelectState createState() => _InputSelectState();
}

class _InputSelectState extends State<InputSelect> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[200],
      ),
      child: FutureBuilder<List<String>>(
        future: widget.options,
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.hasData) {
            List<DropdownMenuItem<String>> items = snapshot.data!.map((option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList();
            return DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
              ),
              value: _selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption = newValue;
                });
                widget.onChanged(newValue!);
              },
              items: items,
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
