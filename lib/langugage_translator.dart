import 'package:flutter/material.dart';

class LangugageTranslatorPage extends StatefulWidget {
  const LangugageTranslatorPage({super.key});

  @override
  State<LangugageTranslatorPage> createState() =>
      _LangugageTranslatorPageState();
}

class _LangugageTranslatorPageState extends State<LangugageTranslatorPage> {
  var langugage = ["Somali", "English", "Turkia"];
  var originallanguage = "From";
  var destionationLanguage = "To";
  var Output = "";
  TextEditingController LanguageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language translator"),
        backgroundColor: Colors.teal,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                DropdownButton(
                  focusColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  iconDisabledColor: Colors.white,
                  hint: Text(
                    originallanguage,
                    style: TextStyle(color: Colors.white),
                  ),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: langugage.map((String dropdowndstringitem) {
                    return DropdownMenuItem(
                      child: Text(dropdowndstringitem),
                      value: dropdowndstringitem,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      originallanguage = value!;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
