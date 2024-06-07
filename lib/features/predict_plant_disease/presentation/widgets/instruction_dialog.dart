import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_disease/core/image_picker_helper.dart';
import 'package:plant_disease/core/networks/network_info.dart';
import 'package:plant_disease/features/predict_plant_disease/data/models/plant_model.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/bloc/disease_bloc/disease_bloc.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/pages/predicted_Result_page.dart';

Future<void> showInstructionsDialog(
    BuildContext context,
    void Function(void Function()) setState,
    String selectedPlant,
    bool flag) async {
  File? imageFile;
  String? imageUrl;
  final Map<String, String> plantNameMap = {
    'تفاح': 'apple',
    'فراولة': 'strawberry',
    'بطاطس': 'potato',
    'عنب': 'grape',
    'خوخ': 'peach',
    'ذرة': 'corn',
    'كرز': 'cherry',
    'قمح': 'wheat',
    'فلفل': 'pepper',
  };

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setStateInDialog) {
          return AlertDialog(
// <<<<<<< HEAD
//             title: const LocaleText(
//               'photo_instructions',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             content: const SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   LocaleText(
//                     'instructions1',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   LocaleText(
//                     'instructions1.2',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15),
//                   ),
//                   LocaleText(
//                     'instructions1.3',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15),
//                   ),
//                   SizedBox(height: 10),
//                   LocaleText(
//                     'instructions2',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   LocaleText(
//                     'instructions2.1',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15),
//                   ),
//                   SizedBox(height: 10),
//                   LocaleText(
//                     'instructions3',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   LocaleText(
//                     'instructions3.1',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15),
//                   ),
//                   SizedBox(height: 10),
//                   LocaleText(
//                     'instructions4',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   LocaleText(
//                     'instructions4.1',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15),
//                   ),
//                   SizedBox(height: 10),
//                   LocaleText(
//                     'instructions5',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   LocaleText(
//                     'instructions5.1',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15),
//                   ),
//                   SizedBox(height: 10),
//                   LocaleText(
//                     'instructions6',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   LocaleText(
//                     'instructions6.1',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15),
//                   ),
//                   SizedBox(height: 10),
//                   LocaleText(
//                     'instructions7',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   LocaleText(
//                     'instructions7.1',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15),
//                   ),
//                 ],
// =======
            title: Padding(
              padding: EdgeInsets.only(
                top: 32,
              ),
              child: Text(
                tr('Snap Tips'),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            content: Column(
              children: [
                SizedBox(height: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CorrectExample(),
                      SizedBox(height: 64),
                      IncorrectExamples(),
                    ],
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff38b000),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () async {
                    if (flag == true) {
                      imageFile = await ImagePickerHelperImpl()
                          .pickImageFileFromCamera();
                    } else {
                      imageFile = await ImagePickerHelperImpl()
                          .pickImageFileFromGallery();
                    }

                    if (imageFile != null) {
                      String selectedPlantEnglish = selectedPlant;
                      if (plantNameMap.containsKey(selectedPlant)) {
                        selectedPlantEnglish = plantNameMap[selectedPlant]!;
                      }

                      PlantModel plantModel = PlantModel(
                          plantName: selectedPlantEnglish.toLowerCase(),
                          image: imageFile!,
                          id: 0);
                      context.read<DiseaseBloc>().add(AddPhotoEvent(
                          imageUrl: imageFile!,
                          plantName: plantModel.plantName));
                      Navigator.of(context).pop();
                      setStateInDialog(() {
                        flag = true;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PredictedResultPage(plantModel: plantModel)));
                    } // Close the dialog
                  },
// <<<<<<< HEAD
//                   child: const Center(
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         LocaleText(
//                           'take_photo',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 22,
//                           ),
//                         ),
//                         SizedBox(width: 8),
//                         Icon(
//                           Icons.camera_alt,
//                           color: Color(0xff2d232e),
//                           size: 22,
//                         ),
//                       ],
//                     ),
//                   )),
// =======
                  child: Text(
                    tr('continue'),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

class CorrectExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/images/healthy.jpg'),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }
}

class IncorrectExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IncorrectExample(
            imagePath: 'assets/images/too close.jpeg',
            label: tr('Too close'),
          ),
          SizedBox(
            width: 8,
          ),
          IncorrectExample(
            imagePath: 'assets/images/too far.PNG',
            label: tr('Too far'),
          ),
          SizedBox(
            width: 5,
          ),
          IncorrectExample(
            imagePath: 'assets/images/multiple.jpg',
            label: tr('Multiple species'),
          ),
        ],
      ),
    );
  }
}

class IncorrectExample extends StatelessWidget {
  final String imagePath;
  final String label;

  IncorrectExample({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(imagePath),
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}