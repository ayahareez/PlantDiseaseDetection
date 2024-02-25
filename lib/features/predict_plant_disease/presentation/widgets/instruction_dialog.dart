import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_disease/features/predict_plant_disease/data/models/plant_model.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/entities/disease.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/pages/predicted_Result_page.dart';

import '../../../../core/image_picker_helper.dart';
import '../../../../core/storage_helper.dart';
//import '../bloc/disease_bloc.dart';
import '../bloc/disease_bloc/disease_bloc.dart';

Future<void> showInstructionsDialog(BuildContext context,
    void Function(void Function()) setState, String selectedPlant ,bool flag) async {
  File? imageFile;
  String? imageUrl;
  bool flag = false;

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setStateInDialog) {
          return AlertDialog(
            title: const Text(
              'Photo Capture Instructions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('1. Capture a Single Leaf:',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                  Text('- Take a picture of a single leaf from the plant.',
                    style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                  Text('- Make sure it is a clear image and not blurry.',
                    style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),),
                  SizedBox(height: 10),
                  Text('2. Avoid Clutter:',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                  Text(
                    '- Ensure there is no clutter in the background to help the model focus on the leaf.',
                    style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Text('3. No Overlapping Leaves:',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                  Text(
                    '- Do not capture overlapping leaves; the model works best with a single, isolated leaf.',
                    style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Text('4. Corn Plant Specifics:',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                  Text(
                    '- If you are capturing a corn plant, focus on capturing a part of the leaf, not the entire leaf.',
                    style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Text('5. Good Lighting:',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                  Text(
                    '- Ensure there is sufficient lighting for a clear image.',
                    style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Text('6. No Distortions:',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                  Text(
                    '- Avoid any distortions in the image; a straightforward picture works best.',
                    style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Text('7. High-Quality Image:',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                  Text(
                    '- Capture the image in high resolution for accurate disease prediction.',
                    style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () async {
                    if (flag == true)
                      {
                        imageFile =
                        await ImagePickerHelperImpl().pickImageFileFromCamera();
                      }
                    else
                      {
                        imageFile =
                        await ImagePickerHelperImpl().pickImageFileFromGallery();
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
                      'Take Photo',
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
