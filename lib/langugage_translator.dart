import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LangugageTranslatorPage extends StatefulWidget {
  const LangugageTranslatorPage({super.key});

  @override
  State<LangugageTranslatorPage> createState() =>
      _LangugageTranslatorPageState();
}

class _LangugageTranslatorPageState extends State<LangugageTranslatorPage> {
  List<Map<String, String>> langugages = [
    {"name": "Somali", "code": "so", "flag": "SO"},
    {"name": "English", "code": "en", "flag": "GB"},
    {"name": "Arabic", "code": "ar", "flag": "SA"},
    {"name": "Turkish", "code": "tr", "flag": "TR"},
    {"name": "India", "code": "ID", "flag": "IN"}
  ];
  TextEditingController langugageController = TextEditingController();
  String langugaeFrom = "From";
  var langugaeTo = "To";
  var output = "";
  void translate(String src, String dest, String input) async {
    if (src == "--" || dest == "--") {
      setState(() {
        output = "Failed to translate. Please select valid languages";
      });
      return;
    }

    GoogleTranslator translator = GoogleTranslator();

    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text;
    });

    print(output);
  }

  String getLanguageCode(String language) {
    if (language == "Somali") {
      return "so";
    } else if (language == "English") {
      return "en";
    } else if (language == "Arabic") {
      return "ar";
    } else if (language == "India") {
      return "hi";
    } else if (language == "Turkish") {
      return "tr";
    }
    return "--";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.teal,
        title: Text("Langugage Translator"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton<String>(
                        value: langugaeFrom == "From" ? null : langugaeFrom,
                        hint: Text("Select Language"),
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: langugages.map((luuqadaha) {
                          return DropdownMenuItem<String>(
                            value: luuqadaha["name"],
                            child: Row(
                              children: [
                                Text(
                                  luuqadaha["name"]!,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                CountryFlag.fromCountryCode(
                                  shape: Circle(),
                                  height: 35,
                                  width: 35,
                                  luuqadaha["flag"]!,
                                )
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            langugaeFrom = value!;
                          });
                        },
                      ),
                      Icon(Icons.arrow_right_alt_outlined, color: Colors.black),
                      DropdownButton<String>(
                        value: langugaeTo == "To" ? null : langugaeTo,
                        hint: Text("Select Language"),
                        items: langugages.map((lang) {
                          return DropdownMenuItem(
                              value: lang["name"],
                              child: Row(
                                children: [
                                  Text(lang["name"]!),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CountryFlag.fromCountryCode(
                                    lang["flag"]!,
                                    height: 35,
                                    width: 35,
                                    shape: Circle(),
                                  )
                                ],
                              ));
                        }).toList(),
                        onChanged: (value) {
                          setState(
                            () {
                              langugaeTo = value!;
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 250,
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      offset: Offset(4, 3),
                      color: Colors.black.withOpacity(0.15),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: langugageController,
                      decoration: InputDecoration(
                        hintText: "Enter Text to translate",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                    Spacer(),
                    Divider(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.copy),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.store),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  translate(getLanguageCode(langugaeFrom),
                      getLanguageCode(langugaeTo), langugageController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Translate",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 250,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      offset: Offset(4, 3),
                      color: Colors.black.withOpacity(0.15),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      output,
                      style: TextStyle(fontSize: 17),
                    ),
                    Spacer(),
                    Divider(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_outline),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.share_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
