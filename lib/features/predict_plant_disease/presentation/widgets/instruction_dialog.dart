import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:plant_disease/features/predict_plant_disease/data/models/plant_model.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/entities/disease.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/pages/predicted_Result_page.dart';

import '../../../../core/image_picker_helper.dart';
import '../../../../core/storage_helper.dart';
//import '../bloc/disease_bloc.dart';
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
            title: const LocaleText(
              'photo_instructions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  LocaleText(
                    'instructions1',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  LocaleText(
                    'instructions1.2',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  LocaleText(
                    'instructions1.3',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  LocaleText(
                    'instructions2',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  LocaleText(
                    'instructions2.1',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  LocaleText(
                    'instructions3',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  LocaleText(
                    'instructions3.1',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  LocaleText(
                    'instructions4',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  LocaleText(
                    'instructions4.1',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  LocaleText(
                    'instructions5',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  LocaleText(
                    'instructions5.1',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  LocaleText(
                    'instructions6',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  LocaleText(
                    'instructions6.1',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  LocaleText(
                    'instructions7',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  LocaleText(
                    'instructions7.1',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () async {
                    if (flag == true) {
                      imageFile = await ImagePickerHelperImpl()
                          .pickImageFileFromCamera();
                    } else {
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LocaleText(
                          'take_photo',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.camera_alt,
                          color: Color(0xff2d232e),
                          size: 22,
                        ),
                      ],
                    ),
                  )),
            ],
          );
        },
      );
    },
  );
}