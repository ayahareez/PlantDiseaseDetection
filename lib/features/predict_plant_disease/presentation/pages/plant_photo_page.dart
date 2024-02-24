import 'package:flutter/material.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/widgets/instruction_dialog.dart';

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
    'Tomato',
    'Pepper',
    'Cotton',
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
    'assets/images/tomato.png',
    'assets/images/pepper.png',
    'assets/images/cotton.png',
  ];

  List<String> filteredPlantNames = [];
  List<String> filteredPlantIcons = [];

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
      filteredPlantIcons = plantIcons
          .where((icon) {
        // Extract the plant name from the icon path
        String iconName = icon.split('/').last.split('.').first;
        // Check if the filtered plant names contain the extracted plant name
        return filteredPlantNames.contains(iconName.capitalize());
      })
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Bezra",
            style: TextStyle(
              color: Color(0xffffffff),
              fontWeight: FontWeight.bold, // Making text bold
            ),
          ),
          backgroundColor: Color(0xff4cae50),
          actions: [
            IconButton(
              icon: Icon(
                Icons.menu,
              ),
              onPressed: () {
                // Handle menu icon click here
                // You can open a menu or navigate to another screen
              },
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
                padding: EdgeInsets.symmetric(horizontal: 16), // Add padding to the GridView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns
                  crossAxisSpacing: 8, // Spacing between columns
                  mainAxisSpacing: 8, // Spacing between rows
                ),
                itemCount: filteredPlantNames.length,
                itemBuilder: (context, index) {
                  final plantType = filteredPlantNames[index];
                  final plantIconPath = filteredPlantIcons[index]; // Get the corresponding image path
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPlant = plantType;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8), // Add padding to the Container
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: selectedPlant == plantType
                            ? Colors.green.withOpacity(0.5)
                            : Colors.grey[200],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(plantIconPath, width: 60, height: 60), // Increase size of the image
                          SizedBox(height: 4),
                          Text(
                            plantType,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Adjust size and weight here
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16), // Added space between the GridView and the note
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.green[100], // Light red color
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      '* ',
                      style: TextStyle(fontSize: 20, color: Colors.red), // Red star
                    ),
                    Text(
                      'Upload a Photo Of Your Plant\'s leaf ',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                    onPressed: () {
                      showInstructionsDialog(
                          context, setState, selectedPlant , true);
                    },
                    icon: Icon(
                      Icons.camera_alt,
                      size: 55,
                      color: Colors.blue,
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
                    onPressed: () {
                      showInstructionsDialog(
                          context, setState, selectedPlant,false);
                    },
                    icon: Icon(
                      Icons.photo,
                      size: 55,
                      color: Colors.green[500], // Light green color
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

