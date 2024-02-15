import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/image_picker_helper.dart';
import '../../../../core/storage_helper.dart';

Future<void> showInstructionsDialog(
    BuildContext context, void Function(void Function()) setState) async {
  File? imageFile;
  String? imageUrl;
  bool flag = false;

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
                    imageFile =
                        await ImagePickerHelperImpl().pickImageFileFromCamera();
                    if (imageFile != null) {
                      imageUrl = await StorageHelperImpl()
                          .uploadImageFromFile(imageFile!);
                      Navigator.of(context).pop();
                      setStateInDialog(() {
                        flag = true;
                      });
                    }
                  },
                  child: const Text(
                    'Take Photo',
                    style: TextStyle(
                      color: Color(0xff2d232e),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  )),
            ],
          );
        },
      );
    },
  );
}