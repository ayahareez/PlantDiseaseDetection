import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_disease/features/auth/presentation/bloc/auth_bloc/authentication_bloc.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/pages/localization_page.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/widgets/instruction_dialog.dart';

import '../../../auth/presentation/pages/login_page.dart';
import 'chatPot_page.dart';

class PlantPhotoPage extends StatefulWidget {
  const PlantPhotoPage({Key? key}) : super(key: key);

  @override
  State<PlantPhotoPage> createState() => _PlantPhotoPageState();
}

class _PlantPhotoPageState extends State<PlantPhotoPage> {
  String selectedPlant = '';
  String searchQuery = '';
  List<String> plantNames = [];
  List<String> plantIcons = [
    'assets/images/apple.png',
    'assets/images/strawberry.png',
    'assets/images/potato.png',
    'assets/images/grape.png',
    'assets/images/peach.png',
    'assets/images/corn.png',
    'assets/images/cherry.png',
    'assets/images/wheat.png',
    'assets/images/pepper.png',
  ];

  List<String> filteredPlantNames = [];
  List<String> filteredPlantIcons = [];
  bool isPlantSelected = true;

  @override
  void initState() {
    super.initState();
    initializePlantNames();
  }

  void initializePlantNames() {
    setState(() {
      plantNames = [
        tr('apple'),
        tr('strawberry'),
        tr('potato'),
        tr('grape'),
        tr('peach'),
        tr('corn'),
        tr('cherry'),
        tr('wheat'),
        tr('pepper'),
      ];
      filteredPlantNames = plantNames;
      filteredPlantIcons = plantIcons;
    });
  }

  void updateSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredPlantNames = plantNames
          .where((name) => name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      filteredPlantIcons = plantIcons.where((icon) {
        String iconName = icon.split('/').last.split('.').first;
        return filteredPlantNames.contains(iconName.capitalize());
      }).toList();
    });
  }

  void selectPlant(String plantType) {
    setState(() {
      selectedPlant = plantType;
      isPlantSelected = false;
    });
  }

  void deselectPlant() {
    setState(() {
      selectedPlant = '';
      isPlantSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            tr("bezra"),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LocalizationPage()),
              );
              if (result == true) {
                initializePlantNames();
              }
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()),
                );
              },
              icon: const Icon(Icons.chat),
            ),
            BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is UnAuthorized) {
                  Navigator.popUntil(
                    context,
                    (_) => false,
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                }
              },
              child: IconButton(
                  onPressed: () {
                    context.read<AuthenticationBloc>().add(SignOutEvent());
                  },
                  icon: const Icon(Icons.logout)),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Color(0xff2d232e)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      onChanged: updateSearch,
                      decoration: InputDecoration(
                        hintText: tr('search'),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: filteredPlantNames.length,
                itemBuilder: (context, index) {
                  final plantType = filteredPlantNames[index];
                  final plantIconPath = filteredPlantIcons[index];
                  return GestureDetector(
                    onTap: () {
                      if (selectedPlant == plantType) {
                        deselectPlant();
                      } else {
                        selectPlant(plantType);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: selectedPlant == plantType
                            ? Colors.green.withOpacity(0.5)
                            : Colors.grey[200],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(plantIconPath, width: 60, height: 60),
                          const SizedBox(height: 4),
                          Text(
                            plantType,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffc8e6c9),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const Text(
                      '* ',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    Text(
                      tr('upload_photo'),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white38,
                  ),
                  child: IconButton(
                    onPressed: isPlantSelected
                        ? null
                        : () {
                            showInstructionsDialog(
                                context, setState, selectedPlant, true);
                          },
                    icon: Icon(
                      Icons.camera_alt,
                      size: 55,
                      color: isPlantSelected ? Colors.grey : Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(width: 17),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white38,
                  ),
                  child: IconButton(
                    onPressed: isPlantSelected
                        ? null
                        : () {
                            showInstructionsDialog(
                                context, setState, selectedPlant, false);
                          },
                    icon: Icon(
                      Icons.photo,
                      size: 55,
                      color: isPlantSelected ? Colors.grey : Colors.green[500],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}