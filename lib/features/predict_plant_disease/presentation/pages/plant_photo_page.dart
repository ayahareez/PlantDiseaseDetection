import 'package:flutter/material.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/widgets/instruction_dialog.dart';

class PlantPhotoPage extends StatefulWidget {
  const PlantPhotoPage({super.key});
  @override
  State<PlantPhotoPage> createState() => _PlantPhotoPageState();
}

class _PlantPhotoPageState extends State<PlantPhotoPage> {

  List<String> checkboxNames = [
    'Checkbox 1',
    'Checkbox 2',
    'Checkbox 3',
    'Checkbox 4',
    'Checkbox 5',
    'Checkbox 6',
    'Checkbox 7',
    'Checkbox 8',
    'Checkbox 9',
    'Checkbox 10',
  ];
  List<bool> checkboxValues = List.generate(10, (index) => false);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Column(
            children: List.generate(
            checkboxNames.length,
                  (index) => CheckboxListTile(
                title: Text(checkboxNames[index]),
                value: checkboxValues[index],
                onChanged: (value) {
                  // You can add any additional logic here if needed
                  // For simplicity, we are just updating the state
                  setState(() {
                    checkboxValues[index] = value!;
                  });
                },
              ),
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
                          showInstructionsDialog(context, setState);
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
                          showInstructionsDialog(context, setState);
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
    );
  }
}