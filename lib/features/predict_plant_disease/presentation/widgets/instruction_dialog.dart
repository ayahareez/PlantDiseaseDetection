import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_disease/features/predict_plant_disease/data/models/plant_model.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/entities/disease.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/pages/predicted_Result_page.dart';

import '../../../../core/image_picker_helper.dart';

import '../bloc/disease_bloc/disease_bloc.dart';

Future<void> showInstructionsDialog(
    BuildContext context,
    void Function(void Function()) setState,
    String selectedPlant,
    bool flag) async {
  File? imageFile;
  String? imageUrl;

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setStateInDialog) {
          return AlertDialog(
            title: const Text('Photo Capture Instructions'),
            content: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('1. Capture a Single Leaf:'),
                  Text('- Take a picture of a single leaf from the plant.'),
                  Text('- Make sure it is a clear image and not blurry.'),
                  SizedBox(height: 10),
                  Text('2. Avoid Clutter:'),
                  Text(
                      '- Ensure there is no clutter in the background to help the model focus on the leaf.'),
                  SizedBox(height: 10),
                  Text('3. No Overlapping Leaves:'),
                  Text(
                      '- Do not capture overlapping leaves; the model works best with a single, isolated leaf.'),
                  SizedBox(height: 10),
                  Text('4. Corn Plant Specifics:'),
                  Text(
                      '- If you are capturing a corn plant, focus on capturing a part of the leaf, not the entire leaf.'),
                  SizedBox(height: 10),
                  Text('5. Good Lighting:'),
                  Text(
                      '- Ensure there is sufficient lighting for a clear image.'),
                  SizedBox(height: 10),
                  Text('6. No Distortions:'),
                  Text(
                      '- Avoid any distortions in the image; a straightforward picture works best.'),
                  SizedBox(height: 10),
                  Text('7. High-Quality Image:'),
                  Text(
                      '- Capture the image in high resolution for accurate disease prediction.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () async {
                    if (flag == true) {
                      imageFile = await ImagePickerHelperImpl()
                          .pickImageFileFromCamera();
                    } else if (flag == false) {
                      imageFile = await ImagePickerHelperImpl()
                          .pickImageFileFromGallery();
                    }

                    if (imageFile != null) {
                      // imageUrl = await StorageHelperImpl()
                      //     .uploadImageFromFile(imageFile!);
                      PlantModel plantModel = PlantModel(
                          plantName: selectedPlant.toLowerCase(),
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
                    }
                  },
                  child: const Center(
                    child: Text(
                      'Take a Photo',
                      style: TextStyle(
                        color: Color(0xff2d232e),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  )),
            ],
          );
        },
      );
    },
  );
}