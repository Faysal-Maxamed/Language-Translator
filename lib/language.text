import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslatorPage extends StatefulWidget {
  const LanguageTranslatorPage({super.key});

  @override
  State<LanguageTranslatorPage> createState() => _LanguageTranslatorPageState();
}

class _LanguageTranslatorPageState extends State<LanguageTranslatorPage> {
  var languages = ["Somali", "English", "Arabic"];
  var originallanguage = "From";
  var destinationLanguage = "To";
  var Output = "";
  TextEditingController LanguageController = TextEditingController();

  void translate(String src, String dest, String input) async {
    if (src == "--" || dest == "--") {
      setState(() {
        Output = "Failed to translate. Please select valid languages.";
      });
      return;
    }

    GoogleTranslator translator = GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);

    setState(() {
      Output = translation.text;
    });

    print(Output);
  }

  String getLanguageCode(String language) {
    if (language == "Somali") {
      return "so";
    } else if (language == "English") {
      return "en";
    } else if (language == "Arabic") {
      return "ar";
    }
    return "--";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Language Translator"),
        backgroundColor: Colors.teal,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton(
                  value: originallanguage == "From" ? null : originallanguage,
                  hint: Text(
                    "Select Language",
                    style: TextStyle(color: Colors.white),
                  ),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: languages.map((String dropdownItem) {
                    return DropdownMenuItem(
                      value: dropdownItem,
                      child: Text(dropdownItem),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      originallanguage = value!;
                    });
                  },
                ),
                Icon(Icons.arrow_right_alt_outlined, color: Colors.white),
                DropdownButton(
                  value: destinationLanguage == "To" ? null : destinationLanguage,
                  hint: Text(
                    "Select Language",
                    style: TextStyle(color: Colors.white),
                  ),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: languages.map((String dropdownItem) {
                    return DropdownMenuItem(
                      value: dropdownItem,
                      child: Text(dropdownItem),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      destinationLanguage = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                cursorColor: Colors.white,
                controller: LanguageController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  hintText: "Enter your text....",
                  errorStyle: TextStyle(color: Colors.red),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  if (LanguageController.text.isEmpty) {
                    setState(() {
                      Output = "Please enter text to translate.";
                    });
                    return;
                  }

                  translate(
                    getLanguageCode(originallanguage),
                    getLanguageCode(destinationLanguage),
                    LanguageController.text,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff2b3c5a),
                ),
                child: Text(
                  "Translate",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "\n$Output",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
