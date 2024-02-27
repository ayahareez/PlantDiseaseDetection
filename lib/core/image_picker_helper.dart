import 'dart:io';
import 'package:image_picker/image_picker.dart';

abstract class ImagePickerHelper {
  Future<File?> pickImageFileFromGallery();
  Future<File?> pickImageFileFromCamera();
}

class ImagePickerHelperImpl extends ImagePickerHelper {
  @override
  Future<File?> pickImageFileFromGallery() => ImagePicker()
      .pickImage(source: ImageSource.gallery)
      .then((file) => file == null ? null : File(file.path));
  @override
  Future<File?> pickImageFileFromCamera() => ImagePicker()
      .pickImage(source: ImageSource.camera)
      .then((file) => file == null ? null : File(file.path));
}