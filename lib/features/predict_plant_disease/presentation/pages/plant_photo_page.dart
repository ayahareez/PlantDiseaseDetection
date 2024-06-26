import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:plant_disease/features/auth/presentation/bloc/auth_bloc/authentication_bloc.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/widgets/instruction_dialog.dart';
import 'package:plant_disease/features/auth/presentation/pages/login_page.dart';
import 'chatPot.dart';
import 'localization.dart';  // استيراد صفحة Localization

class PlantPhotoPage extends StatefulWidget {
  const PlantPhotoPage({Key? key}) : super(key: key);

  @override
  State<PlantPhotoPage> createState() => _PlantPhotoPageState();
}

class _PlantPhotoPageState extends State<PlantPhotoPage> {
  String selectedPlant = '';
  String searchQuery = '';
  List<String> plantNames = [
    'Apple',
    'Strawberry',
    'Potato',
    'Grape',
    'Peach',
    'Corn',
    'Cherry',
    'Wheat',
    'Pepper',
  ];

  // List of image paths corresponding to each plant
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
  bool isPlantSelected = true; // Add this variable

  @override
  void initState() {
    super.initState();
    filteredPlantNames = plantNames;
    filteredPlantIcons = plantIcons;
  }

  void updateSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredPlantNames = plantNames
          .where((name) => name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      filteredPlantIcons = plantIcons.where((icon) {
        // Extract the plant name from the icon path
        String iconName = icon.split('/').last.split('.').first;
        // Check if the filtered plant names contain the extracted plant name
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
          title: const LocaleText(
            "bezra",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
              icon: Icon(Icons.chat), // Using the chat icon
            ),

            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Localization()),
                );
              },
              icon: Icon(Icons.language),
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
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Color(0xff2d232e)),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      onChanged: updateSearch,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: 16), // Add padding to the GridView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns
                  crossAxisSpacing: 8, // Spacing between columns
                  mainAxisSpacing: 8, // Spacing between rows
                ),
                itemCount: filteredPlantNames.length,
                itemBuilder: (context, index) {
                  final plantType = filteredPlantNames[index];
                  final plantIconPath = filteredPlantIcons[
                  index]; // Get the corresponding image path
                  return GestureDetector(
                    onTap: () {
                      if (selectedPlant == plantType) {
                        deselectPlant(); // Deselect the plant if it's already selected
                      } else {
                        selectPlant(plantType); // Select the plant
                      }
                    },
                    child: Container(
                      padding:
                      EdgeInsets.all(8), // Add padding to the Container
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: selectedPlant == plantType
                            ? Colors.green.withOpacity(0.5)
                            : Colors.grey[200],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(plantIconPath,
                              width: 60,
                              height: 60),
                          SizedBox(height: 4),
                          LocaleText(
                            plantType,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight
                                    .bold), // Adjust size and weight here
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
                height: 16), // Added space between the GridView and the note
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffc8e6c9), // Light red color
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      '* ',
                      style: TextStyle(
                          fontSize: 20, color: Colors.red), // Red star
                    ),
                    const LocaleText(
                      'upload_photo',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white38,
                    // color: Colors.green[100], // Light green color
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
                      color: isPlantSelected
                          ? Colors.grey
                          : Colors
                          .blue, // Disable the icon if a plant is selected
                    ),
                  ),
                ),
                SizedBox(
                  width: 17,
                ),
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
                      color: isPlantSelected
                          ? Colors.grey
                          : Colors.green[
                      500], // Disable the icon if a plant is selected
                    ),
                  ),
                ),
              ],
            )
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
