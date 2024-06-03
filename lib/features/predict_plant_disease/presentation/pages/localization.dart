import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Localization extends StatefulWidget {
  const Localization({super.key});

  @override
  State<Localization> createState() => _LocalizationState();
}

class _LocalizationState extends State<Localization> {
  List locales = [
    "English",
    "العربی"
  ];

  //Language code use to change language based on code
  List localeCodes = [
    "en",
    "ar"
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadCurrentIndex();
  }

  Future<void> _loadCurrentIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentIndex = prefs.getInt('currentIndex') ?? 0;
    });
  }

  Future<void> _updateCurrentIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentIndex', index);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: LocaleText(
              "Language",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Center(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: locales.length,
            itemBuilder: (context, index) {
              bool selectedLocale = currentIndex == index;
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: selectedLocale ? Colors.green[400] : Colors.grey[500],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  onTap: () {
                    Locales.change(context, localeCodes[index]);
                    _updateCurrentIndex(index);
                  },
                  leading: Icon(
                    selectedLocale ? Icons.check : Icons.language,
                    color: Colors.white,
                  ),
                  title: Text(
                    locales[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
