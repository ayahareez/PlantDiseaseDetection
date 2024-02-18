import 'package:flutter/material.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/widgets/instruction_dialog.dart';

class PlantPhotoPage extends StatefulWidget {
  const PlantPhotoPage({super.key});

  @override
  State<PlantPhotoPage> createState() => _PlantPhotoPageState();
}

class _PlantPhotoPageState extends State<PlantPhotoPage> {
  String selectedPlant = '';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: List.generate(
                      plantNames.length,
                      (index) {
                        final plantType = plantNames[index];
                        return RadioListTile<String>(
                          title: Text(plantType),
                          value: plantType,
                          groupValue: selectedPlant,
                          onChanged: (value) {
                            setState(() {
                              selectedPlant = value!;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  Text(
                    'Upload A Photo Of Your Plant\'s leaf ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200]),
                        child: IconButton(
                          onPressed: () {
                            showInstructionsDialog(
                                context, setState, selectedPlant);
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            size: 64,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200]),
                        child: IconButton(
                          onPressed: () {
                            showInstructionsDialog(
                                context, setState, selectedPlant);
                          },
                          icon: Icon(
                            Icons.photo,
                            size: 64,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}