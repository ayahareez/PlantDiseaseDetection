import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationPage extends StatefulWidget {
  const LocalizationPage({super.key});

  @override
  State<LocalizationPage> createState() => _LocalizationPageState();
}

class _LocalizationPageState extends State<LocalizationPage> {
  List<String> locales = ["English", "العربی"];
  List<String> localeCodes = ["en", "ar"];
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

  void _changeLocale(BuildContext context, int index) {
    Locale locale = Locale(localeCodes[index]);
    context.setLocale(locale);
    _updateCurrentIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              tr("language"),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(
                  context, true); // Return true to indicate state update
            },
            icon: const Icon(Icons.arrow_back),
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
                    _changeLocale(context, index);
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